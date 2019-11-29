<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="classes.Student"%>
<!DOCTYPE html>
<html>
<head>
<title>Change Password Student -> Khokar Public School</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

 
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html, body, h1, h2, h3, h4, h5 {font-family: "Open Sans", sans-serif}



</style>
<style>
#homeworkbox{

width:70%;
margin-right:40px;
position:relative;
}
<!--calendar-->

		
			body { width: 10%; height: 480; margin: 20, auto; }
			#calWrapper { width: 100%; margin: 0 5; border: 1px solid #ccc; }
			.dayCell { width: 40px; height: 40px; font-size: 11px; vertical-align: top; text-align: right; background-color: aliceblue;font-family: "Open Sans", sans-serif}
			.dayHeader { 
				width: 40px;
				height: 20px; 
				background-color: rgb(67,87,97);
				color:white;
				
				font-family: "Open Sans", sans-serif
			}
			.today { border: 2px solid rgb(77,99,111);}
		



@media screen and (max-width:1367px){

#date01{
width:21%;
}

}
@media screen and (max-width:959px){
#date01{
width:21%;
}
@media screen and (max-width:640px){
#date01{
width:21%;
}
@media screen and (max-width:300px){
#date01{
width:21%;
}
}



</style>
</head>
<body class="w3-theme-l5" onload="LoadInfo()">
						
						
						<%  
						response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
						 	response.setHeader("Cache-Control","no-store");
						 	response.setHeader("Pragma","no-cache");
						  	response.setDateHeader ("Expires", 0);
						  if(session.getAttribute("std_obj")==null)
						  {
						      response.sendRedirect("index.jsp");
							  
						  }
							
						  HttpSession sess = request.getSession();
							Student s1;
							s1 = (Student)sess.getAttribute("std_obj");
						
								
																				%>
							
						
<!-- Navbar -->
<div class="w3-top">
 <div class="w3-bar  w3-left-align w3-large"  style="background-color:#3333ff;color:white">
  <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
  <a href="student_homepage.jsp" class="w3-bar-item w3-button w3-padding-large " id="logo" style="background-color:#3a4b53;"><i class="fa fa-home w3-margin-right"></i>Home</a>
  <a href="viewMarks.jsp"  class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="View your marks" id="marks">Marks</a>
  <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Account Settings" id="attendence">Attendance</a>
  <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Messages" id="Timetable">Time Table</a>
  
  <div class="w3-dropdown-hover w3-hide-small" style="">
    <button class="w3-button w3-padding-large" title="Notifications"><img src="profileIcon.png" class="w3-circle" style="height:27px;width:27px"></button>     
    <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px; ">
      <a href="changeStudentPassword.jsp" class="w3-bar-item w3-button">Change Password</a>
	  <a href="getRequests?work_to_do=signout_student" class="w3-bar-item w3-button">Sign Out</a>
    </div>
  </div>
 
  
  </div>
  </div>

<!-- Navbar on small screens -->
<div id="navDemo" class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium w3-large">
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 1</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 2</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 3</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">My Profile</a>
</div>
			
			
			
<!-- Page Container -->
<div class="w3-container w3-content" style="max-width:1400px;margin-top:80px">  

	  
  <!-- The Grid -->
  <div class="w3-row">
    <!-- Left Column -->
    <div class="w3-col m3">
      <!-- Profile -->
      <div class="w3-card w3-round w3-white" style="width:100%;margin-left:0px">
        <div class="w3-container">
         <h4 class="w3-center">My Profile</h4>
         <p class="w3-center"><img id="profileImage" src="proFemale.png" class="w3-circle" style="height:106px;width:106px" alt="Avatar"></p>
         <hr>
         
         
         
         
         <div id="std_basic_info">
         
         
         </div>
         
         
         
        </div>
      </div>
      <br>
      
      <!-- Accordion -->
      
      <br>
      
      <!-- Interests --> 
      <div class="w3-card w3-round w3-white w3-hide-small" style="background-color:none">
          <h3> <span id="dateHolder" style="margin-left:35%" /></span></h3>
	
	<table id="calWrapper">
	</table>
      </div>
      <br>
      
      <!-- Alert Box -->
      
    
    <!-- End Left Column -->
    </div>
    
    <!-- Middle Column -->
    <div class="w3-col m7" style="margin-left:0px">
    
      <div  class="w3-row-padding" >
        <div class="w3-col m12" >
          <div class="w3-card w3-round w3-white" >
            <div class="w3-container w3-padding" >
              <div class="background-white p20 mb30">
    <h3 class="page-title">
        											Remove Employee

        <a href="#" class="btn btn-primary btn-xs pull-right" onclick="UpdatePass()" title="Remove Student's complete data">Update Password</a>
    </h3>

    <div class="row">
        <div class="form-group col-sm-12">
            <label>Old Password</label>
            <input type="password" placeholder="Enter your old password" class="form-control" value="" id="old_pass">
        </div><!-- /.form-group -->

       
		
		
        <div class="form-group col-sm-6">
            <label>New Password</label>
            <input type="password" placeholder="Enter new password" class="form-control" value="" id="new_pass" >
        </div><!-- /.form-group -->

        <div class="form-group col-sm-6">
            <label>New Password</label>
            <input type="password" placeholder="Re-enter your new password" class="form-control" value="" id="confirm_pass" >
        </div><!-- /.form-group -->
		
		
		
    </div><!-- /.row -->
</div>
            </div>
          </div>
        </div>
      </div>
      
     <div id="homework">

      
      
       
    </div>
    
    <!-- End Middle Column -->
    </div>
    
    
    
  <!-- End Grid -->
  
  
<!-- End Page Container -->
</div>
<br>

<!-- Footer -->
<footer class="w3-container w3-theme-d3 w3-padding-16">
  <h5>Footer</h5>
