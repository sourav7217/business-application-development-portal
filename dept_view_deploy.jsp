<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
<link rel="stylesheet" type="text/css" href="IT_HOD.css">
<div id ="menu">
<div id="logo"><img src="bhel.png" height="100%" width="100%"></div>
<div id="logotext"><font size="6" color="#2116a2"><b>Bharat Heavy Electricals Limited</b></font></font><span></span></div>
<div id="menulist"><a href="login.jsp">Log In</a></div>
<div id="menulist"><a href="#">Sign Up</a></div>
</div>
<body background="body.jpg"><br><br><br><br><br><br><br>
<%		String username = request.getParameter("username");
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "select * from deploy where status='submit' and department=(select department from dept_hod where userid='"+username+"')";
			//out.print(""+qry);
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(qry);
			while(rs.next())				
			{	String path=rs.getString("deploy_name");	
				String req_no=rs.getString("req_no");
%>				<center>
				<br><br><input type="radio" name="radio" value="<%=req_no%>">
				<strong><%=path%></strong>
				<a href="deploy_view.jsp?reqid=<%=req_no%>">View Details</a>
				<form action="dept_deploy_approve.jsp?srs=<%=req_no%>&username=<%=username%>" method="post">
				<input type="hidden" name="select1" value="<%=username%>">
				<input type="submit" value="Accept">
				</form>
				<form action="dept_deploy_reject.jsp?srs=<%=req_no%>&username=<%=username%>" method="post">
				<input type="submit" value="Reject">
				</form>
				</center>
			<%	
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
%>
<!--center><a href="dept_test_record_submit.jsp?username=<!%=devid%>">Approve List</a> <br><br>
<a href="dept_test_record_reject.jsp?username=<!%=devid%>">Rejected List</a><center-->
</html>
</body>