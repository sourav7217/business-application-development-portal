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
</div><br><br><br><br><br><br><br>
<body background="body.jpg">
<%		String devid=request.getParameter("select1");
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "select * from security_test where devid='"+devid+"' and status='submit' 	";
			//out.println("::"+qry);
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(qry);
			while(rs.next())				
			{	String path=rs.getString("s_test_name");	
				String req_no=rs.getString("req_no");
%>				<center>
				<br><br><input type="radio" name="radio" value="<%=req_no%>">
				<strong><%=path%></strong>
				<form action="sec_view.jsp" method="post">
				<input type="hidden" name="srs" value="<%=req_no%>">
				<%session.setAttribute("username",devid);%>
				<input type="submit" value="View">
				</form>
				<!--a href="sec_view.jsp?srs=<!%=req_no%>">View Details</a-->
				<form action="it_sec_approve.jsp" method="post">
				<input type="hidden" name="username" value="<%=devid%>">
				<input type="hidden" name="srs" value="<%=req_no%>">
				<%session.setAttribute("username",devid);%>
				<input type="submit" value="Accept">
				</form>
				<form action="it_sec_reject.jsp" method="post">
				<input type="hidden" name="username" value="<%=devid%>">
				<input type="hidden" name="srs" value="<%=req_no%>">
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
<center>
				<br><br><form action="it_sec_reject.jsp" method="post">
				<input type="hidden" name="username" value="<%=devid%>">
				<input type="submit" value="Rejected List">
				</form>
				<form action="it_sec_submit.jsp" method="post">
				<input type="hidden" name="username" value="<%=devid%>">
				<input type="submit" value="Accepted List">
				</form>
<!--a href="it_sec_submit.jsp?username=<!%=devid%>">Submited List</a> <br><br>
<a href="it_sec_reject.jsp?username=<!%=devid%>">Rejected List</a--><center>
</html>
</body>