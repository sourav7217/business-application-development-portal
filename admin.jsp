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
<div id="menulist"><a href="login.jsp">Log in</a></div>
<div id="menulist"><a href="#">Sign Up</a></div>
</div>
<body background="body.jpg">
<div id="ver_menu">
<a href="admin.jsp" class="active">Verify Deployment Form</a>
<a href="acceptance.jsp" >Acceptance Approval</a>
</div>

<div id="box">
<center><h3>Verify Deployment Form</h3><br><br>
			<form action="client_view_deploy.jsp">
			<select name ="select1"><br><br>
			<option value="developer">Developer</option>
			<option value="ak34">Akash Kundu</option>
			<option value="skb45">Sounak ka. singh</option>
			<option value="sourav34">Sourav Pal</option>
			</select>
			<input type="submit" value="submit">
			</form><br><br><br><br><br><br><br><br><br>
			<a href="admin_approve_list.jsp">Approved List</a><br><br>
			<a href="admin_reject_list.jsp">Rejected List</a>
</center>

</div>
</body>
</html>