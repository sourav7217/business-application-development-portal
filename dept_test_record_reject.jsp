<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<HTML>
    <HEAD>
       <link rel="stylesheet" type="text/css" href = "IT_HOD.css">
	   <TITLE>Reject</TITLE>
    </HEAD>
	<div id ="menu">
<div id="logo"><img src="bhel.png" height="100%" width="100%"></div>
<div id="logotext"><font size="6" color="#2116a2"><b>Bharat Heavy Electricals Limited</b></font></font><span></span></div>
<div id="menulist"><a href="login.jsp">Log In</a></div>
<div id="menulist"><a href="#">Sign Up</a></div>
</div>
    <body background="body.jpg"><br><br><br><br>
        <center><H3>Successfully rejected!</H3></center>
        <BR>
        
<%			String username = request.getParameter("username");
			//out.println("::"+username);
			String reqid = request.getParameter("srs");
			//out.println("::"+reqid);
			String comment=request.getParameter("comments");
			//out.println("<center><B>Comment:: </B>" + comment + "<BR><center>");
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con3 = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			PreparedStatement pst=con3.prepareStatement("update test_record set com=(?) where req_no='"+reqid+"'");
			pst.setString(1,comment);
			pst.executeUpdate();
			try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "update test_record set status='reject' where req_no='"+reqid+"'";
			//out.println("::"+qry);
			Statement st=con.createStatement();
			st.executeUpdate(qry);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
%>
<%
			try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry1 = "select * from test_record where status='reject' and req_no='"+reqid+"'";
			//out.println("::"+qry1);
			Statement st1=con1.createStatement();
			ResultSet rs=st1.executeQuery(qry1);
			while(rs.next())	{	

%>			<style>
			table {
				border-collapse: collapse;
				width: 60%;
				}

			th, td {
				text-align: left;
				padding: 8px;
				}
			tr:nth-child(even){background-color: #f2f2f2}
			</style>
			<table align="center" cellpadding="5" cellspacing="5" border="1">    
			<tr bgcolor="#c2bdf9">
			<TH>Test Report Name</TH>
			<TH>View Details</TH>
			</tr>
			<tr><TD> <%= rs.getString("test_name") %></TD>
			<td><a href="test_record_view.jsp?srs=<%=reqid%>">View Details</a></td>
			</tr>
			</tr>
			
<%			}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
%>   
			</table><br><br>
			<center><Strong>Rejected list</strong></center>
			<br><br><table align="center" cellpadding="5" cellspacing="5" border="1">
<%			try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "select *  from test_record where status='reject' and devid='"+username+"'";
			
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(qry);
			while(rs.next())	
			{String reqid1=rs.getString("req_no");
%>			<style>
			table {
				border-collapse: collapse;
				width: 40%;
				}

			th, td {
				text-align: left;
				padding: 8px;
				}

			</style>
			    
			<tr bgcolor="#c2bdf9">
			<TH>Test Report Name</TH>
			<TH>View Details</TH>
			</tr>
			<tr>
			<TD> <%= rs.getString("test_name") %> </TD>
			<td><a href="test_record_view.jsp?srs=<%=reqid1%>">View Details</a></td>
			</tr>
			
<%			}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
%>
</table>
<br><br> <center>
		<a href="logout.jsp">Log Out</a>
		</center>
</body>
</html>