<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="classes.Student"%>
<!DOCTYPE html>
<html>
<head>
<title>View Marks --> Khokar Public School</title>
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
          <h3> <span id="dateHolder" style="margin-left:35%"></span></h3>
	
	<table id="calWrapper">
	</table>
      </div>
      <br>
      
      <!-- Alert Box -->
      
    
    <!-- End Left Column -->
    </div>
    
    <!-- Middle Column -->
    <div class="w3-col m7" style="margin-left:0px">
      <div  class="w3-row-padding"  style="width:130%">
        <div class="w3-col m12" >
          <div class="w3-card w3-round w3-white" >
            <div class="w3-container w3-padding" >
             
        <div class="col-md-12 text-center" style="background-color:white;height:60px">
            <h2>MarkSheet</h2>
        </div>
    
    <br>
 <div class="m-portlet m-portlet--brand m-portlet--head-solid-bg m-portlet--border-bottom-metal m-portlet--head-sm">
<div class="m-portlet__head">
            <div class="m-portlet__head-caption">
                <div class="m-portlet__head-title">
                    <h3 class="m-portlet__head-text">
                        Student Marks
                    </h3>
                </div>
            </div>
            <div class="m-portlet__head-tools" id="subjects_registered">
                
                
                
                
            </div>
        </div>
        
        
        
        
		<div class="m-portlet__body">
 	        <div class="tab-content" id="marks_body">
              <div class="tab-pane" id="CL203" >
			  <div id="accordion">
                <h5>English</h5>
					<div class="card">
               <div class="card-header" id="Quiz">
               <h5 class="mb-0">
               <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#CL309-Quiz" aria-expanded="false" aria-controls="CL309-Quiz">
               Quiz
               </button>
               </h5>
               </div>

               <div id="CL309-Quiz" class="collapse" data-parent="#accordion" aria-labelledby="Quiz">
               <div class="card-body">
               <table class="sum_table table m-table m-table--head-bg-info table-bordered table-striped table-responsive">
               <thead>
               <tr class="titlerow">
               <th class="text-center">Quiz #</th>
                                                                                  
               <th class="text-center">Obtained Marks</th>
               <th class="text-center">Total Marks</th>
               <th class="text-center">Average</th>
                                                                               
              <th class="text-center">Minimum</th>
              <th class="text-center">Maximum</th>
                                                                                                                                                                      
              </tr>
              </thead>
              <tbody>
              <tr class="calculationrow">
              <td class="text-center"> 1</td>
              <td class="text-center ObtMarks">13</td>
              <td class="text-center GrandTotal">15</td>
              <td class="text-center AverageMarks">10.70</td>
                                                                                     
              <td class="text-center MinMarks">0</td>
              <td class="text-center MaxMarks">15</td>
                                                                                                                                                                          
              </tr>
              <tr class="totalColumn_21">
              <td class="text-center">Total</td>
              <td class="text-center totalColweightage">3</td>                                                                                                   <td class="text-center totalColObtMarks">2.60</td>   
                                                                                                                                                                        
              <td class="text-center totalColGrandTotal"></td>
              <td class="text-center totalColAverageMarks"></td>
              <td class="text-center totalColMinMarks"></td>
                                                                                                                                                                      
              </tr>
                                                                                                                                                                </tbody>
              </table>
              </div>
              </div>
              </div>
<div class="card">
               <div class="card-header" id="Mids">
               <h5 class="mb-0">
               <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#CL309-Mids" aria-expanded="false" aria-controls="CL309-Mids">
               Mids
               </button>
               </h5>
               </div>

               <div id="CL309-Mids" class="collapse" data-parent="#accordion" aria-labelledby="Mids">
               <div class="card-body">
               <table class="sum_table table m-table m-table--head-bg-info table-bordered table-striped table-responsive">
               <thead>
               <tr class="titlerow">
               <th class="text-center">Mid #</th>
                                                                                  
               <th class="text-center">Obtained Marks</th>
               <th class="text-center">Total Marks</th>
               <th class="text-center">Average</th>
                                                                               
              <th class="text-center">Minimum</th>
              <th class="text-center">Maximum</th>
                                                                                                                                                                      
              </tr>
              </thead>
              <tbody>
              <tr class="calculationrow">
              <td class="text-center"> 1</td>
              <td class="text-center ObtMarks">13</td>
              <td class="text-center GrandTotal">15</td>
              <td class="text-center AverageMarks">10.70</td>
                                                                                     
              <td class="text-center MinMarks">0</td>
              <td class="text-center MaxMarks">15</td>
                                                                                                                                                                          
              </tr>
              <tr class="totalColumn_21">
              <td class="text-center">Total</td>
              <td class="text-center totalColweightage">3</td>                                                                                                   <td class="text-center totalColObtMarks">2.60</td>   
                                                                                                                                                                        
              <td class="text-center totalColGrandTotal"></td>
              <td class="text-center totalColAverageMarks"></td>
              <td class="text-center totalColMinMarks"></td>
                                                                                                                                                                      
              </tr>
                                                                                                                                                                </tbody>
              </table>
              </div>
              </div>
              </div>			  
			  </div>
		    </div>
		
		</div>
  </div>

    

   
    
  

			 
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
    
   	getClassSubjects();
}
															
