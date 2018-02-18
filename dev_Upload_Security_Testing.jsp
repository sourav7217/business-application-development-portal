<html>
<head>
<link rel="stylesheet" type="text/css" href = "IT.css">
<title>Upload Test Record</title>
</head>

<div id ="menu">
<div id="logo"><img src="bhel.png" height="100%" width="100%"></div>
<div id="logotext"><font size="6" color="#2116a2"><b>Bharat Heavy Electricals Limited</b></font></font><span></span></div>
<div id="menulist"><a href="#">Log In</a></div>
<div id="menulist"><a href="#">Sign Up</a></div>
</div>
<body background="body.jpg">
<div id="body">
<center><a href="developer.jsp">Go back to Home Page</a></center><br><br>

<center><h3>Upload Security Test Record</h3></center>
<form action="dev_security_basic.jsp" method="post">
<center>Requisition Number & Application Code :<br><br><input type="text" name="reg_number"><br><br><br>			
Application Name/ Description :<br><br><textarea name="app_description" rows='5' cols='20'></textarea><br><br><br>							
Application relates to :<br><br><textarea name="app_relate"rows='5' cols='20'></textarea><br><br><br>							


Type of Application<br>  <textarea name="type" rows='5' cols='20'></textarea><br><br>
Server & Databases to be used<br><br><textarea name="server_db" rows='5' cols='20'></textarea><br><br> 
Team Developing the application<br>  <textarea name="team" rows='5' cols='20'></textarea><br><br>
Backup Person<br>  <textarea name="backup" rows='5' cols='20'></textarea><br><br>


Special Comments (if any)<br><br><textarea name="comments" rows='10' cols='40'></textarea><br><br>
Person assigned for testing : <br><br><textarea name="tester" rows="5" cols="20"></textarea><br><br>

<input type="submit" value="submit"><br><br>
</center>
</form>
</div>
</body>
</html>