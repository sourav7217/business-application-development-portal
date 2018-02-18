<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href = "developer.css">
<title>Developer</title>
</head>
<div id ="menu">
<div id="logo"><img src="bhel.png" height="100%" width="100%"></div>
<div id="logotext"><font size="6" color="#2116a2"><b>Bharat Heavy Electricals Limited</b></font></font><span></span></div>
<div id="menulist"><a href="login.jsp">Log In</a></div>
<div id="menulist"><a href="#">Sign Up</a></div>
</div>
<body background="body.jpg">				
<%String username = session.getAttribute("username").toString();%>
<div id="ver_menu">
<a href="developer.jsp" class="active">Pending Projects</a>
<a href="dev_srs_submit.jsp">Submit SRS for Approval</a>
<a href="dev_Upload_Test_Record.jsp">Upload Test Record</a>
<a href="dev_Upload_Security_Testing.jsp">Upload Security Testing</a>
<a href="Submit_Deployment_form.jsp">Submit Deployment Form</a>
</div>	
<div id="ver_menu1">
<a href="project.jsp?username=<%=username%>" class="active">Preview Previous projects</a>
<a href="srs.jsp?username=<%=username%>">Preview Previous SRS</a>
<a href="test.jsp?username=<%=username%>">Preview Previous Test Report</a>
<a href="sec_test.jsp?username=<%=username%>">Preview Previous Security Testing</a>
<a href="deploy.jsp?username=<%=username%>">Preview Previous Deployment Form</a>
</div>	
<div id="box"><center><a href="submit.jsp?username=<%=username%>">Approved project</a><br><br>
<a href="reject.jsp?username=<%=username%>">Rejected project</a></center></div>
</body>
</html>