<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Khokar School</title>
	
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900" rel="stylesheet">
    <link rel="stylesheet" href="fonts/icomoon/style.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/jquery.fancybox.min.css">
    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="css/aos.css">
    <link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    <link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

  </head>


                                                        <!-- Navigation Bar-->
<header class="site-navbar py-4 js-sticky-header site-navbar-target" role="banner" style="z-index:0;">
<div class="container-fluid">
<div class="d-flex align-items-center">
<div class="site-logo mr-auto w-40"><a href="index.html">KHOKAR School</a></div>

<div class="topnav" id="myTopnav"  >
<div class="mx-auto text-center">
<nav class="site-logo mr-auto w-40 site-navigation position-relative text-right" role="navigation">
  <a href="#home-section" class="nav-link"><i class="fa fa-fw fa-home"></i>Home</a>
  <a href="#aboutUs" class="nav-link"><i class="fa fa-fw fa-globe"></i>About</a>
  <a href="#gallery" class="nav-link"><i class="fa fa-fw fa-th-large"></i>Gallery</a>
  <a href="#footer" class="nav-link"><i class="fa fa-fw fa-phone-square"></i><span>Contact Us</span></a>
<a href="#signIn" onclick="document.getElementById('id01').style.display='block'" class="nav-link"  ><i class="fa fa-fw fa-user"></i>Login</a>
<a href="javascript:void(0);" class="icon" onclick="myFunction()">
<i class="fa fa-bars"></i>
</a>			  
</nav>
</div>
</div>
</div>
</div>
</header>

                                                   <!--BACKGROUND-->
 <body>
	    <div class="intro-section" id="home-section">
      <div style="background-image: url('xxx.jpg');background-size:100% 800px; background-repeat: no-repeat">
        <div class="container">
          <div class="row align-items-center">
            <div class="col-12">
              <div class="row align-items-center">
                <div class="col-lg-6 mb-4">
                  <h1 style="  text-shadow: 2px 2px 5px black;">We Serve By Serving Education</h1>
                  <h3 class="mb-4" style="  text-shadow: 2px 2px 5px white; color:black;">Home of Education.</h3>
                </div>
			<div class="col-lg-5 ml-auto">
		</div></div></div></div></div></div></div>
                                                 <!--Sign in-->
<div id="id01" class="modal" style="width:101.5%;height:101.5% ">
  
  <form class="modal-content animate" action="postRequests" method="post" style="width:65%">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="pro.png" alt="Sign in" class="avatar">
    </div>

    <div class="container">
      <label for="uname"><b>Username</b></label>
      <input type="text" placeholder="Enter Username" name="uname" required>
         
      <label for="psw"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="psw" required>
      <div id="invalid01" style="height:20px;width:100%;background-color:none" align="center"></div>  
      <button type="submit">Login</button>
      <label>
        <input type="checkbox" checked="checked" name="remember"> Remember me
      </label>
      <input type="hidden" name="work_to_do" value="login">
    </div>

    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
      <span class="psw">Forgot <a href="#">password?</a></span>
    </div>
  </form>
</div>

		   
		                                                 <!--GAllery-->

<div  id="gallery" class="site-section" style="background-color: white; margin-top:-200px;">
<h2 class="section-title" align="center">Gallery</h2>
</div>
<div class="w3-content w3-display-container" style="max-width:1400px " >
  <img class="mySlides" src="vvv.jpg" style="width:80%;margin-left:10%">
  <img class="mySlides" src="www.jpg" style="width:80%;margin-left:10%">
  <img class="mySlides" src="zzz.jpg" style="width:80%;margin-left:10%">
  <div class="w3-center w3-container w3-section w3-large w3-text-white w3-display-bottommiddle" style="width:100%">
    <div class="w3-left w3-hover-text-khaki" onclick="plusDivs(-1)">&#10094;</div>
    <div class="w3-right w3-hover-text-khaki" onclick="plusDivs(1)">&#10095;</div>
    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(1)"></span>
    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(2)"></span>
    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(3)"></span>
  </div>