function getClassSubjects()
{
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	if (this.readyState == 4 && this.status == 200) {
		var str = this.responseText;
			if (str != "" && str != "Error occured while retrieving subjects. Please try reloading the page")
			{
				document.getElementById('subjects_registered').innerHTML = str;
			}
			else
				alert(str);
		}
	};
	xhttp.open("GET", "RealtimeData?work_to_do=getEnrolledSubjects", true);
	xhttp.send();
}

function getMarks(element_id)
{
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	if (this.readyState == 4 && this.status == 200) {
		var str = this.responseText;
			if (str != "" && str != "Error occured while retrieving marks. Please try reloading the page")
			{
				document.getElementById('marks_body').innerHTML = str;
			}
			else
				alert(str);
		}
	};
	xhttp.open("GET", "RealtimeData?work_to_do=getMarks&course_class=" + element_id.id, true);
	xhttp.send();
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
					///My script ENDS

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
	  </div>
	  
      
   <!--   <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
             <div class="w3-row-padding" style="margin:0 -16px">
           
        </div>
         
      </div>
      
      <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
        <p></p>
      </div>  

      <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
        <img src="/w3images/avatar6.png" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
       
      </div> -->
      
    <!-- End Middle Column -->
    
    <!-- Right Column -->
    
    
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
  <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
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

body {font-family: Arial, Helvetica, sans-serif;}

/* Full-width input fields */
input[type=text], input[type=text] {
  width: 30%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

/* Set a style for all buttons */




/* Extra styles for the cancel button */
.cancelbtn {
  width: auto;
  padding: 10px 38px;
  background-color: #f44336;
}




.container {
  padding: 16px;
}


/* The Modal (background) */

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 40%; /* Could be more or less, depending on screen size */
}

.close:hover,
.close:focus {
  color: red;
  cursor: pointer;

}



/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100px;
  }
}





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
		
.m-portlet__head{
-webkit-text-size-adjust: 100%;
-webkit-tap-highlight-color: transparent;
line-height: 1.5;
color: #212529;
font-size: 13px;
font-weight: 300;
font-family: "Open Sans",sans-serif;
-webkit-font-smoothing: antialiased;
box-sizing: inherit;
display: table;
width: 100%;
padding: 0 2.2rem;
border-bottom: 1px solid #ebedf2;
height: 4.1rem;
background-color: rgb(67,87,97);
border-color: #3f51b5;
}
.m-portlet__head-caption{
-webkit-text-size-adjust: 100%;
-webkit-tap-highlight-color: transparent;
line-height: 1.5;
color: #212529;
font-size: 13px;
font-weight: 300;
font-family: "Open Sans",sans-serif;
-webkit-font-smoothing: antialiased;
box-sizing: inherit;
display: table-cell;
vertical-align: middle;
text-align: left;

}
.m-portlet__head-title{
-webkit-text-size-adjust: 100%;
-webkit-tap-highlight-color: transparent;
line-height: 1.5;
color: #212529;
font-size: 13px;
font-weight: 300;
font-family: "Open Sans",sans-serif;
-webkit-font-smoothing: antialiased;
text-align: left;
box-sizing: inherit;
display: table;
table-layout: fixed;
height: 100%;
}
.m-portlet__head-text{

-webkit-text-size-adjust: 100%;
-webkit-tap-highlight-color: transparent;
-webkit-font-smoothing: antialiased;
text-align: left;
box-sizing: inherit;
margin-top: 0;
margin-bottom: .5rem;
line-height: 1.1;
display: table-cell;
vertical-align: middle;
font-size: 1.3rem;
font-weight: 500;
font-family: "Open Sans",sans-serif;
color: #fff;
}
.m-portlet__head-tools{

-webkit-text-size-adjust: 100%;
-webkit-tap-highlight-color: transparent;
line-height: 1.5;
color: #212529;
font-size: 13px;
font-weight: 300;
font-family: "Open Sans",sans-serif;
-webkit-font-smoothing: antialiased;
box-sizing: inherit;
text-align: right;
display: table-cell;
vertical-align: middle;
padding: 0;
}
.nav.nav-tabs.m-tabs.m-tabs-line.m-tabs-line--right.m-tabs-line-danger{
-webkit-text-size-adjust: 100%;
-webkit-tap-highlight-color: transparent;
line-height: 1.5;
color: white;
font-size: 13px;
font-weight: 300;
font-family: "Open Sans",sans-serif;
-webkit-font-smoothing: antialiased;
text-align: right;
box-sizing: inherit;
display: flex;
flex-wrap: wrap;
padding-left: 0;
list-style: none;
float: right;
margin: 0;
bottom: 0;
border: 0;
}
.nav-item.m-tabs__item{
-webkit-text-size-adjust: 100%;
-webkit-tap-highlight-color: transparent;
line-height: 1.5;
color: white;
font-size: 13px;
font-weight: 300;
font-family: "Open Sans",sans-serif;
-webkit-font-smoothing: antialiased;
list-style: none;
box-sizing: inherit;
margin: 0 1px 0 0;
}

