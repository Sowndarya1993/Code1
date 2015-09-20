<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CSVForm.aspx.cs" Inherits="CSVForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Upload" />
        <br />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Convert" />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Enter text to search"></asp:Label>
&nbsp;
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Search" />
    </div>
    </form>
</body>
</html>
