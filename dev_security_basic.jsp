<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
       <center> <H3>Successfully filled !!!</H3><center>
       <center><h3>Here's what you and others have said:</h3></center>
        <BR>
        <BR>
        <%	
	        String req_no = request.getParameter("reg_number");
            String name = request.getParameter("app_description");
			String relate = request.getParameter("app_relate");
            String type = request.getParameter("type");
			String server = request.getParameter("server_db");
			String team = request.getParameter("team");
			String backup = request.getParameter("backup");
			String comment = request.getParameter("comments");
			String person = request.getParameter("tester");
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "select * from requisition where requisition_no='"+req_no+"'";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(qry);
			rs.next();
            String srs_name=rs.getString("requisition_no")+"SECURITY-TEST-REPORT";
             out.println("<center><B>Requisition Number & Application Code :: </B>" + req_no + "<BR></center>");
             out.println("<center><B>Application Name / Description :: </B>" + name + "<BR></center>");
			 out.println("<center><B>Application relates to:: </B>" + relate + "<BR></center>");
			 out.println("<center><B>Type of Application:: </B>" + type + "<BR><center>");
			 out.println("<center><B>Server & Databases to be used:: </B>" + server + "<BR></center>");
			 out.println("<center><B>Team Developing the application:: </B>" + team + "<BR></center>");
			 out.println("<center><B>Backup Person:: </B>" + backup + "<BR></center>");
			 out.println("<center><B>Special Comments (if any):: </B>" + comment + "<BR></center>");
			 out.println("<center><B>Person assigned for testing :: </B>" + person + "<BR></center>");
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con4 = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			PreparedStatement pst=con4.prepareStatement("insert into security_test (req_no,name,relate,type,server,team,backup,comment,tester,s_test_name) values (?,?,?,?,?,?,?,?,?,?)");
			pst.setString(1,req_no);
			pst.setString(2,name);
			pst.setString(3,relate);
			pst.setString(4,type);
			pst.setString(5,server);
			pst.setString(6,team);
			pst.setString(7,backup);
			pst.setString(8,comment);
			pst.setString(9,person);
			pst.setString(10,srs_name);
			pst.executeUpdate();
			
%>
<%		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry2 = "update security_test set status='submit' where req_no='"+req_no+"'";
			Statement st2=con2.createStatement();
			st2.executeUpdate(qry2);
}
catch(Exception e){out.println(e);}
%>
<%
			try
			{Class.forName("com.mysql.jdbc.Driver"); 
			Connection con3= DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry1 = "update security_test set devid=(select developer from requisition where requisition_no='"+req_no+"') where req_no='"+req_no+"'";
			Statement st1=con3.createStatement();
			st1.executeUpdate(qry1);}
			
			catch(Exception e){out.println(e);}
%>

		<br><center><a href="developer.jsp">Return to main page</a></center>
		
    </BODY>
</HTML>