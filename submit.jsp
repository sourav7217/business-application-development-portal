<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<title>IT-HOD</title><link rel="stylesheet" type="text/css" href="IT_HOD.css">
<div id ="menu">
<div id="logo"><img src="bhel.png" height="100%" width="100%"></div>
<div id="logotext"><font size="6" color="#2116a2"><b>Bharat Heavy Electricals Limited</b></font></font><span></span></div>
<div id="menulist"><a href="login.jsp">Log In</a></div>
<div id="menulist"><a href="#">Sign Up</a></div>
</div>
<body background="body.jpg"><br><br><br><br><br><br><br>
			<center><Strong>Submited list</strong></center><br>
			<style>
			table {
				border-collapse: collapse;
				width: 40%;
				}

			th, td {
				text-align: left;
				padding: 8px;
				}
			tr:nth-child(even){background-color: #f2f2f2}
			</style>
<%			String reqid1 = request.getParameter("reqid");
			String username = request.getParameter("username");
			
			try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "select * from requisition where requisition_no='"+reqid1+"'";
			//out.println("::"+qry);
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(qry);
			while(rs.next())	
			{	String path=rs.getString("file_name");
				int j = Integer.parseInt(rs.getString("SL"));
%>
				<center>
				<br><br><input type="radio" name="radio" value="<%j=j+1;%>">
				<a href="downloadfile1.jsp?reqid=<%=reqid1%>"><%=path%></a>
				<form action="view.jsp" method="post">
				<input type="hidden" name="reqid1" value="<%=reqid1%>">
				<input type="submit" value="View Details">
				</form>
				<!--a href="downloadfile1.jsp"><!%=path%></a>
				<a href="view.jsp?reqid=<!%=reqid%>">View Details</a>
				<!--a href="view.jsp">View Details</a-->
		
			<table align="center" cellpadding="5" cellspacing="5" border="1">    
			<tr bgcolor="#c2bdf9">
			<TH>Submited Forms</TH>
			<tr>
			<TD> <%= rs.getString(10) %> </TD>
			</tr>
			</table>
<%			}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
%>
			
<%
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "update requisition set status='submit' where requisition_no='"+reqid1+"'";
			//out.println("::"+qry);
			Statement st=con.createStatement();
			st.executeUpdate(qry);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
%>
<table align="center" cellpadding="5" cellspacing="5" border="1">    
<%	
try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "select * from requisition where status='submit_to_dev' and developer='"+username+"'";
			//out.println("::"+qry);
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(qry);
			while(rs.next())	
			{	String path=rs.getString("file_name");
				int j = Integer.parseInt(rs.getString("SL"));
%>
			<tr bgcolor="#c2bdf9">
			<TH>Submited Forms</TH>
			<tr>
			<TD> <%= rs.getString(10) %> </TD>
			</tr>
		
<%			}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
%>
</table>
			
			<table align="center" cellpadding="5" cellspacing="5" border="1">    
			<style>
			table {
				border-collapse: collapse;
				width: 40%;
				}

			th, td {
				text-align: left;
				padding: 8px;
				}
			tr:nth-child(even){background-color: #f2f2f2}
			</style>
			
<%			try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "select *  from requisition where status='submit_to_dev' and department=(select department from dept_hod where userid='"+username+"')";
			//out.println("::"+qry);
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(qry);
			while(rs.next())	
			{
%>			
			<tr bgcolor="#c2bdf9">
			<th>Requisition number</th>
			</tr>
			<tr>
			<td> <%= rs.getString(10) %> </td>
			</tr>
			
<%			}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
%>
</table>
<center><br><br><a href="dept_hod.jsp">Back to home page</a></center>
</body>
</html>