</footer>

<footer class="w3-container w3-theme-d5">
  <p>Powered by G4Tech</p>
</footer>
 
<script>
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
						/// My Script Begins
function LoadInfo()
{
	var name = "<%=s1.getName() %>";
	var email = "<%= s1.getStudentID()%>";
	var standard = "<%= s1.getClassSection()%>";
	var gender = "<%= s1.getGender()%>";
	
	document.getElementById("std_basic_info").innerHTML = " <p><i class=\"fa fa-pencil fa-fw w3-margin-right w3-text-theme\"></i>" + name + "</p>" +
   "<p><i class=\"fa fa-graduation-cap fa-fw w3-margin-right w3-text-theme\"></i>" + standard + "</p>" + 
     "<p><i class=\"fa fa-id-card-o fa-fw w3-margin-right w3-text-theme\"></i>" + email  + "</p>";
	
    	
   	if (gender == "M")
   	 	document.getElementById('profileImage').src = 'student_male.png';
    else
   		document.getElementById('profileImage').src = 'student_female.png';	
  
}


function UpdatePass()
{
	var password_box = document.getElementById('new_pass');
	var upperCaseLetters = /[A-Z]/g;
	var numbers = /[0-9]/g;
	if (password_box.value == null || password_box.value.length < 8 || !password_box.value.match(upperCaseLetters) || !password_box.value.match(numbers))
	{
		password_box.style.backgroundColor = "#B1D7F1";
		alert("Please make sure the password contains atleast 1 number and capital letter");
		return;
	}
	else
		password_box.style.backgroundColor = "";
	
	
	//if password strength is valid check if confirm pass is same as new pass
	var confirm_pass = document.getElementById('confirm_pass');
	if (confirm_pass.value != password_box.value)
	{
		confirm_pass.style.backgroundColor = "#B1D7F1";
		return;
	}
	else
		confirm_pass.style.backgroundColor = "";
	
	//if confirm pass is same as new pass check if old password is not equal to new pass
	var old_password = document.getElementById('old_pass').value;
	if (old_password == confirm_pass.value)
		alert("Old password and new password cannot be same");
	
	//now changing password after all the checks have passed
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	if (this.readyState == 4 && this.status == 200) {
		var str = this.responseText;
			if (str != "")
				alert(str);
		}
	};
	xhttp.open("GET", "RealtimeData?work_to_do=change_pass_std&new_pass=" + confirm_pass.value + "&old_pass=" + old_password, true);
	xhttp.send();
}



						/// My Script ENDS
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Accordion
function myFunction(id) {
  var x = document.getElementById(id);
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
    x.previousElementSibling.className += " w3-theme-d1";
  } else { 
    x.className = x.className.replace("w3-show", "");
    x.previousElementSibling.className = 
    x.previousElementSibling.className.replace(" w3-theme-d1", "");
  }
}

// Used to toggle the menu on smaller screens when clicking on the menu button
function openNav() {
  var x = document.getElementById("navDemo");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else { 
    x.className = x.className.replace(" w3-show", "");
  }
}

(function(){
			var today = new Date();
			var month,day,year,firstDay;
			month = today.getMonth();
			day = today.getDate()-1;
			year = today.getFullYear();
			
			firstDay = new Date(year,month,1);
			
			var months = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
			var days = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];
			
			function displayDate() {
				var holder = document.getElementById("dateHolder");
				holder.innerText = months[month] + ' ' + year;
			}
			
			function createDayHeaders() {
				var wrapper = document.getElementById("calWrapper");
				var row = document.createElement("tr");
				for(var i = 0; i<days.length; i++) {
					var el = document.createElement("th");
					el.setAttribute("class","dayHeader");
					el.innerText = days[i];
					row.appendChild(el);
				}
				wrapper.appendChild(row);
			}
			
			function createDayCells() {
				var dayOne = firstDay.getDay();
				var iDay = 0;
				
				var wrapper = document.getElementById("calWrapper");
				var lastDay = new Date(year,month+1,0).getDate();
				
				while(iDay < lastDay) {
					var row = document.createElement("tr");
					for(var i = 0; i<days.length; i++) {
						var el = document.createElement("td");
						if(dayOne === i || iDay > 0) {
							if(day === iDay)
								el.setAttribute("class", "dayCell today");
							else
								el.setAttribute("class", "dayCell");
								
							if(iDay < lastDay)
								iDay++;
							else
								break;
							el.innerText = iDay;
						}
						row.appendChild(el);
					}
					wrapper.appendChild(row);
				}
			}
			
			displayDate(today);
			createDayHeaders();
			createDayCells();
		})();

			
</script>
</body>
<style>

#homeworkbox{
width:70%;
margin-right:40px;
position:relative;
}
<!--calendar-->

		
			body { width: 10%; height: 480; margin: 20, auto; }
			#calWrapper { width: 100%; margin: 0 5; border: 1px solid #ccc; }
			.dayCell { width: 40px; height: 40px; font-size: 11px; vertical-align: top; text-align: right; background-color: aliceblue;font-family: "Open Sans", sans-serif}
			.dayHeader { 
				width: 40px;
				height: 20px; 
				background-color: #3333ff;
				color:white;
				
				font-family: "Open Sans", sans-serif
			}
			.today { border: 2px solid #3333ff;}
		
#marks:visited{color:white;}
#attendence:visited{color:white;}
#Timetable:visited{color:white;}
#logo:visited{color:white;}


@media screen and (max-width:1367px){
#date01{
width:15%;
}

}
@media screen and (max-width:959px){
#date01{
width:15%;
}
@media screen and (max-width:640px){
#date01{
width:15%;
}
@media screen and (max-width:300px){
#date01{
width:15%;
}


</style>
</html> 