<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="classes.Employee"%>
    <%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<title>Student Registration -> Khokar Public School</title>
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
    
      <div  class="w3-row-padding" >
        <div class="w3-col m12" >
          <div class="w3-card w3-round w3-white" >
            <div class="w3-container w3-padding" >
             <div class="container" >
  <h2>Enter Student Details:</h2>
  
    <div class="form-group">
	
      <label for="usr">Class:</label><br>
      <select style="width:40%;" class="form-control" id="class_section"> 
        
	</select>
<br>	
      <label for="usr">Name:</label>
      <input id="name" name="name" type="text" class="form-control" style="width:40%" style="">
<br>
      <label for="usr">Father Name:</label>
      <input id="lname" name="lname" type="text" class="form-control" style="width:40%" style="">

      <label for="pwd">Password:</label>
      <input type="password" name="psw" class="form-control" style="width:40%" id="psw" name="psw" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" style="">
	
	<div id="message">
		  <h3>Password must contain the following:</h3>
		  <p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
		  <p id="number" class="invalid">A <b>number</b></p>
		  <p id="length" class="invalid">Minimum <b>8 characters</b></p>
	</div>
<script>
var myInput = document.getElementById("psw");
var capital = document.getElementById("capital");
var number = document.getElementById("number");
var length = document.getElementById("length");

// When the user clicks on the password field, show the message box
myInput.onfocus = function() {
  document.getElementById("message").style.display = "block";
}

// When the user clicks outside of the password field, hide the message box
myInput.onblur = function() {
  document.getElementById("message").style.display = "none";
}

// When the user starts to type something inside the password field
myInput.onkeyup = function() {
  
  // Validate capital letters
  var upperCaseLetters = /[A-Z]/g;
  if(myInput.value.match(upperCaseLetters)) {  
    capital.classList.remove("invalid");
    capital.classList.add("valid");
  } else {
    capital.classList.remove("valid");
    capital.classList.add("invalid");
  }

  // Validate numbers
  var numbers = /[0-9]/g;
  if(myInput.value.match(numbers)) {  
    number.classList.remove("invalid");
    number.classList.add("valid");
  } else {
    number.classList.remove("valid");
    number.classList.add("invalid");
  }
  
  // Validate length
  if(myInput.value.length >= 8) {
    length.classList.remove("invalid");
    length.classList.add("valid");
  } else {
    length.classList.remove("valid");
    length.classList.add("invalid");
  }
}
</script>
      <label for="usr">Gender:</label><br>
      <input type="radio" id="g1" name="gender" value="M" checked > Male<br>
      <input type="radio" name="gender" value="F" > Female<br>

      <label for="usr">Date of Birth:</label><br>
      <input name="dob" type="date" name="bday" class="form-control" style="width:40%" id="dob" required>
      
      <label for="usr">Address:</label>
      <input type="text" name="addr" class="form-control" style="width:40%" id="addr">
      
      <label for="usr">Email:</label><br>
      <input type="email" name="usr_email" placeholder="abc@gmail.com"name="email" class="form-control" style="width:40%" id="usr_email">

      <label for="usr">Mobile-Number:</label>
      <input type="number" name="mob_number" placeholder="03XXXXXXXXX"class="form-control" style="width:40%" id="mob_number">


      <label for="usr">Emergency-Number:</label>
      <input type="number" placeholder="03XXXXXXXXX" name="emergency_number" class="form-control" style="width:40%" id="emergency_number">

      <label for="usr">Father CNIC-Number:</label>
      <input type="number" name="cnic" placeholder="42101XXXXXXXX" class="form-control" style="width:40%" id="cnic">

      <label for="usr">Father Occupation:</label><br>
      <input type = "text" name="qual" list = "qualification" class = "form-control" style="width:40%" id="fOcc"> 
      <datalist id = "qualification">
        <option value = "Bachelors">
        <option value = "Masters">
        <option value = "Ph.D">
        <option value = "Others">
      </datalist>
      
      <label for="usr">Mother Name:</label><br>
      <input type="text" class="form-control" style="width:40%" placeholder="# of years" id="mName">
	  
      <label for="usr">Mother Occupation:</label>
      <input type="text" class="form-control" style="width:40%" id="mOcc">
      </div>
      

      <input name="Submit Form" value="Submit" class="button button1" style="float:left" onclick="getDetails()" type="button" />

</div>

			  
              
            </div>
          </div>
        </div>
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
  <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
</footer>
 
