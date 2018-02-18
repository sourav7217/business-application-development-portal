<html>
<head>
<link rel="stylesheet" type="text/css" href = "login.css">
<title>LOG IN</title>
</head>
<div id ="menu">
<div id="logo"><img src="bhel.png" height="100%" width="100%"></div>
<div id="logotext"><font size="6" color="#2116a2"><b>Bharat Heavy Electricals Limited</b></font></font><span></span></div>
<div id="menulist"><a href="#">Log In</a></div>
<div id="menulist"><a href="#">Sign Up</a></div>
</div>
<body background="body.jpg">
<div id="login_box">
<form method="post" action="reg.jsp">
<select name ="type1"><br><br>
<option value="select_user">Select User</option>
<option value="admin">Admin</option>
<option value="client">Client</option>
<option value="dept_hod">Dept HOD</option>
<option value="it_hod">IT HOD</option>
<option value="developer">Developer</option>
</select><br><br>

<font color="white">User ID</font> <input type = "text" name="username" style="width:200px;"><br><br>
<font color="white">Password</font>&nbsp;  <input type = "password" name="password" style="width:200px;">
<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="forgetpassword.jsp">forgot password ?</a>
<input type="submit" name="login_btn1" value ="Login">
</div>
</form>
</body>
</html>