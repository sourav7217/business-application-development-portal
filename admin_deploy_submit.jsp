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
<%		
		String reqid=request.getParameter("reqid");
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "update deploy set status='submit' where req_no='"+reqid+"'";
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
			
<%			
			try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "select * from deploy where req_no='"+reqid+"' and status='submit'";
			//out.print(""+qry);
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(qry);
			while(rs.next())	
			{	String path=rs.getString("deploy_name");
				
%>
		
			<tr bgcolor="#c2bdf9">
			<TH>Submited Forms</TH>
			<TH>View Forms</TH></tr>
			<tr>
			<TD>
				
				<%=path%>
		
			</td>
			<td> 	
				<form action="deploy_view.jsp" method="post">
				<input type="hidden" name="reqid" value="<%=reqid%>">
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

<center><br><br><a href="login.jsp">Back to home page</a></center>
</body>
</html>
