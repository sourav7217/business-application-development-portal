<html>
<link rel="stylesheet" type="text/css" href="IT_HOD.css">
<div id ="menu">
<div id="logo"><img src="bhel.png" height="100%" width="100%"></div>
<div id="logotext"><font size="6" color="#2116a2"><b>Bharat Heavy Electricals Limited</b></font></font><span></span></div>
<div id="menulist"><a href="login.jsp">Log In</a></div>
<div id="menulist"><a href="#">Sign Up</a></div>
</div>
<body background="body.jpg"><br><br><br><br><br><br><br><br><br>
<%String username=request.getParameter("username");%>
<center><h3> View Test Record</h3><br><br>
			<form action="dept_view_test_record.jsp">
			<select name ="select1"><br><br>
			<option value="developer">Developer</option>
			<option value="ak34">Akash Kundu</option>
			<option value="skb45">Sounak ka. singh</option>
			<option value="sourav34">Sourav Pal</option>
			</select>
			<input type="hidden" name="username" value="<%=username%>">
			<input type="submit" value="submit">
			</form><br><br><br>
</center>
</div>
</body>
</html>