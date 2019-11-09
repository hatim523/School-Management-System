<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="classes.Employee"%>
<!DOCTYPE html>
<html>
<title>Employee Dashboard -> Khokar Public School</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html, body, h1, h2, h3, h4, h5 {font-family: "Open Sans", sans-serif}


</style>
<body class="w3-theme-l5" onload="LoadInfo();getNavbar();">
						
						<%  
							response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");	
							HttpSession sess = request.getSession(false);
							if (session == null)
							{
								response.sendRedirect("index.jsp");
							}
							
							Employee e1;
							e1 = (Employee)sess.getAttribute("emp_obj");
							
							
						
								
																				%>
						
						
<!-- Navbar -->
<div class="w3-top">
 <div class="w3-bar w3-theme-d2 w3-left-align w3-large">

  <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i>KHOKAR</a>
  <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="News">Student</a>
  
  <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Account Settings">Employee</a>
  <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Messages">Time Table</a>
  
  <div class="w3-dropdown-hover w3-hide-small" style="margin-left:680px">
    <button class="w3-button w3-padding-large" title="Notifications"><img src="profileIcon.png" class="w3-circle" style="height:27px;width:27px"></button>     
    <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px">
      <a href="#" class="w3-bar-item w3-button">Dashboard</a>
      <a href="#" class="w3-bar-item w3-button">Profile</a>
      <a href="#" class="w3-bar-item w3-button">Settings</a>
	  <a href="#" class="w3-bar-item w3-button">Sign Out</a>
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
         
         
         
         
         <div id="emp_basic_info">
         
         
         </div>
         
         
         
        </div>
      </div>
      <br>
      
      <!-- Accordion -->
      
      <br>
      
      <!-- Interests --> 
      <div class="w3-card w3-round w3-white " style="background-color:none">
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
              <h6 class="w3-opacity">Post Homework</h6>
			  
              <input contenteditable="true" id="homeworkbox" class="w3-border w3-padding" style="color:grey;width:60%" placeholder="Homework.."><select style="width:9.5%;height:38px;border-bottom-color:grey;color:grey;margin-left:-30px" class="w3-border"><option>Math</option><option>Computer Studies</option></select>      <input id="date01" type="date" name="bday" class="form-control" style="color:grey;height:38px;margin-left:5px;width:21%" class="w3-border"><br></br>
              
			  <button type="button" class="w3-button w3-theme" style="margin-top:-5px"><i class="fa fa-pencil"></i>  Post</button> 
            </div>
          </div>
        </div>
      </div>
      
      <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
             <div class="w3-row-padding" style="margin:0 -16px">
            <p>ahfdbdsakjfijhadsiufhsadjfjasdhfjkhd</p>
        </div>
         
      </div>
      
      <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
        <p></p>
      </div>  

      <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
        <img src="/w3images/avatar6.png" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
        <span class="w3-right w3-opacity">32 min</span>
        <h4>Angie Jane</h4><br>
        <hr class="w3-clear">
        <p>Have you seen this?</p>
        <img src="/w3images/nature.jpg" style="width:100%" class="w3-margin-bottom">
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
        <button type="button" class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up"></i>  Like</button> 
        <button type="button" class="w3-button w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment"></i>  Comment</button> 
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
						/// My Script Begins
function LoadInfo()
{
	var name = "<%=e1.getName() %>";
	var qual = "<%=e1.getQualification() %>";
	var email = "<%= e1.getEmail()%>";
	var gender = "<%= e1.getGender()%>";
	document.getElementById("emp_basic_info").innerHTML = " <p><i class=\"fa fa-pencil fa-fw w3-margin-right w3-text-theme\"></i>" + name + "</p>" +
   "<p><i class=\"fa fa-graduation-cap fa-fw w3-margin-right w3-text-theme\"></i>" + qual + "</p>" + 
     "<p><i class=\"fa fa-address-book fa-fw w3-margin-right w3-text-theme\"></i>" + email  + "</p>";
	
     if (gender == 'M')
    	 document.getElementById('profileImage').src = 'pro2.png';
     else
    	 document.getElementById('profileImage').src = 'proFemale.png'
}

function getNavbar()
{
	//perform get request from servlet
	
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	if (this.readyState == 4 && this.status == 200) {
		var str = this.responseText;
		document.getElementById("").innerHTML = str;
		
		
		
		}
	};
	xhttp.open("GET", "RealtimeData?work_to_do=navbar", true);
	xhttp.send();
	
}
						
						
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


</style>