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
        <center><H3>Successfulily filled SRS !</H3></center>
       <center><h3>Here's what you and others have said:</h3></center>
        <BR>
        <BR>
        <%	
			String devid = request.getParameter("devid");
	        String req_no = request.getParameter("req_no");
            String name = request.getParameter("name");
			String sys_desc = request.getParameter("sys_desc");
            String srs1 = request.getParameter("srs1");
			String srs2 = request.getParameter("srs2");
			String srs3 = request.getParameter("srs3");
			String srs4 = request.getParameter("srs4");
			String space = request.getParameter("space");
			String user_sys = request.getParameter("user_sys");
            String data_volumn = request.getParameter("data_volumn");
			String backup= request.getParameter("backup");
			String retention = request.getParameter("retention");
			String security = request.getParameter("security");
			try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "select * from requisition where requisition_no='"+req_no+"'";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(qry);
			rs.next();
            String srs_name=rs.getString("requisition_no")+"SRS";
             out.println("<center><B>System Requisition No:: </B>" + req_no + "<BR></center>");
             out.println("<center><B>Requisitioner Name:: </B>" + name + "<BR></center>");
			 out.println("<center><B>System Description:: </B>" + sys_desc + "<BR></center>");
			 out.println("<center><B>Requirement ID and Requirement (Functions, Controls, Validation etc.):::</B></center><BR>");
			 out.println("<center><B>SRS0001 :: </B>" + srs1 + "<BR></center>");
			 out.println("<center><B>SRS0002 :: </B>" + srs2 + "<BR></center>");
			 out.println("<center><B>SRS0003 :: </B>" + srs3 + "<BR></center>");
			 out.println("<center><B>SRS0004 :: </B>" + srs4 + "<BR></center>");
			 out.println("<center><B>use this space if necessary :: </B>" + space + "<BR></center>");
			 out.println("<center><B>Users of the system :: </B>" + user_sys + "<BR></center>");
			 out.println("<center><B>Data volume expected:: </B>" + data_volumn + "<BR></center>");
			 out.println("<center><B>Backup requirement :: </B>" + backup + "<BR></center>");
			 out.println("<center><B>Retention period:: </B>" + retention + "<BR></center>");
			 out.println("<center><B>Security requirement:: </B>" + security + "<BR></center>");
			 out.println("<center><B>DeveloperId:: </B>" + devid + "<BR></center>");
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			PreparedStatement pst=con1.prepareStatement("insert into srs (req_no,name,sys_desc,srs1,srs2,srs3,srs4,space,user_sys,data_volumn,backup,retention,security,srs_name) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			pst.setString(1,req_no);
			pst.setString(2,name);
			pst.setString(3,sys_desc);
			pst.setString(4,srs1);
			pst.setString(5,srs2);
			pst.setString(6,srs3);
			pst.setString(7,srs4);
			pst.setString(8,space);
			pst.setString(9,user_sys);
			pst.setString(10,data_volumn);
			pst.setString(11,backup);
			pst.setString(12,retention);
			pst.setString(13,security);
			pst.setString(14,srs_name);
			pst.executeUpdate();
			}
			catch(Exception e)
			{
				response.sendRedirect("error.jsp");
			}
			
%>
<%

			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry2 = "update requisition set srs='submit' where requisition_no='"+req_no+"'";
			Statement st2=con2.createStatement();
			st2.executeUpdate(qry2);
%>
<%

			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con3= DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry1 = "update srs set devid=(select developer from requisition where requisition_no='"+req_no+"') where req_no='"+req_no+"'";
			Statement st1=con3.createStatement();
			st1.executeUpdate(qry1);
%>

		<br><center><a href="developer.jsp">Return to main page</a></center>
		
    </BODY>
</HTML>