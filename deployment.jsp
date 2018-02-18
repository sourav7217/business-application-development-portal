<html>
<head>
<link rel="stylesheet" type="text/css" href = "deployment.css">
<title>Deployment Form</title>
<script type="text/javascript">

function myFunction()
{
document.getElementById("myDropdown").classList.toggle("show");
}
</script>
</head>
<div id ="menu">
<div id="logo"><img src="bhel.png" height="100%" width="100%"></div>
<div id="logotext"><font size="6" color="#2116a2"><b>Bharat Heavy Electricals Limited</b></font></font><span></span></div>
<div id="menulist"><a href="login.jsp">Log In</a></div>
<div id="menulist"><a href="#">Sign Up</a></div>
</div>
<body background="body.jpg">
<div id="box">

<center>
<a href="developer.jsp">Return to home page</a><br><br>
<h3>Deployment form</h3> :<br><br>
<form action="deploy_basic.jsp" method="post">
Requisition Number : <input type="text" name="req_no"><br><br>
IP Address to be used : <input type="text" name="ip"><br><br>
Name of Server : <input type="text" name="server"><br><br>

<input type="submit" value="submit" name="submit">
</center>


</div>
</body>