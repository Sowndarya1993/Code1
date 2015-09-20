using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Windows.Forms;
using Microsoft.VisualBasic.FileIO;
using System.Data;
using System.Dynamic;
using System.Text;
using Microsoft.Office.Interop.Excel;
using System.Text.RegularExpressions;

public class CsvReader
{
    private const char Sym_Escape = '"';

    private static int StandardInitialRowSize = 16;

    private StreamReader reader;
    private char delimiter;
    private char[] buffer;
    private int bufferSize;
    private int bufferBound;
    private int bufferPos;
    private bool endReached;
    private bool boundReached;
    private bool returnImplicitRow;
    private int initialRowSize;
    private int valuePos;
    private StringBuilder valueBuilder;

    public CsvReader(Stream stream, char delimiter = ',', int bufferSize = 4096)
    {
        #region check
        if (stream == null)
        {
            throw new ArgumentNullException("stream");
        }

        if (delimiter == Sym_Escape || delimiter == '\r')
        {
            throw new ArgumentException("Invalid delimiter", "delimiter");
        }

        if (bufferSize < 128)
        {
            throw new ArgumentException("Invalid buffer size", "bufferSize");
        }
        #endregion

        this.reader = new StreamReader(stream, Encoding.UTF8, true, bufferSize);
        this.delimiter = delimiter;
        this.buffer = new char[bufferSize];
        this.bufferSize = bufferSize;
        this.initialRowSize = StandardInitialRowSize;
        this.valueBuilder = new StringBuilder(128);

        if (reader.BaseStream.Length == 0)
        {
            returnImplicitRow = true;
        }
    }

    public bool Read(out string[] outRow)
    {
        Assert();

        if (endReached)
        {
            if (returnImplicitRow)
            {
                returnImplicitRow = false;
                outRow = new string[1];

                return true;
            }
            else
            {
                outRow = null;

                return false;
            }
        }

        string[] row = new string[initialRowSize];
        int rowSize = initialRowSize;
        int rowPos = 0;

        bool newlineReached = false;

        do
        {
            Assert();

            if (endReached)
            {
                goto SetValue;
            }

            char chr = buffer[bufferPos++];

            if (chr == Sym_Escape)
            {
                Assert();

                if (endReached)
                {
                    goto SetValue;
                }

                valuePos = bufferPos;
                chr = buffer[bufferPos++];

                while (true)
                {
                    #region Regular assertion
                    if (bufferPos == bufferBound)
                    {
                        valueBuilder.Append(buffer, valuePos, (bufferPos - valuePos) - 1);

                        if (reader.EndOfStream)
                        {
                            endReached = true;
                        }
                        else
                        {
                            bufferBound = reader.Read(buffer, 0, bufferSize);
                            bufferPos = 0;
                            valuePos = 0;
                        }

                        boundReached = true;
                    }
                    else
                    {
                        boundReached = false;
                    }
                    #endregion

                    if (chr == Sym_Escape)
                    {
                        if (endReached)
                        {
                            goto SetValue;
                        }

                        chr = buffer[bufferPos];

                        if (chr == Sym_Escape)
                        {
                            if (boundReached)
                            {
                                valueBuilder.Append(Sym_Escape);
                            }
                            else
                            {
                                valueBuilder.Append(buffer, valuePos, bufferPos - valuePos);
                            }

                            bufferPos++;
                            valuePos = bufferPos;

                            Assert();
                        }
                        else
                        {
                            if (!boundReached)
                            {
                                valueBuilder.Append(buffer, valuePos, (bufferPos - valuePos) - 1);
                                valuePos = bufferPos;
                            }

                            bufferPos++;

                            break;
                        }
                    }
                    else if (boundReached)
                    {
                        valueBuilder.Append(chr);
                    }

                    if (endReached)
                    {
                        goto SetValue;
                    }

                    chr = buffer[bufferPos++];
                }
            }

            while (true)
            {
                #region Regular assertion
                if (bufferPos == bufferBound)
                {
                    valueBuilder.Append(buffer, valuePos, (bufferPos - valuePos) - 1);

                    if (reader.EndOfStream)
                    {
                        endReached = true;
                    }
                    else
                    {
                        bufferBound = reader.Read(buffer, 0, bufferSize);
                        bufferPos = 0;
                        valuePos = 0;
                    }

                    boundReached = true;
                }
                else
                {
                    boundReached = false;
                }
                #endregion

                if (chr == delimiter)
                {
                    if (!boundReached)
                    {
                        valueBuilder.Append(buffer, valuePos, (bufferPos - valuePos) - 1);
                        valuePos = bufferPos;
                    }

                    endReached = false;

                    break;
                }
                else if (chr == '\r' && !endReached && buffer[bufferPos] == '\n')
                {
                    if (!boundReached)
                    {
                        valueBuilder.Append(buffer, valuePos, (bufferPos - valuePos) - 1);
                    }

                    bufferPos++;
                    valuePos = bufferPos;

                    Assert();

                    if (endReached)
                    {
                        returnImplicitRow = true;
                    }

                    newlineReached = true;

                    break;
                }
                else if (boundReached)
                {
                    valueBuilder.Append(chr);
                }

                if (endReached)
                {
                    break;
                }

                chr = buffer[bufferPos++];
            }

        SetValue:
            if (rowPos == rowSize)
            {
                rowSize *= 2;
                Array.Resize(ref row, rowSize);
            }

            row[rowPos++] = valueBuilder.ToString();
            valueBuilder.Length = 0;
        }
        while (!endReached && !newlineReached);

        if (rowPos < rowSize)
        {
            Array.Resize(ref row, rowPos);
        }

        outRow = row;

        initialRowSize = rowPos;

        return true;
    }

