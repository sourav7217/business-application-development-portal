<html>
<head>
<link rel="stylesheet" type="text/css" href = "IT.css">
<title>Submit SRS</title>
<script type="text/javascript">



</script>
</head>
<div id ="menu">
<div id="logo"><img src="bhel.png" height="100%" width="100%"></div>
<div id="logotext"><font size="6" color="#2116a2"><b>Bharat Heavy Electricals Limited</b></font></font><span></span></div>
<div id="menulist"><a href="#">Log In</a></div>
<div id="menulist"><a href="#">Sign Up</a></div>
</div>
<body background="body.jpg">
<%String username = request.getParameter("username");%>
<div id="body">
<center><a href="it_hod.jsp">Go back to Home Page</a></center>
<center><h3>Submit SRS for Approval</h3></center>
<form action="dev_srs_basic.jsp" method="post">
<input type="hidden" name="devid" value="<%=username%>">
<center>System Requisition No:<br><br><input type="text" name="req_no"><br><br><br>			
Requisitioner Name:<br><br><input type="text" name="name"><br><br><br>						
System Description:<br><br><textarea name="sys_desc"rows='10' cols='40'></textarea><br><br><br>							

Requirement ID and Requirement (Functions, Controls, Validation etc.)<br><br>
SRS0001 :<br>  <textarea rows='10' cols='40' name="srs1"></textarea><br><br>
SRS0002 :<br>  <textarea rows='10' cols='40' name="srs2"></textarea><br><br> 
SRS0003 :<br>  <textarea rows='10' cols='40' name="srs3"></textarea><br><br>
SRS0004 :<br>  <textarea rows='10' cols='40' name="srs4"></textarea><br><br>

use this space if necessary :<br><br>
<textarea rows='10' cols='40 'name="space"></textarea><br><br><br>
Users of the system:<br><br><textarea name="user_sys" rows='5' cols='20'></textarea><br><br>

Data volume expected:<br><br><textarea name="data_volumn" rows='10' cols='40'></textarea><br><br><br>


Backup requirement:<br><textarea  name="backup" rows='10' cols='40'></textarea><br><br><br>

Retention period:<br><textarea name="retention"  rows='10' cols='40'></textarea><br><br><br>


Security requirement:<br><textarea rows='10' cols='40' name="security"></textarea><br><br><br>
<input type="submit" name="submit" value="submit"><br><br>
</form>
</center>
</div>
</body>
</html>