</div>

                               <!--ABOUT Why choose us-->												   
				   <div id="aboutUs" style="margin-top:50px" ></div>
				  <div class="A2" style="background-color:white"> <h2 align="center" style="color:black " class="section-title">About us</h2></div>
				   <div id="box1" style = "box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);"> 
                     <div class="d-flex align-items-center custom-icon-wrap custom-icon-light mb-3">
                <div class="mr-3" ><span class="custom-icon-inner"><span class="icon icon-graduation-cap"></span></span></div>
                <div> <h3 class="m-0">More Than 500 Students</h3></div>
              </div>

              <div class="d-flex align-items-center custom-icon-wrap custom-icon-light mb-3">
                <div class="mr-3" ><span class="custom-icon-inner"><span class="icon icon-university"></span></span></div>
                <div><h3 class="m-0">10 Campuses</h3></div>
              </div>

              <div class="d-flex align-items-center custom-icon-wrap custom-icon-light mb-3">
                <div class="mr-3" ><span class="custom-icon-inner"><span class="icon icon-graduation-cap"></span></span></div>
                <div><h3 class="m-0">Top Professionals in City</h3></div>
              </div>

              <div class="d-flex align-items-center custom-icon-wrap custom-icon-light mb-3">
                <div class="mr-3" ><span class="custom-icon-inner"><span class="icon icon-university"></span></span></div>
                <div><h3 class="m-0">Expand Your Knowledge</h3></div>
              </div>

              <div class="d-flex align-items-center custom-icon-wrap custom-icon-light mb-3">
              <div class="mr-3" ><span class="custom-icon-inner"><span class="icon icon-graduation-cap"></span></span></div>
              <div><h3 class="m-0">Best Online Teaching Assistant Courses</h3></div>
              </div>
              <div class="d-flex align-items-center custom-icon-wrap custom-icon-light">
              <div class="mr-3" ><span class="custom-icon-inner"><span class="icon icon-university"></span></span></div>
              <div><h3 class="m-0">Best Teachers</h3></div>
              </div>
			  </div>
</body>
				                                  <!-- footer-->
		<div id = "footer" ></div>
				   <footer class="footer-distributed">
                <div class="footer-left">
                <h3>Khokar<span>School</span></h3>
                <p class="footer-links">
					<a href="#">Home</a>
					·
					<a href="#">Sign In</a>
					·
					<a href="#">Gallery</a>
					·
					<a href="#">About</a>
					·
					<a href="#">Contact</a>
		</p>
	       <p class="footer-company-name">G4-Tech &copy; 2019</p>
	       </div>
		<div class="footer-center">
				<div>
					<i class="fa fa-map-marker"></i>
					<p><span>21 Revolution Street</span> Johar, Pakistan</p>
				</div>
				<div>
					<i class="fa fa-phone"></i>
					<p>+92 301 1234567</p>
				</div>
				<div>
					<i class="fa fa-envelope"></i>
					<p><a href="mailto:support@company.com">g4tech17@gmail.com</a></p>
				</div>
		</div>
		<div class="footer-right">
				<p class="footer-company-about">
					<span>About the company</span>
					G4-Tech is a company for web designers, graphic designers, web developers &amp; SEO Learner.
				</p>
				<div class="footer-icons">
					<a href="#"><i class="fa fa-facebook"></i></a>
					<a href="#"><i class="fa fa-twitter"></i></a>
					<a href="#"><i class="fa fa-linkedin"></i></a>
					<a href="#"><i class="fa fa-github"></i></a>
				</div>
			</div>
		</footer>
		                                                <!--Footer End-->
														
														
														
														<!--ChatBox-->
<div id = "chatt" ></div>


<div class="chatt2">
<div class="chat-popup" id="myForm">
<iframe
    allow="microphone;"
    width="350"
    height="430"
    src="https://console.dialogflow.com/api-client/demo/embedded/377fc150-8117-4772-a24e-a7d2e813ae18">
</iframe>
</div>


<script>


function showMessage()
{
	
}

var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" w3-white", "");
  }
  x[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " w3-white";
}
</script>
<!--NAV-->
<script>
function openForm() {
  document.getElementById("myForm").style.display = "block";
}

function closeForm() {
  document.getElementById("myForm").style.display = "none";
}
</script>
 </div>
                                                      <!--ChatBoxEnd--> 

  <script src="js/jquery-3.3.1.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/jquery-ui.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/jquery.countdown.min.js"></script>
  <script src="js/bootstrap-datepicker.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.fancybox.min.js"></script>
  <script src="js/jquery.sticky.js"></script>
  <script src="js/main.js"></script>
    
