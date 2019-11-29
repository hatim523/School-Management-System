<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="classes.Employee"%>
    <%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<title>Update Marks --> Khokar Public School</title>
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
						  if(session.getAttribute("emp_obj")==null)
						  {
						      RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
						      rd.forward(request, response);
							  
						  }
							
						  HttpSession sess = request.getSession();
							Employee e1;
							e1 = (Employee)sess.getAttribute("emp_obj");
							ArrayList<String> courses = e1.getCourses();
							ArrayList<String> add_courses = e1.getCourseID_classID();
								
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
         <p class="w3-center"><img src="" class="w3-circle" id="profileImage" style="height:106px;width:106px" alt="Avatar"></p>
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
          <h3> <span id="dateHolder" style="margin-left:35%" ></span></h3>
	
	<table id="calWrapper">
	</table>
      </div>
      <br>
      
      <!-- Alert Box -->
      
    
    <!-- End Left Column -->
    </div>
    
    <!-- Middle Column -->
    <div class="w3-col m7" style="margin-left:0px">
      <div  class="w3-row-padding" style="">
        <div class="w3-col m12" >
          <div class="w3-card w3-round w3-white" >
            <div class="w3-container w3-padding" style="overflow-x:auto;">
		
		<h3 class="page-title">
        											Add/Update Student Marks

        <a href="#" class="btn btn-primary btn-xs pull-right" onclick="getTable()" title="Get marks table with student names">Get Marks Table</a>
    </h3>
		
		<div class="row">
        <div class="form-group col-sm-6">
            <label>Marks for:</label>
            <input type="text" placeholder="Quiz/Mid/Final/Project etc" class="form-control" id="title_marks">
        </div><!-- /.form-group -->
		
		<div class="form-group col-sm-6">
            <label>Maximum Marks:</label>
            <input type="number" placeholder="Max marks that can be obtained" class="form-control" value="" id="max_marks">
        </div><!-- /.form-group -->
		
        <div class="form-group col-sm-12">
            <label>Subject - Class Section</label>
            <select id="courses" class="form-control"></select>
        </div><!-- /.form-group -->
		
		
    </div><!-- /.row -->
			<br><br>
			<div id="marks_table">
			
			</div>
            
			

<script>
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
	getSubjects();
	
}

function getSubjects()
{
	var select_tag = document.getElementById("courses");
		
	var size = "<%=courses.size()%>";
		
	var subjects = new Array();
	var additional_info = new Array();
	<% for (int i=0; i<courses.size(); i++) { %>
	subjects[<%= i %>] = "<%= courses.get(i) %>";
	<% } %>
	
	<% for (int i=0; i<add_courses.size(); i++) { %>
	additional_info[<%= i %>] = "<%= add_courses.get(i) %>";
	<% } %>
	
	var i = 0;
	var option = null;
	for (i = 0; i < size; i++) {
		option = document.createElement("option");
		option.text = subjects[i];
		option.value = additional_info[i];
		select_tag.add(option);
	}
}

var subject_class = null;
var max_marks = null;
var title_marks = null;

function getTable()
{
	subject_class = document.getElementById('courses').value;
	max_marks = document.getElementById('max_marks').value;
	title_marks = document.getElementById('title_marks').value;
	
	if (max_marks < 1 || max_marks > 100)
	{
		alert("Please enter valid marks");
		return;
	}
	if (title_marks.length == 0)
	{
		alert("Please enter a title for marks");
		return;
	}
	
	//Now getting the students table
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	if (this.readyState == 4 && this.status == 200) {
		var str = this.responseText;
			if (str != "")
				document.getElementById('marks_table').innerHTML = str;	
		}
	};
	xhttp.open("GET", "RealtimeData?work_to_do=getMarksTable&subject_class=" +  subject_class + "&marks=" + max_marks + "&title_marks=" + title_marks, true);
	xhttp.send();
}

function saveTable()
{
	var total_students = document.getElementById('total_students').value;
	var table_state = document.getElementById('table_state').value;
	
	var i;
	var student_data = "";
	for (i=1; i<=total_students; i++)
	{
		var id = document.getElementById(i.toString()).value;
		student_data += "&stdID_" + i.toString() + "=" + id + "&stdMarks_" + i.toString() + "=" + document.getElementById(id).value;
	}
	
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	if (this.readyState == 4 && this.status == 200) {
		var str = this.responseText;
			if (str != "")
			{
				alert(str);
				document.getElementById('marks_table').innerHTML = "";
			}
		}
	};
	xhttp.open("GET", "RealtimeData?work_to_do=saveMarks&table_state=" + table_state + "&total_students=" + total_students + 
			"&subject_class=" + subject_class + "&marks=" + max_marks + "&title_marks=" + title_marks + student_data, true);
	xhttp.send();
}


/// My Script ENDS
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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

            </div>
          </div>
        </div>
      </div>
	  <!--ended middle-->
	 
	  </div>
	  
       </div>
  
<!-- End Page Container -->
</div>
<br>

<!-- Footer -->
<footer class="w3-container w3-theme-d3 w3-padding-16">
  <h5>Footer</h5>
</footer>

<footer class="w3-container w3-theme-d5">
  <p>Powered by <a href="" target="_blank">G4Tech</a></p>
</footer>
 
<script>

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
				background-color: rgb(67,87,97);
				color:white;
				
				font-family: "Open Sans", sans-serif
			}
			.today { border: 2px solid rgb(77,99,111);}
		


.btns1{
border:none;
border-radius:3px;
font-family:"Open Sans",sans-serif;
color:white;
background-color:rgb(67,87,97);

}
::placeholder{color:grey;}

#TotalMarks,#Submit{

height:30px;

}
#Submit:focus{
outline:none;
}
#Submit:hover{
cursor:pointer;
}

#titleX{

height:30px;
}
#classX{
height:30px;
}
#TotalMarks{
width:88%;
}
#Submit{

border-radius:2px;

}
#updateMarks{
border:1px solid black;
width:100%;
border-radius:5px;
border-collapse:separate;
}
th,td{
border:none;
text-align:center;
align:center;
}
th{
height:50px;
background-color:rgb(67,87,97);
color:white;
font-family:"Open Sans",sans-serif;
}
td{
height:30px;

}
.left {
background-color:white;

  float:left;
  width:10%; /* The width is 20%, by default */
}
.main {
  float:left;
  width:15%; /* The width is 60%, by default */
}
.right {
  float:left;
  width:15%; /* The width is 20%, by default */
}
.moreright{


float:left;
width:20%;
}
@media screen and (max-width:800px) {
  .left, .main, .right {
    width:100%; /* The width is 100%, when the viewport is 800px or smaller */
    margin-top:5px;
  }
  .moreright{ width:100%;margin-top:5px;}
  #titleX,#classX,#TotalMarks,#Submit{margin-left:0%;}
  #TotalMarks{width:40%;}
  #Submit{margin-bottom:10px;}
  .updin{
  width:10%;
  }

</style>