<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="classes.Employee"%>
    <%@ page import="classes.Student"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Student Info --> Khokar Public School</title>
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
            <input type="text" placeholder="Enter Student ID to view Student Info" class="form-control" value="" id="std_id" onkeyup="PopulateInfo()">
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
            <label>Phone Number</label>
            <input type="number" class="form-control" value="" id="number">
        </div><!-- /.form-group -->

        <div class="form-group col-sm-6">
            <label>Emergency Number</label>
            <input type="number" class="form-control" value="" id="emergency_number">
        </div><!-- /.form-group -->
    </div><!-- /.row -->
</div>

<div class="background-white p20 mb30">
    <h3 class="page-title">
        Parent/Guardian Information

        <a href="#" class="btn btn-primary btn-xs pull-right" title="save changes to Parent/Guardian Information" onclick="saveParent()">Save</a>
    </h3>

    <div class="row">
        <div class="form-group col-sm-6">
            <label>Father Occupation: </label>
            <input type="text" class="form-control" value="" id="fOccupation">
        </div><!-- /.form-group -->

        <div class="form-group col-sm-6">
            <label>Father CNIC</label>
            <input type="number" class="form-control" value="" id="fCNIC">
        </div><!-- /.form-group -->

        <div class="form-group col-sm-6">
            <label>Mother Name</label>
            <input type="text" class="form-control" value="" id="mName">
        </div><!-- /.form-group -->

        <div class="form-group col-sm-6">
            <label>Mother Occupation</label>
            <input type="text" class="form-control" value="" id="mOccupation">
        </div><!-- /.form-group -->

        
    </div><!-- /.row -->
</div>

<div class="background-white p20 mb30" id="permissions">
    <h3 class="page-title">
        Class

        <a href="#" class="btn btn-primary btn-xs pull-right" title="save changes to Student class/Section" onclick="saveClass()">Save</a>
    </h3>

    <div class="row">
        <div class="form-group col-sm-6">
           <label>Class</label>
            <input type="text" class="form-control" value="" id="class_std">
        </div>
        <div class="form-group col-sm-6">
            <label>Section</label>
            <input type="text" class="form-control" value="" id="section">
        </div><!-- /.form-group -->
	
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
	var std_id = document.getElementById('std_id').value;
	if (std_id.length > 5 && std_id.includes('sk'))
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
					document.getElementById('fCNIC').value = str.slice(temp = str.indexOf('~', temp) + 1, temp = str.indexOf('~', temp));
					document.getElementById('fOccupation').value = str.slice(temp = str.indexOf('~', temp) + 1, temp = str.indexOf('~', temp));
					document.getElementById('mName').value = str.slice(temp = str.indexOf('~', temp) + 1, temp = str.indexOf('~', temp));
					document.getElementById('mOccupation').value = str.slice(temp = str.indexOf('~', temp) + 1, temp = str.indexOf('~', temp));
					document.getElementById('class_std').value = str.slice(temp = str.indexOf('~', temp) + 1, temp = str.indexOf('~', temp));
					document.getElementById('section').value = str.slice(temp = str.indexOf('~', temp) + 1, temp = str.indexOf('~', temp));
			}
		};
		xhttp.open("GET", "RealtimeData?work_to_do=getStdInfo&student_id=" + std_id, true);
		xhttp.send();
	}
	else if (std_id.length > 5 && !std_id.includes('fk'))
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
	
	var std_id = document.getElementById('std_id').value;
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
	xhttp.open("GET", "RealtimeData?work_to_do=personalAddStd&std_id=" + std_id + "&name=" + name_box.value + "&lname=" + lname_box.value + 
			"&gender=" + gender_box.value + "&dob=" + dob_box.value , true);
	xhttp.send();
	
}

function saveContact()
{
	var valid_info = true;
	var address_box = document.getElementById('address');
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
	
	
	if (valid_info != true)
		return;
	
	var std_id = document.getElementById('std_id').value;
	
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	if (this.readyState == 4 && this.status == 200) {
			var str = this.responseText;
			alert(str);
		}
	};
	xhttp.open("GET", "RealtimeData?work_to_do=contactAddStd&std_id=" + std_id + "&address=" + address_box.value +  
			"&email=" + email_box.value + "&number=" + num_box.value + "&emergency_number=" + emergency_box.value, true);
	xhttp.send();
}

function saveParent()
{
	var valid_info = true;
	
	
	var fatherOccupation_box = document.getElementById('fOccupation');
	if (fatherOccupation_box.value == null || fatherOccupation_box.value.length < 2)
	{
		fatherOccupation_box.style.backgroundColor = "#B1D7F1";
		valid_info = false;
	}
	else
		fatherOccupation_box.style.backgroundColor = "";
	
	var motherOccupation_box = document.getElementById('mOccupation');
	if (motherOccupation_box.value == null || motherOccupation_box.value.length < 2)
	{
		motherOccupation_box.style.backgroundColor = "#B1D7F1";
		valid_info = false;
	}
	else
		motherOccupation_box.style.backgroundColor = "";
	
	var motherName_box = document.getElementById('mName');
	if (motherName_box.value == null || motherName_box.value.length < 3)
	{
		motherName_box.style.backgroundColor = "#B1D7F1";
		valid_info = false;
	}
	else
		motherName_box.style.backgroundColor = "";
	
	var cnic_box = document.getElementById('fCNIC');
	if (cnic_box.value == null || cnic_box.value.length < 13 || cnic_box.value.length > 13)
	{
		cnic_box.style.backgroundColor = "#B1D7F1";
		valid_info = false;
	}
	else
		cnic_box.style.backgroundColor = "";
	
	var std_id = document.getElementById('std_id').value;
	
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	if (this.readyState == 4 && this.status == 200) {
			var str = this.responseText;
			alert(str);
		}
	};
	xhttp.open("GET", "RealtimeData?work_to_do=parentAddStd&std_id=" + std_id + "&fOcc=" + fatherOccupation_box.value + 
			"&mOcc=" + motherOccupation_box.value + "&mName=" + motherName_box.value + "&fCNIC=" + cnic_box.value, true);
	xhttp.send();
}

function saveClass()
{
	var valid_info = true;
	
	var class_std = document.getElementById('class_std').value;
	var section = document.getElementById('section').value;
	
	var std_id = document.getElementById('std_id').value;
	
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	if (this.readyState == 4 && this.status == 200) {
			var str = this.responseText;
			alert(str);
		}
	};
	xhttp.open("GET", "RealtimeData?work_to_do=classChange&std_id=" + std_id + "&class_std=" + class_std + "&section=" + section, true);
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
