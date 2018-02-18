<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<HTML>
<head>
<link rel="stylesheet" type="text/css" href = "IT_HOD.css">
<title>Deployment Form</title>
</HEAD>
<div id ="menu">
<div id="logo"><img src="bhel.png" height="100%" width="100%"></div>
<div id="logotext"><font size="6" color="#2116a2"><b>Bharat Heavy Electricals Limited</b></font></font><span></span></div>
<div id="menulist"><a href="login.jsp">Log In</a></div>
<div id="menulist"><a href="#">Sign Up</a></div>
</div>
    <body background="body.jpg"><br><br><br><br><br><br><br><br>
        <center> <H3>Successfulily filled Deployment Report !</H3><center>
        <center><h3>Thank you</h3></center>
        <BR>
        <BR>
        <%	
	        String req_no = request.getParameter("req_no");
			String ip = request.getParameter("ip");
            String server = request.getParameter("server");
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "select * from requisition where requisition_no='"+req_no+"'";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(qry);
			rs.next();
			String deploy_name=rs.getString("requisition_no")+"Deploy_Report";
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			PreparedStatement pst=con1.prepareStatement("insert into deploy (req_no,ip,server,deploy_name) values(?,?,?,?)");
			pst.setString(1,req_no);
			pst.setString(2,ip);
			pst.setString(3,server);
			pst.setString(4,deploy_name);
			pst.executeUpdate();
%>
<%

			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con3= DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry2 = "update deploy set devid=(select developer from requisition where requisition_no='"+req_no+"') where req_no='"+req_no+"'";
			Statement st1=con3.createStatement();
			st1.executeUpdate(qry2);
%>

<%
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con5= DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry5 = "update deploy set department=(select department from requisition where requisition_no='"+req_no+"') where req_no='"+req_no+"'";
			Statement st5=con5.createStatement();
			st5.executeUpdate(qry5);
%>
<%
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con6= DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry6 = "update deploy set end_user=(select name from requisition where requisition_no='"+req_no+"') where req_no='"+req_no+"'";
			Statement st6=con6.createStatement();
			st6.executeUpdate(qry6);
%>

		<br><a href="developer.jsp">Return to main page</a>
		
    </BODY>
</HTML>