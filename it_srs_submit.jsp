<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<title>IT-HOD</title>
<body link="green" background="body.jpg">
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
<%			String reqid = request.getParameter("reqid");
			String username = request.getParameter("username");
			try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "select * from srs where req_no='"+reqid+"'";
			//out.println("::"+qry);
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(qry);
			while(rs.next())	
			{	int j=1;
%>				
				<table align="center" cellpadding="5" cellspacing="5" border="1">    
				<tr bgcolor="#c2bdf9">
				<TH>Submited Forms</TH><th>view Security Test Report</th></tr>
				<tr>
				<TD> <%= rs.getString("srs_name") %> </TD>
				<td><!--a href="srs_view.jsp?srs=<!%=reqid%>">View Details</a-->
				<form action="srs_view.jsp" method="post">
				<input type="hidden" name="srs" value="<%=reqid%>">
				<input type="submit" value="View Details">
				</form>
				</td>
				</tr>
				</table>
<%			}
			}
			catch(Exception e)
			{
				out.println(e);
			}
%>
<%
try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "update srs set status='dev_srs_submit' where req_no='"+reqid+"'";
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
<%try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "select * from srs where devid='"+username+"' and status='dev_srs_submit'";
			//out.println("::"+qry);
			Statement st=con.createStatement();
			ResultSet rs1=st.executeQuery(qry);
			while(rs1.next())	
			{	String reqid1=rs1.getString("req_no");
%>				
				
				<tr bgcolor="#c2bdf9">
				<TH>Submited Forms</TH><th>view Security Test Report</th></tr>
				<tr>
				<TD> <%= rs1.getString("srs_name") %> </TD>
				<td><!--a href="srs_view.jsp?srs=<!%=reqid1%>">View Details</a-->
				<form action="srs_view.jsp" method="post">
				<input type="hidden" name="srs" value="<%=reqid1%>">
				<input type="submit" value="View Details">
				</form>
				</td>
				</tr>
				
<%			}
			}
			catch(Exception e)
			{
				out.println(e);
			}
%>
</table>
<center><br><br><a href="login.jsp">Back to home page</a></center>
</body>
</html>