<script>
					//Beginning of custom script
					
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
   		document.getElementById('profileImage').src = 'proFemale.png'
   		
   			document.getElementById('updateNav').innerHTML = "<%=e1.generateNavBar()%>";
   	getSubjects();
}
					

					
function getDetails()
{
	var dob_box = document.getElementById('dob');
	
	var gen = null;
	if (document.getElementById('g1').checked)
		gen = "M";
	else
		gen = "F";
	var valid_info = true;
	
	var name_box = document.getElementById('name');
	if (name_box.value == null || name_box.value.length < 3)
	{
		name_box.style.backgroundColor = "#B1D7F1";
		valid_info = false;
	}
	else
		name_box.style.backgroundColor = "";
	
	var class_box = document.getElementById('class_section');
	if (class_box.value == null || class_box.value < 0)
	{
		class_box.style.backgroundColor = "#B1D7F1";
		valid_info = false;
	}
	else
		class_box.style.backgroundColor = "";
	
	var lastname_box = document.getElementById('lname');
	if (lastname_box.value == null || lastname_box.value.length < 3)
	{
		lastname_box.style.backgroundColor = "#B1D7F1";
		valid_info = false;
	}
	else
		lastname_box.style.backgroundColor = "";
	
	var password_box = document.getElementById('psw');
	if (password_box.value == null || password_box.value.length < 8)
	{
		password_box.style.backgroundColor = "#B1D7F1";
		valid_info = false;
	}
	else
		password_box.style.backgroundColor = "";
	
	var address_box = document.getElementById('addr');
	if (address_box.value == null || address_box.value.length < 4)
	{
		address_box.style.backgroundColor = "#B1D7F1";
		valid_info = false;
	}
	else
		address_box.style.backgroundColor = "";
	
	var email_box = document.getElementById('usr_email');
	if (email_box.value == null || email_box.value.length < 9)
	{
		email_box.style.backgroundColor = "#B1D7F1";
		valid_info = false;
	}
	else
		email_box.style.backgroundColor = "";
	
	var num_box = document.getElementById('mob_number');
	if (num_box.value == null || num_box.value.length < 11)
	{
		num_box.style.backgroundColor = "#B1D7F1";
		valid_info = false;
	}
	else
		num_box.style.backgroundColor = "";
	
	var emergency_box = document.getElementById("emergency_number");
	if (emergency_box.value == null || emergency_box.value.length < 11)
	{
		emergency_box.style.backgroundColor = "#B1D7F1";
		valid_info = false;
	}
	else
		emergency_box.style.backgroundColor = "";
	
	var cnic_box = document.getElementById('cnic');
	if (cnic_box.value == null || cnic_box.value.length < 13 || cnic_box.value.length > 13)
	{
		cnic_box.style.backgroundColor = "#B1D7F1";
		valid_info = false;
	}
	else
		cnic_box.style.backgroundColor = "";
	
	var fatherOccupation_box = document.getElementById('fOcc');
	if (fatherOccupation_box.value == null || fatherOccupation_box.value.length < 2)
	{
		fatherOccupation_box.style.backgroundColor = "#B1D7F1";
		valid_info = false;
	}
	else
		fatherOccupation_box.style.backgroundColor = "";
	
	var motherName_box = document.getElementById('mName');
	if (motherName_box.value == null || motherName_box.value.length < 3)
	{
		motherName_box.style.backgroundColor = "#B1D7F1";
		valid_info = false;
	}
	else
		motherName_box.style.backgroundColor = "";
	
	var motherOccupation_box = document.getElementById('mOcc');
	if (motherOccupation_box.value == null || motherOccupation_box.value.length < 2)
	{
		motherOccupation_box.style.backgroundColor = "#B1D7F1";
		valid_info = false;
	}
	else
		motherOccupation_box.style.backgroundColor = "";
	
	
	
	if (valid_info == false)
		return;
	
    var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	if (this.readyState == 4 && this.status == 200) {
		var str = this.responseText;
			if (str != "")
				alert("Please note the Student ID for the registered Student: \n" + "sk" + str);
			
		}
	};
	
	
	
	xhttp.open("GET", "RealtimeData?work_to_do=std_reg&name=" + name_box.value + "&class=" + class_box.value + 
			"&lname=" + lastname_box.value + "&psw=" + password_box.value + "&addr=" + address_box.value + "&usr_email=" + email_box.value + 
			"&mob_number=" + num_box.value + "&emergency_number=" + emergency_box.value + "&cnic=" + cnic_box.value + "&fatherOccupation=" + fatherOccupation_box.value +
			"&motherName=" + motherName_box.value + "&motherOccupation=" + motherOccupation_box.value + "&dob=" + dob_box.value + "&gender=" + gen, true);
	xhttp.send();
}

function getSubjects()
{
	var select_tag = document.getElementById("class_section");
		
	var size = "<%=classes.size()%>";
	
	var subjects = new Array();
	var additional_info = new Array();
	<% for (int i=0; i<classes.size(); i++) { %>
	subjects[<%= i %>] = "<%= classes.get(i) %>";
	<% } %>
	
	<% for (int i=0; i<class_id.size(); i++) { %>
	additional_info[<%= i %>] = "<%= class_id.get(i) %>";
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
											//End of custom script
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


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
/* Style the submit button */
input[type=submit] {
  background-color: #4CAF50;
  color: white;
}


/* The message box is shown when the user clicks on the password field */
#message {
  display:none;
  color: #000;
  position: relative;
  padding: 20px;
  margin-top: 10px;
}

#message p {
  padding: 10px 35px;
  font-size: 18px;
}

/* Add a green text color and a checkmark when the requirements are right */
.valid {
  color: green;
}

.valid:before {
  position: relative;
  left: -35px;
  content: "✔";
}

/* Add a red text color and an "x" when the requirements are wrong */
.invalid {
  color: red;
}

.invalid:before {
  position: relative;
  left: -35px;
  content: "✖";
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
				background-color: rgb(67,87,97);
				color:white;
				
				font-family: "Open Sans", sans-serif
			}
			.today { border: 2px solid rgb(77,99,111);}
		



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