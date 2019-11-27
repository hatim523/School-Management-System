<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="classes.Employee"%>
<!DOCTYPE html>
<html>
<head>
<title>W3.CSS Template</title>
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
						
								
																				%>







<!-- Navbar -->
<div class="w3-top" style="width:100%;">
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
      <div  class="w3-row-padding"  style="width:130%">
        <div class="w3-col m12" >
          <div class="w3-card w3-round w3-white" >
            <div class="w3-container w3-padding" >
             
        <div class="col-md-12 text-center" style="background-color:white;height:60px">
            <select class="m-dropdown__toggle btn  dropdown-toggle" id="SemId" name="SemId" style="background-color:rgb(67,87,97);color:white;margin-top:10px;height:40px"><option selected="selected" value="20193">Fall 2019</option>
<option value="20192">Summer 2019</option>
<option value="20191">Spring 2019</option>
</select>
            <button type="submit" class="btn btn-brand m-btn m-btn--custom m-btn--air" style="background-color:rgb(67,87,97);height:40px;width:15%">View Marks</button>
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
            <div class="m-portlet__head-tools">
                <ul class="nav nav-tabs m-tabs m-tabs-line  m-tabs-line--right m-tabs-line-danger" role="tablist" >

                            <li class="nav-item m-tabs__item">
                                <a class="nav-link m-tabs__link active" data-toggle="tab" href="#CL203" role="tab">
                                    English
                                </a>
                            </li>
                            <li class="nav-item m-tabs__item">
                                <a class="nav-link m-tabs__link" data-toggle="tab" href="#CL309" role="tab">
                                    Urdu
                                </a>
                            </li>
                            <li class="nav-item m-tabs__item">
                                <a class="nav-link m-tabs__link" data-toggle="tab" href="#CS203" role="tab">
                                    Maths
                                </a>
                            </li>
                            <li class="nav-item m-tabs__item">
                                <a class="nav-link m-tabs__link" data-toggle="tab" href="#CS302" role="tab">
                                    Physics
                                </a>
                            </li>
                            <li class="nav-item m-tabs__item">
                                <a class="nav-link m-tabs__link" data-toggle="tab" href="#CS309" role="tab">
                                    Chemistry 
                                </a>
                            </li>
                            <li class="nav-item m-tabs__item">
                                <a class="nav-link m-tabs__link" data-toggle="tab" href="#EE204" role="tab">
                                    Islamiat
                                </a>
                            </li>
                            <li class="nav-item m-tabs__item">
                                <a class="nav-link m-tabs__link" data-toggle="tab" href="#MG223" role="tab">
                                    Social Studies
                                </a>
                            </li>
                </ul>
            </div>
        </div>
		<div class="m-portlet__body">
 	        <div class="tab-content">
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
              <td class="text-center"><input type="text" class="jesus" value="Quiz#"></td>
              <td class="text-center ObtMarks"><input type="text" class="jesus" value="ObtMarks"></td>
              <td class="text-center GrandTotal"><input type="text" class="jesus" value="ObtMarks"></td>
              <td class="text-center AverageMarks"><p class="Avg" >Avg</p></td>
                                                                                     
              <td class="text-center MinMarks"><p class="minmarks">Min</p></td>
              <td class="text-center MaxMarks"><p class="maxmarks">Max</p></td>
                                                                                                                                                                          
              </tr>
              <tr class="totalColumn_21">
              <td class="text-center">Total</td>
              <td class="text-center totalColweightage">3</td>                                                                                                   <td class="text-center totalColObtMarks">2.60</td>   
                                                                                                                                                                        
              <td class="text-center totalColGrandTotal"></td>
              <td class="text-center totalColAverageMarks"></td>
              <td class="text-center totalColMinMarks"><input type="button" value="Update" class="updmarkbtn"></td>
                                                                                                                                                                      
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
              <td class="text-center"><input type="text" class="jesus" value="Mid#"></td>
              <td class="text-center ObtMarks"><input type="text" class="jesus" value="ObtMarks"></td>
              <td class="text-center GrandTotal"><input type="text" class="jesus" value="ObtMarks"></td>
              <td class="text-center AverageMarks"><p class="Avg" >Avg</p></td>
                                                                                     
              <td class="text-center MinMarks"><p class="minmarks">Min</p></td>
              <td class="text-center MaxMarks"><p class="maxmarks">Max</p></td>
                                                                                                                                                                          
              </tr>
              <tr class="totalColumn_21">
              <td class="text-center">Total</td>
              <td class="text-center totalColweightage">3</td>                                                                                                   <td class="text-center totalColObtMarks">2.60</td>   
                                                                                                                                                                        
              <td class="text-center totalColGrandTotal"></td>
              <td class="text-center totalColAverageMarks"></td>
              <td class="text-center totalColMinMarks"><input type="button" value="Update" class="updmarkbtn"></td>
                                                                                                                                                   
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
button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 30%;
}

button:hover {
  opacity: 0.8;
}

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
				background-color: rgb(67,87,97);
				color:white;
				
				font-family: "Open Sans", sans-serif
			}
			.today { border: 2px solid rgb(77,99,111);}
		
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
.updmarkbtn{
color:white;
font-family:"Open Sans",sans-serif;
background-color:rgb(67,87,97);
border:none;
border-radius:2px;
}


</style>