<script>
function myFunction() {
  var x = document.getElementById("myTopnav");
  if (x.className === "topnav") {
    x.className += " responsive";
  } else {
    x.className = "topnav";
  }
}
</script>


<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
<script type="text/javascript">
      /* NOTE : Use web server to view HTML files as real-time update will not work if you directly open the HTML file in the browser. */
      (function(d, m){
        var kommunicateSettings = {"appId":"3a006ba420f41cb2cf42a814a8a1cdb23","popupWidget":true,"automaticChatOpenOnNavigation":true};
        var s = document.createElement("script"); s.type = "text/javascript"; s.async = true;
        s.src = "https://widget.kommunicate.io/v2/kommunicate.app";
        var h = document.getElementsByTagName("head")[0]; h.appendChild(s);
        window.kommunicate = m; m._globals = kommunicateSettings;
      })(document, window.kommunicate || {});
  </script>
  </body>
</html>
<style>
td{
font-family:"Open Sans",sans-serif;
}

#aboutUs{
height:700px;
background-color:white;
margin-top:-70px;
}

#box1{
height:410px;
background-color:white;
width:50%;
margin:auto;
border-radius:10px;
}
.mr-3{
margin-left:20px;
margin-top:5px;

}
.m-0{
color:black;
font-weight:bold;
}
A1{
font-size:50px;
font-weight:bold;
font-family:"Open Sans",sans-serif;

}
.A2{
background-color:white;
margin-top:-650px;
}

h2{
margin-top:60px;
color:black;
font-weight:bold;
font-family:"Open Sans",sans-serif;

}

                                <!--Gallery-->
.mySlides 
{display:none
}
.w3-left, .w3-right, .w3-badge
 {cursor:pointer}
.w3-badge 
{height:13px;width:13px;padding:0
}
.responsive{
  width: 100%;
  height: auto;
}
 

                                       <!--Footer css-->
body {
	margin: 0;
	padding: 0;
}

footer{
	position: static;
	bottom: 0;
}
.footer-distributed{
	background-color: #292c2f;
	box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.12);
	box-sizing: border-box;
	width: 100%;
	text-align: left;
	font: bold 16px sans-serif;
	padding: 55px 50px;
	margin-top: 80px;
}
 
.footer-distributed .footer-left,
.footer-distributed .footer-center,
.footer-distributed .footer-right{
	display: inline-block;
	vertical-align: top;
}
 
.footer-distributed .footer-left{
	width: 40%;
}
 
.footer-distributed h3{
	color:  #ffffff;
	font: normal 36px 'Cookie', cursive;
	margin: 0;
}
 
.footer-distributed h3 span{
	color:  #5383d3;
}
 
 
.footer-distributed .footer-links{
	color:  #ffffff;
	margin: 20px 0 12px;
	padding: 0;
}
 
.footer-distributed .footer-links a{
	display:inline-block;
	line-height: 1.8;
	text-decoration: none;
	color:  inherit;
}
 
.footer-distributed .footer-company-name{
	color:  #8f9296;
	font-size: 14px;
	font-weight: normal;
	margin: 0;
}
 
 
.footer-distributed .footer-center{
	width: 35%;
}
 
.footer-distributed .footer-center i{
	background-color:  #33383b;
	color: #ffffff;
	font-size: 25px;
	width: 38px;
	height: 38px;
	border-radius: 50%;
	text-align: center;
	line-height: 42px;
	margin: 10px 15px;
	vertical-align: middle;
}
 
.footer-distributed .footer-center i.fa-envelope{
	font-size: 17px;
	line-height: 38px;
}
 
.footer-distributed .footer-center p{
	display: inline-block;
	color: #ffffff;
	vertical-align: middle;
	margin:0;
}
 
.footer-distributed .footer-center p span{
	display:block;
	font-weight: normal;
	font-size:14px;
	line-height:2;
}
 
.footer-distributed .footer-center p a{
	color:  #5383d3;
	text-decoration: none;;
}
 
.footer-distributed .footer-right{
	width: 20%;
}
 
