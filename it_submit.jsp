<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<title>IT-HOD</title>
<body background="body.jpg">
<center><h3>Submited List</h3></center><br>
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
<%		String developer=request.getParameter("select");
		String reqid=request.getParameter("reqid");
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "update requisition set developer='"+developer+"'  where requisition_no='"+reqid+"'";
			//out.print("::"+qry);
			Statement st=con.createStatement();
			st.executeUpdate(qry);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
%>
<table align="center" cellpadding="5" cellspacing="5" border="1">    
			<tr bgcolor="#c2bdf9">
<%			
			try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "select * from requisition where requisition_no='"+reqid+"'";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(qry);
			while(rs.next())	
			{	String path=rs.getString("file_name");
				int j = Integer.parseInt(rs.getString("SL"));
%>
		
			
			<TH>Submited Forms</TH>
			<TH>View Forms</TH>
			<tr>
			<TD><center>
				<input type="radio" name="radio" value="<%j=j+1;%>">
				<a href="downloadfile1.jsp?reqid=<%=reqid%>"><%=path%></a>
				<!--a href="view.jsp?reqid=<%=reqid%>">View Details</a-->
			</td>
			<td> 	
				<form action="view.jsp" method="post">
				<input type="hidden" name="reqid1" value="<%=reqid%>">
				<input type="submit" value="View Details">
				</form>
				</TD>
			</tr>
			
<%			}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
%>
</table>
<%	
try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "update requisition set status='submit_to_dev' where requisition_no='"+reqid+"'";
			Statement st=con.createStatement();
			st.executeUpdate(qry);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
%>
<center><br><br><a href="login.jsp">Back to home page</a></center>
</body>
</html>
