<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="classes.Employee"%>
    <%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Class/Section -> Khokar Public School</title>
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
					//		session.removeAttribute("emp_obj");
						  if(session.getAttribute("emp_obj")==null)
						  {
						      response.sendRedirect("index.jsp");
							  
						  }
							
						  HttpSession sess = request.getSession();
							Employee e1;
							e1 = (Employee)sess.getAttribute("emp_obj");
							ArrayList<String> classes = e1.getClasses();
							ArrayList<Integer> class_id = e1.getClassID();
						
								
																				%>
						
						
<!-- Navbar -->
<div class="w3-top">
 <div class="w3-bar w3-theme-d2 w3-left-align w3-large" id="updateNav">
	
    
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
         
         
         
         
         <div id="emp_basic_info">
         
         
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
        											Add New Course Teacher

        <a href="#" class="btn btn-primary btn-xs pull-right" onclick="AddTeacher()" title="Add new course teacher">Add Teacher</a>
    </h3>
          <div class="row">
        <div class="form-group col-sm-6">
            <label>Teacher ID</label>
            <input type="text" placeholder="Enter Teacher ID" class="form-control" value="" id="emp_id" onkeyup="PopulateTeacherInfo()">
        </div><!-- /.form-group -->

        <div class="form-group col-sm-3">
            <label>First Name</label>
            <input type="text" class="form-control" value="" id="name" readonly>
        </div><!-- /.form-group -->
		
		<div class="form-group col-sm-3">
            <label>Last Name</label>
            <input type="text" class="form-control" value="" id="lname" readonly>
        </div><!-- /.form-group -->
		
		
        <div class="form-group col-sm-6">
            <label>Subject Name</label>
            <input type="text" class="form-control" value="" id="subject" onkeyup="PopulateCourseInfo()">
        </div><!-- /.form-group -->

        <div class="form-group col-sm-6">
            <label>Subject ID</label>
            <input type="text" class="form-control" value="" id="subject_id" readonly>
        </div><!-- /.form-group -->
		
		
		<div class="form-group col-sm-3">
            <label>Class</label>
            <input type="text" placeholder="Enter Teacher ID" class="form-control" value="" id="class" onkeyup="PopulateClassInfo()">
        </div><!-- /.form-group -->

        <div class="form-group col-sm-3">
            <label>Section</label>
            <input type="text" class="form-control" value="" id="section" onkeyup="PopulateClassInfo()">
        </div><!-- /.form-group -->
		
		<div class="form-group col-sm-6">
            <label>Class ID</label>
            <input type="text" class="form-control" value="" id="class_id" readonly>
        </div><!-- /.form-group -->
		
    </div><!-- /.row -->
</div>
            </div>
          </div>
        </div>
      </div>
      </div>
     <div id="homework">

      
      
       
    </div>
    
    <!-- End Middle Column -->
    </div>
    
    <!-- Right Column -->
    <div class="w3-col m2">
      <div class="w3-card w3-round w3-white w3-center">
        <div class="w3-container">
          <p>Annoucements:</p>
          <img src="announcement.png" alt="Of all the hard jobs around, one of the hardest is being a good teacher" style="width:30%;">
          <p><strong>Holiday</strong></p>
          <p>Friday 15:00</p>
          <p><button class="w3-button w3-block w3-theme-l4">Info</button></p>
		  <p>add more info by adding this tag below</p>
		  
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
	var name = "<%=e1.getName() %>";
	var qual = "<%=e1.getQualification() %>";
	var email = "<%= e1.getEmail()%>";
	var gender = "<%= e1.getGender()%>";
	var image = "<%= e1.getImage()%>";
	
	document.getElementById("emp_basic_info").innerHTML = " <p><i class=\"fa fa-pencil fa-fw w3-margin-right w3-text-theme\"></i>" + name + "</p>" +
   "<p><i class=\"fa fa-graduation-cap fa-fw w3-margin-right w3-text-theme\"></i>" + qual + "</p>" + 
     "<p><i class=\"fa fa-address-book fa-fw w3-margin-right w3-text-theme\"></i>" + email  + "</p>";
	
    	
   	if (gender == 'M')
   	 	document.getElementById('profileImage').src = 'pro2.png';
    else
   		document.getElementById('profileImage').src = 'proFemale.png';	
     
    
    document.getElementById('updateNav').innerHTML = "<%=e1.generateNavBar()%>";
    
}


function AddTeacher()
{
	var course_id = document.getElementById('subject_id').value;
	var class_id = document.getElementById('class_id').value;
	var teacher_id = document.getElementById('emp_id').value;
	
	if (course_id.length > 0 && class_id.length > 0 && teacher_id.length > 5)
	{
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var str = this.responseText;
				alert(str);
			}
		};
		xhttp.open("GET", "RealtimeData?work_to_do=AddCourseTeacher&class_id=" + class_id + "&teacher_id=" + teacher_id + "&course=" + course_id, true);
		xhttp.send();
	}
}


function PopulateTeacherInfo()
{
	var emp_id = document.getElementById('emp_id').value;
	if (emp_id.length > 5 && emp_id.includes('fk'))
	{
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var str = this.responseText;
					var temp = 0;
					document.getElementById('name').value = str.slice(0, str.indexOf('~'));
					document.getElementById('lname').value = str.slice(temp = str.indexOf('~') + 1, temp=str.indexOf('~', temp));
					
			}
		};
		xhttp.open("GET", "RealtimeData?work_to_do=getEmpName&emp_id=" + emp_id, true);
		xhttp.send();
	}
	else if (emp_id.length > 5 && !emp_id.includes('fk'))
		alert("Please enter a valid ID");
}

function PopulateCourseInfo()
{
	var subject_name = document.getElementById('subject').value;
	if (subject_name.length > 2)
	{
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var str = this.responseText;
					var temp = 0;
					document.getElementById('subject_id').value = str;
					
					
			}
		};
		xhttp.open("GET", "RealtimeData?work_to_do=getSubjectID&subject_name=" + subject_name, true);
		xhttp.send();
	}
}

function PopulateClassInfo()
{
	var class_name = document.getElementById('class').value;
	var section = document.getElementById('section').value;
	if (class_name.length > 0 && section.length > 0)
	{
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var str = this.responseText;
					var temp = 0;
					document.getElementById('class_id').value = str;
					
					
			}
		};
		xhttp.open("GET", "RealtimeData?work_to_do=getClassID&class=" + class_name + "&section=" + section, true);
		xhttp.send();
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
						/// My Script ENDS


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

</html> 