<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<HTML>
    <HEAD>
        <TITLE>Approval</TITLE>
    </HEAD>

    <link rel="stylesheet" type="text/css" href="IT_HOD.css">
<div id ="menu">
<div id="logo"><img src="bhel.png" height="100%" width="100%"></div>
<div id="logotext"><font size="6" color="#2116a2"><b>Bharat Heavy Electricals Limited</b></font></font><span></span></div>
<div id="menulist"><a href="login.jsp">Log In</a></div>
<div id="menulist"><a href="#">Sign Up</a></div>
</div>
<body background="body.jpg"><br><br><br><br><br><br><br>
       <center> <H3>Successfully Approved !</H3></center>
        <BR>
        <BR>
<%			
			String reqid = request.getParameter("srs");
			//out.println("::"+reqid);
			String username = request.getParameter("username");
			
			try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry2 = "update deploy set status='approve' where req_no='"+reqid+"'";
			//out.println("::"+qry2);
			Statement st2=con2.createStatement();
			st2.executeUpdate(qry2);
			}
			catch(Exception e)
			{
				out.println(e);
			}
			
%>
<center> <a href="dept_hod.jsp">Back to home page</a></center>
</body>
</html>