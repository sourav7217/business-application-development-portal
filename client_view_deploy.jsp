<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
<<link rel="stylesheet" type="text/css" href="IT_HOD.css">
<div id ="menu">
<div id="logo"><img src="bhel.png" height="100%" width="100%"></div>
<div id="logotext"><font size="6" color="#2116a2"><b>Bharat Heavy Electricals Limited</b></font></font><span></span></div>
<div id="menulist"><a href="login.jsp">Log In</a></div>
<div id="menulist"><a href="#">Sign Up</a></div>
</div>
<body background="body.jpg"><br><br><br><br><br><br><br>

<center><h3>Deployment List</h3></center>
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
			
<%		String devid=request.getParameter("select1");
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "select * from deploy where devid='"+devid+"' and status is null";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(qry);
			while(rs.next())				
			{	String path=rs.getString("deploy_name");	
				String req_no=rs.getString("req_no");
%>				
		<br><br><center>
			<tr bgcolor="#c2bdf9">
			<th>Deployment Form Name</th>
			<th>View Details</th>
			<th>Submit To Dept_Hod</th>
			</tr><tr>
			<td><%=path%></td>
			<td>
			<form action="deploy_view.jsp" method="post">
			<input type="hidden" name="reqid" value="<%=req_no%>">
			<input type="submit" value="View Details">
			</form></td>
			<td>
			<form action="admin_deploy_submit.jsp" method="post">
			<input type="hidden" name="reqid" value="<%=req_no%>">	
			<input type="submit" value="Submit"></td>
			</tr>
			</form>
			<%	
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
%>
</table>
<center><br><br><a href="login.jsp">Back to home page</a></center>
</html>
</body>