    private void Assert()
    {
        if (bufferPos == bufferBound)
        {
            if (reader.EndOfStream)
            {
                endReached = true;
            }
            else
            {
                bufferBound = reader.Read(buffer, 0, bufferSize);
                bufferPos = 0;
                valuePos = 0;
            }

            boundReached = true;
        }
        else
        {
            boundReached = false;
        }
    }
}

public partial class CSVForm : System.Web.UI.Page
{


    private static Microsoft.Office.Interop.Excel.ApplicationClass appExcel;
    private static Workbook newWorkbook = null;
    private static _Worksheet objsheet = null;
    //Method to initialize opening Excel
	 static void excel_init(String path)
	 {
         //string slash = @"\\";
         //slash = Regex.Escape(slash);
         //string singleslash = @"/";
         //path = Regex.Replace(slash,path,singleslash);
        // path = "@" + path;
        // path = path.Replace("\\","\\");
		 appExcel = new Microsoft.Office.Interop.Excel.ApplicationClass();

		 if (System.IO.File.Exists(path))
		 {
			 // then go and load this into excel
			 newWorkbook = appExcel.Workbooks.Open(path, true, true);
			 objsheet = (_Worksheet)appExcel.ActiveWorkbook.ActiveSheet;
		 }
		 else
		 {
			 MessageBox.Show("Unable to open file!");
			 System.Runtime.InteropServices.Marshal.ReleaseComObject(appExcel);
			 appExcel = null;
			 System.Windows.Forms.Application.Exit();
		 }
		
	 }
     static string excel_getValueInExcel(string val)
     {
         string value = string.Empty;
         try
         {
             Microsoft.Office.Interop.Excel.Range Range_Number, r2;
            // Range_Number = objsheet.UsedRange.Find(val);
             Range_Number = objsheet.UsedRange.Find(val);

             r2 = objsheet.Cells;

             int n_c = Range_Number.Column;
             int n_r = Range_Number.Row;
             var number = ((Range)r2[n_r + 1, n_c]).Value;

             value = (string)number;
             //value = objsheet.get_Range(Workbook).Find(val);
         }
         catch
         {
             value = "";
         }

         return value;
     }
	 //Method to get value; cellname is A1,A2, or B1,B2 etc...in excel.
	 static string excel_getValue(string cellname)
	 {
		 string value = string.Empty;
		 try
		 {
			 value = objsheet.get_Range(cellname).get_Value().ToString();
		 }
		 catch
		 {
			 value = "";
		 }

		 return value;
	 }

	 //Method to close excel connection
	 static void excel_close()
	 {
		 if (appExcel != null)
		 {
			 try
			 {
				 newWorkbook.Close();
				 System.Runtime.InteropServices.Marshal.ReleaseComObject(appExcel);
				 appExcel = null;
				 objsheet = null;
			 }
			 catch (Exception ex)
			 {
				 appExcel = null;
				 MessageBox.Show("Unable to release the Object " + ex.ToString());
			 }
			 finally
			 {
				 GC.Collect();
			 }
		 }
	 }
protected void Page_Load(object sender, EventArgs e)
{
    
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        FileUpload1.SaveAs(@"C:\Users\VITTAL\Documents\Visual Studio 2012\WebSites\WebSite1\CSV" + FileUpload1.FileName);

        Response.Write("File Uploaded Successfully");
    }
    
    protected void Button2_Click(object sender, EventArgs e)
    {

       // excel_init(@"C:\Users\VITTAL\Documents\Visual Studio 2012\WebSites\WebSite1\CSV\CSVInput.xlsx");
        //string fileBasePath = Server.MapPath("~/");
        //string fileName = Path.GetFileName(this.FileUpload1.FileName);
        //string fullFilePath = fileBasePath + fileName;

        //String fullFilePath = Server.MapPath(FileUpload1.FileName);
        string fullFilePath = System.IO.Path.GetFullPath(FileUpload1.FileName);
        if(fullFilePath!=null)
        excel_init(fullFilePath);
        string val=excel_getValue("A1");
        Response.Write(val);
        excel_close();

       
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        try
        {
            if (TextBox1.Text != null)
            {
                string text = excel_getValueInExcel(TextBox1.Text);
                Response.Write(text);
            }
        }
        catch(Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
}

