<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<HTML>
    <HEAD>
        <TITLE>Reject</TITLE>
    </HEAD>

    <body background="body.jpg">
        <center><H3>Successfully rejected!</H3></center>
        <BR>
        <BR>
<%			String username = request.getParameter("username");
			//out.println("::"+username);
			String reqid = request.getParameter("srs");
			//out.println("::"+reqid);
			String comment=request.getParameter("comments");
			///out.println("<center><B>Comment:: </B>" + comment + "<BR><center>");
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con3 = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			PreparedStatement pst=con3.prepareStatement("update security_test set com=(?) where req_no='"+reqid+"'");
			pst.setString(1,comment);
			pst.executeUpdate();
			try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "update security_test set status='reject' where req_no='"+reqid+"'";
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
			
<%
			try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry1 = "select * from security_test where status='reject' and req_no='"+reqid+"'";
			//out.println("::"+qry1);
			Statement st1=con1.createStatement();
			ResultSet rs=st1.executeQuery(qry1);
			while(rs.next())	{	

%>
			<tr bgcolor="#c2bdf9">
			<TH>Security Test Report Name</TH></tr>
			<tr><TD> <%= rs.getString("s_test_name") %></TD></tr>

			
<%			}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
%>
</table>
			<center><Strong>Rejected list</strong></center><br><br>
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

			</style>			
<%			try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "select *  from security_test where status='reject' and devid='"+username+"'";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(qry);
			while(rs.next())	
			{		String reqid1=rs.getString("req_no");
%>			
			 
			<tr bgcolor="#c2bdf9">
			<TH>Security Test Report number</TH>
			<TH>View Security Test Report</TH>
			</tr>
			<tr>
			<td> <%= rs.getString("s_test_name") %> </TD>
			<td>
				<form action="sec_view.jsp" method="post">
				<input type="hidden" name="srs" value="<%=reqid1%>">
				<input type="submit" value="View">
				</form>
			</td>
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