.nav-link.m-tabs__link{

-webkit-text-size-adjust: 100%;
-webkit-tap-highlight-color: transparent;
line-height: 1.5;
font-family: "Open Sans",sans-serif;
-webkit-font-smoothing: antialiased;
list-style: none;
box-sizing: inherit;
text-decoration: none;
background-color: transparent;
touch-action: manipulation;
display: block;
padding: 0.7rem 0.7rem !important;
border-top-left-radius: .25rem;
border-top-right-radius: .25rem;
font-size: 1.1rem;
font-weight: 400;
height: 100%;
color: #fff;
border: 0;
}

.nav-link.m-tabs__link:active{
-webkit-text-size-adjust: 100%;
-webkit-tap-highlight-color: transparent;
line-height: 1.5;
font-family: "Open Sans",sans-serif;
-webkit-font-smoothing: antialiased;
list-style: none;
box-sizing: inherit;
text-decoration: none;
touch-action: manipulation;
display: block;
padding: 0.7rem 0.7rem !important;
font-size: 1.1rem;
font-weight: 400;
height: 100%;
border-radius: 0;
color: #fff;
border: 0;
background: rgba(255,255,255,.08);
}
.nav-link.m-tabs__link:hover{
-webkit-text-size-adjust: 100%;
-webkit-tap-highlight-color: transparent;
line-height: 1.5;
font-family: "Open Sans",sans-serif;
-webkit-font-smoothing: antialiased;
list-style: none;
box-sizing: inherit;
text-decoration: none;
touch-action: manipulation;
display: block;
padding: 0.7rem 0.7rem !important;
font-size: 1.1rem;
font-weight: 400;
height: 100%;
border-radius: 0;
color: white;
border: 0;
background: rgba(255,255,255,.08);
}
.m-portlet.m-portlet--brand.m-portlet--head-solid-bg.m-portlet--border-bottom-metal.m-portlet--head-sm{

-webkit-text-size-adjust: 100%;
-webkit-tap-highlight-color: transparent;
line-height: 1.5;
color: #212529;
font-size: 13px;
font-weight: 300;
font-family: "Open Sans",sans-serif;
-webkit-font-smoothing: antialiased;
box-sizing: inherit;
box-shadow: 0 1px 15px 1px rgba(113,106,202,.08);
margin-bottom: 1rem !important;
border-bottom: 3px solid #c4c5d6;
background: rgb(67,87,97);
border-color: rgb(67,87,97);
}
.m-portlet__body{

-webkit-text-size-adjust: 100%;
-webkit-tap-highlight-color: transparent;
line-height: 1.5;
font-size: 13px;
font-family: "Open Sans",sans-serif;
-webkit-font-smoothing: antialiased;
box-sizing: inherit;
padding: 2.2rem 2.2rem;
color: #000000;
font-weight: 400;
padding-top: 1.7rem;
padding-bottom: 1.7rem;
background: #fff;
}
.tab-content{
-webkit-text-size-adjust: 100%;
-webkit-tap-highlight-color: transparent;
line-height: 1.5;
font-size: 13px;
font-family: "Open Sans",sans-serif;
-webkit-font-smoothing: antialiased;
color: #000000;
font-weight: 400;
box-sizing: inherit;
}
.tab-pane{
-webkit-text-size-adjust: 100%;
-webkit-tap-highlight-color: transparent;
line-height: 1.5;
font-size: 13px;
font-family: "Open Sans",sans-serif;
-webkit-font-smoothing: antialiased;
color: #000000;
font-weight: 400;
box-sizing: inherit;
display: none;
}
.card{
-webkit-text-size-adjust: 100%;
-webkit-tap-highlight-color: transparent;
line-height: 1.5;
font-size: 13px;
font-family: "Open Sans",sans-serif;
-webkit-font-smoothing: antialiased;
color: #000000;
font-weight: 400;
box-sizing: inherit;
position: relative;
display: flex;
flex-direction: column;
min-width: 0;
word-wrap: break-word;
background-color: #fff;
background-clip: border-box;


}
.card-header{
-webkit-text-size-adjust: 100%;
-webkit-tap-highlight-color: transparent;
line-height: 1.5;
font-size: 13px;
font-family: "Open Sans",sans-serif;
-webkit-font-smoothing: antialiased;
color: #000000;
font-weight: 400;
box-sizing: inherit;
padding: .75rem 1.25rem;
margin-bottom: 0;
background-color: rgba(0,0,0,.03);


}


</style>