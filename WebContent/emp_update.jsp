<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="classes.Employee"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Employee Info --> Khokar Public School</title>
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
						      response.sendRedirect("index.jsp");
							  
						  }
							
						  HttpSession sess = request.getSession();
							Employee e1;
							e1 = (Employee)sess.getAttribute("emp_obj");
						
								
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
          <h3> </h3>
	
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
             <div class="content">
                            <div class="page-title">
    <h1>Edit Profile</h1>
</div><!-- /.page-title -->

<div class="background-white p20 mb30">
    <h3 class="page-title">
        											Personal Information

        <a href="#" class="btn btn-primary btn-xs pull-right" onclick="savePersonal()" title="Save changes to Personal Information">Save</a>
    </h3>

    <div class="row">
        <div class="form-group col-sm-6">
            <label>ID</label>
            <input type="text" placeholder="Enter ID to view Employee Info" class="form-control" value="" id="emp_id" onkeyup="PopulateInfo()">
        </div><!-- /.form-group -->

        <div class="form-group col-sm-3">
            <label>Gender</label>
            <input type="text" class="form-control" value="" id="gender">
        </div><!-- /.form-group -->
		
		<div class="form-group col-sm-3">
            <label>Date of Birth</label>
            <input type="date" class="form-control" value="" id="dob">
        </div><!-- /.form-group -->
		
		
        <div class="form-group col-sm-6">
            <label>Name</label>
            <input type="text" class="form-control" value="" id="name">
        </div><!-- /.form-group -->

        <div class="form-group col-sm-6">
            <label>Last Name</label>
            <input type="text" class="form-control" value="" id="lname">
        </div><!-- /.form-group -->
		
    </div><!-- /.row -->
</div>



<div class="background-white p20 mb30">
    <h3 class="page-title">
        Contact Information

        <a href="#" class="btn btn-primary btn-xs pull-right" title="Save changes to contact Information" onclick="saveContact()">Save</a>
    </h3>

    <div class="row">
        <div class="form-group col-sm-6">
            <label>Email</label>
            <input type="text" class="form-control" value="" id="usr_email">
        </div><!-- /.form-group -->

        <div class="form-group col-sm-6">
            <label>Address</label>
            <input type="text" class="form-control" value="" id="address">
        </div><!-- /.form-group -->

        <div class="form-group col-sm-6">
            <label>CNIC</label>
            <input type="number" class="form-control" value="" id="cnic">
        </div><!-- /.form-group -->

        <div class="form-group col-sm-3">
            <label>Phone Number</label>
            <input type="number" class="form-control" value="" id="number">
        </div><!-- /.form-group -->

        <div class="form-group col-sm-3">
            <label>Emergency Number</label>
            <input type="number" class="form-control" value="" id="emergency_number">
        </div><!-- /.form-group -->
    </div><!-- /.row -->
</div>

<div class="background-white p20 mb30">
    <h3 class="page-title">
        Work Information

        <a href="#" class="btn btn-primary btn-xs pull-right" title="save changes to Work Information" onclick="saveWork()">Save</a>
    </h3>

    <div class="row">
        <div class="form-group col-sm-6">
            <label>Job Title</label>
            <input type="text" class="form-control" value="" id="job">
        </div><!-- /.form-group -->

        <div class="form-group col-sm-6">
            <label>Qualification</label>
            <input type="text" class="form-control" value="" id="qual">
        </div><!-- /.form-group -->

        <div class="form-group col-sm-6">
            <label>Salary</label>
            <input type="number" class="form-control" value="" id="sal">
        </div><!-- /.form-group -->

        <div class="form-group col-sm-6">
            <label>Work Experience</label>
            <input type="number" class="form-control" value="" id="exp">
        </div><!-- /.form-group -->

        
    </div><!-- /.row -->
</div>