.footer-distributed .footer-company-about{
	line-height: 20px;
	color:  #92999f;
	font-size: 13px;
	font-weight: normal;
	margin: 0;
}
 
.footer-distributed .footer-company-about span{
	display: block;
	color:  #ffffff;
	font-size: 14px;
	font-weight: bold;
	margin-bottom: 20px;
}
 
.footer-distributed .footer-icons{
	margin-top: 25px;
}
 
.footer-distributed .footer-icons a{
	display: inline-block;
	width: 35px;
	height: 35px;
	cursor: pointer;
	background-color:  #33383b;
	border-radius: 2px;
 
	font-size: 20px;
	color: #ffffff;
	text-align: center;
	line-height: 35px;
 
	margin-right: 3px;
	margin-bottom: 5px;
}
 
 
@media (max-width: 880px) {
 
	.footer-distributed{
		font: bold 14px sans-serif;
	
	}
 
	.footer-distributed .footer-left,
	.footer-distributed .footer-center,
	.footer-distributed .footer-right{
		display: block;
		width: 100%;
		margin-bottom: 40px;
		text-align: center;
	}
 
	.footer-distributed .footer-center i{
		margin-left: 0;
	}
	
 
}
                                            <!--ChatBox css-->

body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

/* Button used to open the chat form - fixed at the bottom of the page */
.open-button {
  background-color: black;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  opacity: 0.8;
  position: fixed;
  bottom: 23px;
  right: 28px;
  width: 20%;
  margin:auto;
}

/* The popup chat - hidden by default */
.chat-popup {
  display: none;
  position: fixed;
  bottom: 0;
  right: 15px;
  z-index: 9;
  margin:auto;
}

/* Add styles to the form container */
.form-container {
max-width: 300px;
padding: 15px;
background-color: white;
border-radius:15px; 
height: 370px;
margin:auto;
}

/* Full-width textarea */
.form-container textarea {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
  resize: none;
  min-height: 100px;
}

/* When the textarea gets focus, do something */
.form-container textarea:focus {
  background-color: #ddd;
  outline: none;
}

/* Set a style for the submit/send button */
.form-container .btn {
  background-color: blue;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  margin-bottom:10px;
  opacity: 0.8;
}

/* Add a red background color to the cancel button */
.form-container .cancel {
  background-color: red;
}

/* Add some hover effects to buttons */
.form-container .btn:hover, .open-button:hover {
  opacity: 1;
}



                                      <!--Navigation Bar---->

body {
  margin: 0;
font-family:"Open Sans",sans-serif;
}

.topnav {
  overflow: hidden;
}

.topnav a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 22px;
  opacity: 0.7;
}

.topnav a:hover {
  background-color: white;
  color: black;
  
}

.topnav a.active {
  background-color: #f2f2f2;
  color: white;
}

@media screen and (max-width: 600px) {
  .topnav a:not(:first-child) {display: none;}
  .topnav a.icon {
    float: right;
    display: block;
  }
}

@media screen and (max-width: 600px) {
  .topnav.responsive {position: relative;}
  .topnav.responsive .icon {
    position: absolute;
    right: 0;
    top: 0;
  }
  .topnav.responsive a {
    float: none;
    display: block;
    text-align: left;
	
  }
 
}
.topnav:hover{
display:block;

}

                           <!--Sign in-->

body {font-family: Arial, Helvetica, sans-serif;}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

/* Set a style for all buttons */
button {
  background-color: rgb(11,11,100);
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
  float:right;
}

/* Center the image and position the close button */
.imgcontainer {
  text-align: center;
  margin:  10px 0 0 0;
  position: relative;
}

img.avatar {
  width: 20%;
  border-radius: 50%;
}

.container {
  padding: 5px;
}

span.psw {
  float: left;
  padding-top: 16px;
}

/* The Modal (background) */
.modal {
  display: block; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */ /*chnge*/
  height: 100%; /* Full height */
  overflow: scroll; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 20% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 50%; /* Could be more or less, depending on screen size */
  
}

/* The Close Button (x) */
.close {
  position: absolute;
  right: 25px;
  top: 0;
  color: red;
  font-size: 35px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: red;
  cursor: pointer;
}

/* Add Zoom Animation */
.animate {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)} 
  to {-webkit-transform: scale(1)}
}
  
@keyframes animatezoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}</style>


