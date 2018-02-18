<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<HTML>
    <HEAD>
        <link rel="stylesheet" type="text/css" href = "IT_HOD.css">
    </HEAD>
	<div id ="menu">
<div id="logo"><img src="bhel.png" height="100%" width="100%"></div>
<div id="logotext"><font size="6" color="#2116a2"><b>Bharat Heavy Electricals Limited</b></font></font><span></span></div>
<div id="menulist"><a href="login.jsp">Log In</a></div>
<div id="menulist"><a href="#">Sign Up</a></div>
</div>
    <body background="body.jpg"><br><br><br><br><br><br><br><br>
       <center><H3>Successfulily filled Test Report !</H3></center><br><br>
       <center><strong>Here's what you and others have said:</strong></center>
        <BR>
        <BR>
        <%	
	        String req_no = request.getParameter("req_no");
			String date = request.getParameter("date");
            String tester = request.getParameter("tester");
			String severity = request.getParameter("severity");
			String summary = request.getParameter("summary");
			String radio = request.getParameter("radio1");
			String comment = request.getParameter("comment");
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "select * from requisition where requisition_no='"+req_no+"'";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(qry);
			rs.next();
			String test_name=rs.getString("requisition_no")+"Test_Report";
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			PreparedStatement pst=con1.prepareStatement("insert into test_record (req_no,date,tester,severity_defect,summary,radio,comment,test_name) values(?,?,?,?,?,?,?,?)");
			pst.setString(1,req_no);
			pst.setString(2,date);
			pst.setString(3,tester);
			pst.setString(4,severity);
			pst.setString(5,summary);
			pst.setString(6,radio);
			pst.setString(7,comment);
			pst.setString(8,test_name);
			pst.executeUpdate();
			/*
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry1 = "select date_format(date,'%d/%m/%y') from test_record where req_no='"+req_no+"'";
			PreparedStatement st2=con2.prepareStatement(qry1);
			ResultSet rs1=st2.executeQuery(qry1);
			rs1.next();
			String date1=rs1.getString("date");*/
			 out.println("<center><B>System Requisition No :: </B>" + req_no + "<BR></center>");
             out.println("<center><B>Date Tested :: </B>" + date + "<BR></center>");
			 out.println("<center><B>Tester :: </B>" + tester + "<BR></center>");
			 out.println("<center><B>Severity of Defect :: </B>" + severity + "<BR></center>");
			 out.println("<center><B>Summary of Defect :: </B>" + summary + "<BR></center>");
			 out.println("<center><B>Closed prior to production :: </B>" + radio + "<BR></center>");
			 out.println("<center><B>Comments :: </B>" + comment + "<BR></center>");
%>
<%

			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con3= DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry2 = "update test_record set devid=(select developer from requisition where requisition_no='"+req_no+"') where req_no='"+req_no+"'";
			Statement st1=con3.createStatement();
			st1.executeUpdate(qry2);
%>
<%

			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con4= DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry4 = "update test_record set end_user=(select name from requisition where requisition_no='"+req_no+"') where req_no='"+req_no+"'";
			Statement st4=con4.createStatement();
			st4.executeUpdate(qry4);
%>
<%

			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con5= DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry5 = "update test_record set department=(select department from requisition where requisition_no='"+req_no+"') where req_no='"+req_no+"'";
			Statement st5=con5.createStatement();
			st5.executeUpdate(qry5);
%>

		<br><center><a href="developer.jsp">Return to main page</a></center>
		
    </BODY>
</HTML>