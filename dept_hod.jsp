<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href = "dept-hod.css">
<title>Dept-HOD</title>
<script type="text/javascript">

function showCommentBox(){
var div=document.getElementById('comment');
div.className='visible';
document.thisForm2.submit();
}

</script>
</head>

<div id ="menu">
<div id="logo"><img src="bhel.png" height="100%" width="100%"></div>
<div id="logotext"><font size="6" color="#2116a2"><b>Bharat Heavy Electricals Limited</b></font></font><span></span></div>
<div id="menulist"><a href="login.jsp">Log In</a></div>
<div id="menulist"><a href="#">Sign Up</a></div>
</div>
<div id="body"> 
<body link="green" background="body.jpg">
<%	String username = session.getAttribute("username").toString(); 

			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con5 = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry5 = "select * from dept_hod where userid='"+username+"'";
			Statement st5=con5.createStatement();
			ResultSet rs5=st5.executeQuery(qry5);
			rs5.next();
			String dept=rs5.getString("department");

%>
<center><h2>Department of <%=dept%></h2></center><br><br>
<div id="box">
<center><h3>Forms wait for approval</h3></center><br><br>
</div>
<%	 
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "select * from requisition where status is null and department=(select department from dept_hod where userid='"+username+"')";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(qry);
			while(rs.next())				
			{	
				String path=rs.getString("file_name");
				int j = Integer.parseInt(rs.getString("SL"));
				String reqid1= rs.getString("requisition_no");
				//session.setAttribute("reqid",reqid1);
				
			%>	<center>
				<br><br><input type="radio" name="radio" value="<%j=j+1;%>">
				<a href="downloadfile1.jsp?reqid=<%=reqid1%>"><%=path%></a>
				<!--a href="downloadfile1.jsp"><!%=path%></a-->
				<!--a href="view.jsp?reqid=<!%=reqid1%>">View Details</a-->
				<!--a href="view.jsp">View Details</a-->
				<form action="view.jsp" method="post">
				<input type="hidden" name="reqid1" value="<%=reqid1%>">
				<input type="submit" value="View Details">
				</form>
				
				<form name="thisForm1" action="approve.jsp" method="post">
				<%session.setAttribute("username",username);%>
				<input type="hidden" name="reqid1" value="<%=reqid1%>">
				<input type="submit" value="Accept">
				</form>
				<form name="thisForm2" action="reject.jsp" method="post">
				<%session.setAttribute("username",username);%>
				<input type="hidden" name="reqid1" value="<%=reqid1%>">
				<input type="button" value="Reject" onclick="showCommentBox()"><br>
				<div class="hidden" id="comment">
				<p>Comments and suggestions:<br><textarea name="comments" rows="3" cols="30"></textarea><br><br>
				<input type="submit" value="Send"></p>
				</div>
				</form>
				<form action="dept_verify_test_record.jsp" method="post">
				<input type="hidden" name="reqid1" value="<%=reqid1%>">
				<input type="submit" value="Verify Test Record">
				</form></center>
			<%	
			}
			
		}
		catch(Exception e)
		{
			out.println(e);
		}
%>
				<br><br><br><center>
				<form action="submit.jsp" method="post">
				<input type="hidden" name="username" value="<%=username%>">
				<input type="submit" value="Submited Requisition List">
				</form>
				<form action="reject.jsp" method="post">
				<input type="hidden" name="username" value="<%=username%>">
				<input type="submit" value="Rejected Requisition List">
				</form>
				<form action="dept_verify_test_record.jsp" method="post">
				<input type="hidden" name="username" value="<%=username%>">
				<input type="submit" value="Verify Test Record"></form>
				<form action="dept_view_deploy.jsp" method="post">
				<input type="hidden" name="username" value="<%=username%>">
				<input type="submit" value="Verify Deployment Forms">
				</form>
				
				</center>
</body>
</div>
</html>