<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,400">
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Droid+Sans">        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lobster">
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
<!-- Slider -->
        <div class="slider-container">
            <div class="container">
                <div class="row">
                    <div class="col-sm-10 col-sm-offset-1 slider">
                        <div class="flexslider">
                            <ul class="slides">
                                <li data-thumb="assets/img/slider/ama.jpg">
                                    <img src="assets/img/slider/ama.jpg">
                                    <div class="flex-caption">
                                       Today’s talent. Tomorrow’s success.We deliver results.
"We promise what we demand”.Empowering leaders to live life on purpose.
                                    </div>
                                </li>
                                <li data-thumb="assets/img/slider/11.jpg">
                                    <img src="assets/img/slider/11.jpg">
                                    <div class="flex-caption">
We understand your business demands.Smile, you’ve found us.
                                        Leading people. Leading organizations.Improving workplace productivity.
                                    </div>
                                </li>
                                <li data-thumb="assets/img/slider/2.jpg">
                                    <img src="assets/img/slider/2.jpg">
                                    <div class="flex-caption">
                                        Amazon India has the best tech helps at hand and in hand.
The power interface of your mobile brain and our portable machines.The right trainers, the right place, at the right time.
                                    </div>
                                </li>
                                <li data-thumb="assets/img/slider/4.jpg">
                                    <img src="assets/img/slider/4.jpg">
                                    <div class="flex-caption">
A company’s most valuable asset is its employees. “Bringing together hands-on calculators and brains-on people”.
                                        Making the impossible possible.People! Process! Power!
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Presentation -->
        <div class="presentation-container">
        	<div class="container">
        		<div class="row">
	        		<div class="col-sm-12 wow fadeInLeftBig">
	            		<h1>We are <span class="violet">Amazon India</span>, Think Big, Deliver Result</h1>
	            		<p>Your journey begins here.We assure you a rose garden.</p>
	            	</div>
            	</div>
        	</div>
        </div>

        <!-- Services -->
        <div class="services-container">
	        <div class="container">
	            <div class="row">
	            	<div class="col-sm-3">
		                <div class="service wow fadeInUp">
		                    <div class="service-icon"><i class="fa fa-eye"></i></div>
		                    <h3>&nbsp;</h3>
		                    <p>Architecture and Design is the building block. Deliver the results with scalability efficiency and optimization .</p>
		                    <a class="big-link-1" href="services.html">Read more</a>
		                </div>
					</div>
					<div class="col-sm-3">
		                <div class="service wow fadeInDown">
		                    <div class="service-icon"><i class="fa fa-table"></i></div>
		                    <h3>&nbsp;</h3>
		                    <p>Use new ideas and methods. For the most effective use of online testing, it must be built around debugging.</p>
		                    <a class="big-link-1" href="services.html">Read more</a>
		                </div>
	                </div>
	                <div class="col-sm-3">
		                <div class="service wow fadeInUp">
		                    <div class="service-icon"><i class="fa fa-magic"></i></div>
		                    <h3> &nbsp;</h3>
		                    <p>Reliability and resiliency for putting into scenarios and asking for examples is how quality is measured.</p>
		                    <a class="big-link-1" href="services.html">Read more</a>
		                </div>
	                </div>
	                <div class="col-sm-3">
		                <div class="service wow fadeInDown">
		                    <div class="service-icon"><i class="fa fa-print"></i></div>
		                    <h3>&nbsp;</h3>
		                    <p>Gathering information and resources.Weighing the risks and decising on the values. Making the optimal decision.</p>
		                    <a class="big-link-1" href="services.html">Read more</a>
		                </div>
	                </div>
	            </div>
	        </div>
        </div>

      
</asp:Content>

