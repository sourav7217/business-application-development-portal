<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
<link rel="stylesheet" type="text/css" href="IT_HOD.css">
<script type="text/javascript">
function showCommentBox(){
var div=document.getElementById('comment');
div.className='visible';
}
</script>
<div id ="menu">
<div id="logo"><img src="bhel.png" height="100%" width="100%"></div>
<div id="logotext"><font size="6" color="#2116a2"><b>Bharat Heavy Electricals Limited</b></font></font><span></span></div>
<div id="menulist"><a href="login.jsp">Log In</a></div>
<div id="menulist"><a href="#">Sign Up</a></div>
</div>
<body background="body.jpg"><br><br><br><br><br><br><br>
<%		String devid=request.getParameter("select1");
		String username=request.getParameter("username");
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "select * from test_record where devid='"+devid+"' and status is null and end_user='"+username+"'";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(qry);
			while(rs.next())				
			{	String path=rs.getString("test_name");	
				String req_no=rs.getString("req_no");
%>				<center>
				<br><br><input type="radio" name="radio" value="<%=req_no%>">
				<strong><%=path%></strong>
				<a href="test_record_view.jsp?srs=<%=req_no%>&username=<%=devid%>">View Details</a>
				<form action="client_test_record_approve.jsp?srs=<%=req_no%>&username=<%=devid%>" method="post">
				<input type="hidden" name="select1" value="<%=devid%>">
				<%session.setAttribute("username",devid);%>
				<input type="submit" value="Accept">
				</form>
				<form action="client_test_record_reject.jsp?srs=<%=req_no%>&username=<%=devid%>" method="post">
				<%session.setAttribute("username",devid);%>
				<input type="button" value="Reject" onclick="showCommentBox()"><br>
				<div class="hidden" id="comment">
				<p>Comments and suggestions:<br><textarea name="comments" rows="3" cols="30"></textarea><br><br>
				<input type="submit" value="Send"></p>
				</div>
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
<center><br><br><a href="it_test_record_submit.jsp?username=<%=username%>">Approve List</a> <br><br>
<a href="it_test_record_reject.jsp?username=<%=username%>">Rejected List</a><center>
</html>
</body>