<div class="background-white p20 mb30" id="permissions">
    <h3 class="page-title">
        Permissions

        <a href="#" class="btn btn-primary btn-xs pull-right" title="save changes to Employee Permissions" onclick="savePermissions()">Save</a>
    </h3>

    <div class="row">
        <div class="form-group col-sm-6">
            <div><label>State</label>
			<div align="center">
            <input type="radio" name="p1" style="width:20%" value="New York">Yes
			<input type="radio"  name="p1" style="width:20%" value="New York">No
			</div>
			</div>
        </div>
	<br><br><br>
        <div class="form-group col-sm-6">
            <div><label>City</label>
			<div align="center">
			<input type="radio" name="p2" style="width:20%" value="New York">Yes
			<input type="radio"  name="p2" style="width:20%" value="New York">No
			</div>
			</div>
        </div><!-- /.form-group -->
	<br><br><br>
        <div class="form-group col-sm-6">
			<div><label>Street</label></div>
			<div align="center">
			<input type="radio" name="p3" style="width:20%" value="New York">Yes
			<input type="radio" name="p3" style="width:20%" value="New York">No
			</div>
			</div>
        </div>

        
    </div>
</div>



                        </div>


<script>
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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

function PopulateInfo()
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
					document.getElementById('dob').value = str.slice(temp = str.indexOf('~') + 1, temp=str.indexOf('~', temp));
					document.getElementById('lname').value = str.slice(temp = str.indexOf('~', temp) + 1, temp = str.indexOf('~', temp));
					document.getElementById('address').value = str.slice(temp = str.indexOf('~', temp) + 1, temp = str.indexOf('~', temp));
					document.getElementById('number').value = str.slice(temp = str.indexOf('~', temp) + 1, temp = str.indexOf('~', temp));
					document.getElementById('emergency_number').value = str.slice(temp = str.indexOf('~', temp) + 1, temp = str.indexOf('~', temp));
					document.getElementById('gender').value = str.slice(temp = str.indexOf('~', temp) + 1, temp = str.indexOf('~', temp));
					document.getElementById('usr_email').value = str.slice(temp = str.indexOf('~', temp) + 1, temp = str.indexOf('~', temp));
					document.getElementById('cnic').value = str.slice(temp = str.indexOf('~', temp) + 1, temp = str.indexOf('~', temp));
					document.getElementById('qual').value = str.slice(temp = str.indexOf('~', temp) + 1, temp = str.indexOf('~', temp));
					document.getElementById('job').value = str.slice(temp = str.indexOf('~', temp) + 1, temp = str.indexOf('~', temp));
					document.getElementById('sal').value = str.slice(temp = str.indexOf('~', temp) + 1, temp = str.indexOf('~', temp));
					document.getElementById('exp').value = str.slice(temp = str.indexOf('~', temp) + 1, temp = str.indexOf('~', temp));
					getPermissions();
			}
		};
		xhttp.open("GET", "RealtimeData?work_to_do=getEmpInfo&emp_id=" + emp_id, true);
		xhttp.send();
	}
	else if (emp_id.length > 5 && !emp_id.includes('fk'))
		alert("Please enter a valid ID");
}

function savePersonal()
{
	var valid_info = true;
	
	var name_box = document.getElementById('name');
	if (name_box.value == null || name_box.value.length < 3)
	{
		name_box.style.backgroundColor = "#B1D7F1";
		valid_info = false;
	}
	else
		name_box.style.backgroundColor = "";
	
	var lname_box = document.getElementById('lname');
	if (lname_box.value == null || lname_box.value.length < 3)
	{
		lname_box.style.backgroundColor = "#B1D7F1";
		valid_info = false;
	}
	else
		lname_box.style.backgroundColor = "";
	
	var dob_box = document.getElementById('dob');
	
	var emp_id = document.getElementById('emp_id').value;
	gender_box = document.getElementById('gender');
	
	if (valid_info != true)
		return;
	
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	if (this.readyState == 4 && this.status == 200) {
			var str = this.responseText;
			alert(str);
		}
	};
	xhttp.open("GET", "RealtimeData?work_to_do=personalAdd&emp_id=" + emp_id + "&name=" + name_box.value + "&lname=" + lname_box.value + 
			"&gender=" + gender_box.value + "&dob=" + dob_box.value , true);
	xhttp.send();
	
}

