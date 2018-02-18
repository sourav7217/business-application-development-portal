<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href = "admin.css">
<title>Administrator</title>


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
<body  background="body.jpg">
<div id="ver_menu">
<a href="admin.jsp">Verify Deployment Form</a>
<a href="acceptance.jsp" class="active">Acceptance Approval</a>
</div>

<div id="box">
<center><h3>View Deployment Form</h3><br><br>
<center>	<form action="acceptance1.jsp">
			<select name ="select1"><br><br>
			<option value="developer">Developer</option>
			<option value="ak34">Akash Kundu</option>
			<option value="skb45">Sounak ka. singh</option>
			<option value="sourav34">Sourav Pal</option>
			</select>
			<input type="submit" value="submit">
			</form><br><br><br>
</center>
</center></div>
</body>
</html>