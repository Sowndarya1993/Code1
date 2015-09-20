<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <!-- Basic Page Needs
  ================================================== -->
    <meta charset="utf-8">
    <title>CSV</title>
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Mobile Specific Metas
  ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <style>
            @import url(http://fonts.googleapis.com/css?family=Roboto:100);
@import url(http://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.css);

body {
  background: url(http://jsrun.it/assets/p/r/8/X/pr8Xi.png);  /*bg  1a1a1a  434240  */
  color: white;
  font-family: 'Roboto';
}
p{
  color:;
}
input:focus{
  background-color:yellow;
}
.flat-form {
  background: #34495e;  /*tablebg e74c3c #34495e  #88565b ed7271*/
  margin: 25px auto;
  width: 428px;
  height: 454px;
  position: relative;
  font-family: 'Roboto';
                top: -175px;
                left: 5px;
            }
.tabs {
  background: #ed7271;  /*topbar #c0392b #88565b*/
  height: 53px;
  padding: 0;
  list-style-type: none;
  width: 100%;
  position: relative;
  display: block;
  margin-bottom: 20px;
        top: 0px;
        left: 0px;
        margin-left: 0;
        margin-right: 0;
        margin-top: 0;
    }
.tabs li {
  display: block;
  float: left;
  margin: 0;
  padding: 0;
                width: 156px;
            }
.tabs a {
  background: #ed7271;  /*topbar c0392b  #88565b */
  display: block;
  float: left;
  text-decoration: none;
  color: white;
  font-size: 16px;
  padding: 12px 22px 12px 22px;
                width: 224px;
            }
.tabs li:last-child a {
  border-right: none;
  width: 174px;
  padding-left: 0;
  padding-right: 0;
  text-align: center;
}
.tabs a.active {
  background: #ed7271;  /*topbar e74c3c  */
  -webkit-transition: all 0.5s linear;
	-moz-transition: all 0.5s linear;
	transition: all 0.5s linear;
                width: 111px;
                border-right-style: none;
                border-right-color: inherit;
                border-right-width: medium;
            }
.form-action {
  padding: 0 20px;
  position: relative;
}

.form-action h1 {
  font-size: 42px;
  padding-bottom: 10px;
}
.form-action p {
  font-size: 12px;
  padding-bottom: 10px;
  line-height: 25px;
}
form {
  padding-right: 20px !important;
}
form input[type=text],
form input[type=password],
form input[type=submit] {
  font-family: Arial;
}

form input[type=text],
form input[type=password] {
            border-style: none;
                border-color: inherit;
                border-width: medium;
                margin-bottom: 10px;
                padding-left: 15px;
                background: #fff; /* #44454a  */
                color: #000000;   /* e74c3c e9e9e9  */
                outline: none;
}

.dark-box {
  background: #5e0400;
  box-shadow: 1px 3px 3px #3d0100 inset;
  height: 40px;
  width: 50px;
}
.form-action .dark-box.bottom {
  position: absolute;
  right: 0;
  bottom: -24px;
}
.tabs + .dark-box.top {
  position: absolute;
  right: 0;
  top: 0px;
}
.show {
  display: block;
}
.hide {
  display: none;
}

.button {
            border-style: none;
                border-color: inherit;
                border-width: medium;
                display: block;
                background: #136899;
                width: 80px;
                color: #ffffff;
                text-align: center;
                border-radius: 5px;
    /*box-shadow: 0px 3px 1px #2075aa;*/
  	            -webkit-transition: all 0.15s linear;
	            -moz-transition: all 0.15s linear;
	            transition: all 0.15s linear;
}

.button:hover {
  background: #1e75aa;
  /*box-shadow: 0 3px 1px #237bb2;*/
}

.button:active {
  background: #136899;
  /*box-shadow: 0 3px 1px #0f608c;*/
}

::-webkit-input-placeholder {
  color:dark ;    /*  #e74c3c */
}
:-moz-placeholder {
  /* Firefox 18- */
  color: #e74c3c;
}
::-moz-placeholder {
  /* Firefox 19+ */
  color: #e74c3c;
}
:-ms-input-placeholder {
  color: #e74c3c;
}
            .newStyle1 {
                font-weight: bold;
            }
            .newStyle2 {
                font-weight: bold;
            }
            .newStyle3 {
                font-weight: bold;
            }
            .newStyle4 {
                font-weight: bold;
            }
            .newStyle5 {
                font-weight: bold;
            }
        </style>
        <script type="text/javascript">
            $(function () {
                // constants
                var SHOW_CLASS = 'show',
                    HIDE_CLASS = 'hide',
                    ACTIVE_CLASS = 'active';

                $('.tabs').on('click', 'li a', function (e) {
                    e.preventDefault();
                    var $tab = $(this),
                         href = $tab.attr('href');

                    $('.active').removeClass(ACTIVE_CLASS);
                    $tab.addClass(ACTIVE_CLASS);

                    $('.show')
                       .removeClass(SHOW_CLASS)
                       .addClass(HIDE_CLASS)
                       .hide();

                    $(href)
                      .removeClass(HIDE_CLASS)
                      .addClass(SHOW_CLASS)
                      .hide()
                      .fadeIn(550);
                });
            });
        </script>




        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,400">
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Droid+Sans">
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lobster">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/animate.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <link rel="stylesheet" href="assets/flexslider/flexslider.css">
        <link rel="stylesheet" href="assets/css/form-elements.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/media-queries.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="assets/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">


       

        <!-- Page Title -->
        <div class="page-title-container">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 wow fadeIn">
                        <i class="fa fa-tasks"></i>
                        <h1>CSV/</h1>
                        <p>Distributed Notification System</p>
                    </div>
	            <div class="row">

        <div class="flat-form">
            <ul class="tabs">
                <li>
                    <asp:HyperLink ID="hlcsv" runat="server" NavigateUrl="~/Default2.aspx">CSV</asp:HyperLink>
                </li>

            </ul>
            <div id="csv">
                <br/>
                <h1>CSV</h1>
                <p>
                    <strong>Large Scale Scalable Notification System
                </strong>
                </p>
                <form id="form1" runat="server">
                    <ul>
                        <li>
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                        &nbsp;
                            
                        </li>
                        
                        <li>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btn_upload" runat="server" Text="Upload" CssClass="button" Height="32px" Width="87px" OnClick="btn_upload_Click" />
                        </li>
                        <li>
                            <br />
                            <asp:Button ID="btn_cancel" runat="server" Text="Convert" CssClass="button" Height="32px" Width="87px" OnClick="btn_cancel_Click" />
                        </li>
                        <li>
                            <br />
                            <asp:TextBox ID="txt" runat="server" placeholder="TextID" Height="40px" Width="396px"></asp:TextBox>
                        </li>
                        <li>
                            <br />
                            <asp:Button ID="search" runat="server" Text="Search" CssClass="button" Height="32px" Width="87px" OnClick="search_Click" />
                        </li>
                    </ul>
               </form>
            </div>
        
            <!--/#register.form-action-->
            <div id="reset" class="form-action hide">
            
               
            </div>
            <!--/#register.form-action-->
        </div>
    </div>
                </div>
            </div>
        </div>

        <!-- Services Full Width Text -->
        <div class="services-full-width-container">
        	<div class="container">
                         <script class="cssdeck" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>

	        </div>
        </div>


       

        <!-- Javascript -->
        <script src="assets/js/jquery-1.11.1.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/bootstrap-hover-dropdown.min.js"></script>
        <script src="assets/js/jquery.backstretch.min.js"></script>
        <script src="assets/js/wow.min.js"></script>
        <script src="assets/js/retina-1.1.0.min.js"></script>
        <script src="assets/js/jquery.magnific-popup.min.js"></script>
        <script src="assets/flexslider/jquery.flexslider-min.js"></script>
        <script src="assets/js/jflickrfeed.min.js"></script>
        <script src="assets/js/masonry.pkgd.min.js"></script>
        <script src="http://maps.google.com/maps/api/js?sensor=true"></script>
        <script src="assets/js/jquery.ui.map.min.js"></script>
        <script src="assets/js/scripts.js"></script>
</asp:Content>