function saveContact()
{
	var valid_info = true;
	address_box = document.getElementById('address');
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
	
	var num_box = document.getElementById('number');
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
	
	if (valid_info != true)
		return;
	
	var emp_id = document.getElementById('emp_id').value;
	
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	if (this.readyState == 4 && this.status == 200) {
			var str = this.responseText;
			alert(str);
		}
	};
	xhttp.open("GET", "RealtimeData?work_to_do=contactAdd&emp_id=" + emp_id + "&cnic=" + cnic_box.value + "&address=" + address_box.value +  
			"&email=" + email_box.value + "&number=" + num_box.value + "&emergency_number=" + emergency_box.value, true);
	xhttp.send();
}

function saveWork()
{
	var valid_info = true;
	
	var qual_box = document.getElementById('qual');
	if (qual_box.value == null || qual_box.value.length < 2)
	{
		qual_box.style.backgroundColor = "#B1D7F1";
		valid_info = false;
	}
	else
		qual_box.style.backgroundColor = "";
	
	var exp_box = document.getElementById('exp');
	if (exp_box.value == null || exp_box.value < 0)
	{
		exp_box.style.backgroundColor = "#B1D7F1";
		valid_info = false;
	}
	else
		exp_box.style.backgroundColor = "";
	
	var salary_box = document.getElementById('sal');
	if (salary_box.value == null || salary_box.value < 100)
	{
		salary_box.style.backgroundColor = "#B1D7F1";
		valid_info = false;
	}
	else
		salary_box.style.backgroundColor = "";
	
	var job_box = document.getElementById('job');
	if (job_box.value == null || job_box.value.length < 2)
	{
		job_box.style.backgroundColor = "#B1D7F1";
		valid_info = false;
	}
	else
		job_box.style.backgroundColor = "";
	
	if (valid_info != true)
		return;
	
	var emp_id = document.getElementById('emp_id').value;
	
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	if (this.readyState == 4 && this.status == 200) {
			var str = this.responseText;
			alert(str);
		}
	};
	xhttp.open("GET", "RealtimeData?work_to_do=workAdd&emp_id=" + emp_id + "&qual=" + qual_box.value + "&job=" + job_box.value + 
			"&sal=" + salary_box.value + "&exp=" + exp_box.value, true);
	xhttp.send();
}

function getPermissions()
{
	var emp_id = document.getElementById('emp_id').value;
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	if (this.readyState == 4 && this.status == 200) {
			var str = this.responseText;
			document.getElementById('permissions').innerHTML = str;
		}
	};
	xhttp.open("GET", "RealtimeData?work_to_do=printPermissions&emp_id=" + emp_id, true);
	xhttp.send();
}

function savePermissions()
{
	var emp_id = document.getElementById('emp_id').value;
	var student_atd = document.getElementById('0').checked;
	var course_add = document.getElementById('1').checked;
	var marks_add = document.getElementById('2').checked;
	var emp_atd = document.getElementById('3').checked;
	var student_add = document.getElementById('7').checked;
	var student_rem = document.getElementById('4').checked;
	var emp_add = document.getElementById('6').checked;
	var emp_rem = document.getElementById('5').checked;
	var sms = document.getElementById('8').checked;
	var timetable_add = document.getElementById('9').checked;
	var fees_add = document.getElementById('10').checked;
	var fees_gen = document.getElementById('11').checked;
	var class_add = document.getElementById('12').checked;
	var emp_upd = document.getElementById('13').checked;
	var std_upd = document.getElementById('14').checked;
	
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	if (this.readyState == 4 && this.status == 200) {
		var str = this.responseText;
			alert(str);
		}
	};
	
	
	
	xhttp.open("GET", "RealtimeData?work_to_do=update_permissions&student_atd=" + student_atd + "&course_add=" + course_add + "&marks_add=" + marks_add +
			"&emp_atd=" + emp_atd + "&student_add=" + student_add + "&emp_add=" + emp_add + "&emp_rem=" + emp_rem + "&sms=" + sms + 
			"&timetable_add=" + timetable_add + "&fees_add=" + fees_add + "&fees_gen=" + fees_gen + "&class_add=" + class_add + "&emp_upd=" + 
			emp_upd + "&std_upd=" + std_upd + "&emp_id=" + emp_id + "&student_rem=" + student_rem, true);
	xhttp.send();
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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
	  
      
  
    
  <!-- End Grid -->
 
  
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
		






</style>
</html>
