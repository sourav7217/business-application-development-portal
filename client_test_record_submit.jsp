<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href = "IT_HOD.css">
<title>IT-HOD</title>
<div id ="menu">
<div id="logo"><img src="bhel.png" height="100%" width="100%"></div>
<div id="logotext"><font size="6" color="#2116a2"><b>Bharat Heavy Electricals Limited</b></font></font><span></span></div>
<div id="menulist"><a href="login.jsp">Log In</a></div>
<div id="menulist"><a href="#">Sign Up</a></div>
</div>
<body link="green" background="body.jpg"><br><br><br><br><br><br><br>
<center><h3>Submited List</h3></center>
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
			/*try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "select * from test_record where req_no='"+reqid+"'";
			//out.println("::"+qry);
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(qry);
			while(rs.next())	
			{	int j=1;
%>				
				<table align="center" cellpadding="5" cellspacing="5" border="1">    
				<tr bgcolor="#c2bdf9">
				<TH>Submited Forms</TH><th>view Test Report</th></tr>
				<tr>
				<TD> <%= rs.getString("test_name") %> </TD><td><a href="test_record_view.jsp?srs=<%=reqid%>">View Details</a></td>
				</tr>
				</table>
<%			}
			}
			catch(Exception e)
			{
				out.println(e);
			}*/
%>
<%
try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "update test_record set status='client_submit' where req_no='"+reqid+"'";
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
			String qry = "select * from test_record where devid='"+username+"' and status='client_submit'";
			//out.println("::"+qry);
			Statement st=con.createStatement();
			ResultSet rs1=st.executeQuery(qry);
			while(rs1.next())	
			{	String reqid1=rs1.getString("req_no");
%>				
				
				<tr bgcolor="#c2bdf9">
				<TH>Submited Forms</TH><th>view Test Report</th></tr>
				<tr>
				<TD> <%= rs1.getString("test_name") %> </TD><td><a href="test_record_view.jsp?srs=<%=reqid1%>&username=<%=username%>">View Details</a></td>
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
