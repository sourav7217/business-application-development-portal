<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
<link rel="stylesheet" type="text/css" href="IT_HOD.css">
<div id ="menu">
<div id="logo"><img src="bhel.png" height="100%" width="100%"></div>
<div id="logotext"><font size="6" color="#2116a2"><b>Bharat Heavy Electricals Limited</b></font></font><span></span></div>
<div id="menulist"><a href="login.jsp">Log In</a></div>
<div id="menulist"><a href="#">Sign Up</a></div>
</div>
<body background="body.jpg"><br><br><br><br><br><br><br><br><br>
<%		String username=session.getAttribute("username").toString();
		String password=session.getAttribute("password").toString();%>
		<center><br><br>
		<form action="client_submit.jsp" method="post">
		<input type="hidden" name="submit" value="<%=username%>">
		<input type="submit" value="Submited Requisition List"></form>
		<form action="client_reject.jsp" method="post">
		<input type="hidden" name="reject" value="<%=username%>">
		<input type="submit" value="Rejected Requisition List"></form>
		<form action="client_verify_test_record.jsp" method="post">
		<input type="hidden" name="username" value="<%=username%>">
		<input type="submit" value="Verify Test Record"></form>
		<!--a href="client_submit.jsp?username=<%=username%>">Submited List</a> <br><br>
		<a href="client_reject.jsp?username=<%=username%>">Rejected List</a><br><br-->
		<a href="requisitionform.html">Go to Requisition Form</a>
		<center>
		
</body>
</html>