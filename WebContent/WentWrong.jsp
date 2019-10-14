<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="classes.ExceptionHandler"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<style>
#WentWrong{
height:80%;
width:100%;
background-color:none;
margin-left:0px auto;
float:left;
}
img{
margin-left:19%;
height:500px;
width:65%;
float:left;
}
#butts{
height:50px;
background-color:none;
width:100%;
margin-left:0px auto;
display:absolute;
background-color:none;
margin-top:-20px;
float:left;
}
#b1{
height:50px;
width:12%;
margin-left:35%;
display:relative;
font-weight:bold;
font-family:Open Sans",sans-serif;
border-color:grey grey grey;
color:grey;
background-color:white;
outline:none;
-webkit-transition-duration: 0.4s; 
 border: 2px solid #e7e7e7;
float:left;
}

#b2{
color:grey;
height:50px;
width:12%;
margin-left:75px;
font-weight:bold;
font-family:Open Sans",sans-serif;
outline:none;
background-color:white;
-webkit-transition-duration: 0.4s; 
transition-duration: 0.4s;
border: 2px solid #008CBA;
float:left;
}
#b1:hover{
cursor:pointer;
background-color: #e7e7e7;

}
#b2:hover{
cursor:pointer;
background-color:rgb(39,99,165);
color:black;

}
button:focus{
outline:0;
}
@media screen and (max-width:1367px)
{
#WentWrong{
width:100%;
}
#butts{
width:100%;
}
#b1{
width:12%;
}
#b2{
width:12%;
}

img{
width:65%;

}
}
@media screen and (max-width:959px)
{
#WentWrong{
width:100%;
}
#butts{
width:100%;
}
#b1{
width:12%;
}
#b2{
width:12%;
}
img{
width:65%;
}
}
@media screen and (max-width:640px)
{
#WentWrong{
width:100%;
}
#b1{
width:12%;

}
#b2{
width:12%;
}
#butts{
width:100%;
}
img{
width:65%;

}
}
@media screen and (max-width:300px)
{
#WentWrong{
width:100%;
}
#b1{
width:12%;

}
#b2{
width:12%;
}
#butts{
width:100%;
}
img{
width:65%;

}
}



</style>
<body onload="getErrorMessage()">
				<% 
					String message = null;
					try
					{
							HttpSession sess = request.getSession();
							message = sess.getAttribute("exception").toString();
					}
					catch (Exception e)
					{
						RequestDispatcher rd = request.getRequestDispatcher("WentWrong.jsp");
					}
					
																%>

<div id="WentWrong">
<img src="wentwrong.png">

</div>

<div id="butts">
<span><button id="b1"  >Report Error</button><button id="b2">Back Home</button></span>

</div>
<div id='error_message'>

<h1 align="center"></h1>

</div>
</body>
<script>
	function getErrorMessage()
	{
		var value = "<%=message%>";
		document.getElementById("error_message").innerHTML = "<h5 align=\"center\">" + value + "</h5>" + "<p> Remove it when deploying the system </p>"
	}
</script>
</html>
