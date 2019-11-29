<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="classes.Student"%>
<!DOCTYPE html>
<html>
<head>
<title>Student Dashboard -> Khokar Public School</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 
 


  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

 
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html, body, h1, h2, h3, h4, h5 {font-family: "Open Sans", sans-serif}


</style>
</head>
<body class="w3-theme-l5" onload="LoadInfo()">


							<%  
						response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
						 	response.setHeader("Cache-Control","no-store");
						 	response.setHeader("Pragma","no-cache");
						  	response.setDateHeader ("Expires", 0);
					//		session.removeAttribute("emp_obj");
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
         <p class="w3-center"><img id="profileImage" src="" class="w3-circle" style="height:106px;width:106px" alt="Education is the passport to the future"></p>
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
          <h3><span id="dateHolder" style="margin-left:35%"></span></h3>
	
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
              <h4 align="center" style="color:#00008b">HomeWork Board</h4>
			  
			  
            </div>
          </div>
        </div>
      </div>
			
			
			    
      	<div id="HW">
				    
     	 </div>
     

      
      
    <!-- End Middle Column -->
    </div>
    
    <!-- Right Column -->
    <div class="w3-col m2">
      <div class="w3-card w3-round w3-white w3-center">
        <div class="w3-container">
          <p>Announcements:</p>
          <img src="announcement.png" alt="Announcement" style="width:30%;">
          <p><strong>Holiday</strong></p>
          <p>Friday 15:00</p>
          <p><button class="w3-button w3-block w3-theme-l4">Info</button></p>
        </div>
      </div>
      <br>
      
            <br>
      
      
      <br>
      
   
      
    <!-- End Right Column -->
    </div>
    
  <!-- End Grid -->
  </div>
  
<!-- End Page Container -->
</div>
<br>


<footer class="w3-container " style="color:white;font:15px; Font-family:Open Sans,sans-serif; background-color:#3333ff;height:50px;">
  <p>Powered by <a href="" target="_blank">G4Tech</a></p>
</footer>
 
<script>
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
     
   	var homework = "<%=s1.getHomeWork()%>";
   	document.getElementById('HW').innerHTML = homework;
}



					///My script ENDS

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

function myFunction() {
  var dots = document.getElementById("dots");
  var moreText = document.getElementById("more");
  var btnText = document.getElementById("myBtn");

  if (dots.style.display === "none") {
    dots.style.display = "inline";
	btnText.innerHTML = "Permissions";
    moreText.style.display = "none";
  } else {
    dots.style.display = "none";
    btnText.innerHTML = "Back"; 
    moreText.style.display = "inline";
  }
}
			
</script>



</body>
</html>

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