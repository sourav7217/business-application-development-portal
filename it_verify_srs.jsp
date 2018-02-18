<html>
<head>
<link rel="stylesheet" type="text/css" href = "IT_HOD.css">
<title>Verify System Requirement Specification</title>
<script type="text/javascript">

function showCommentBox(){
var div=document.getElementById('comment');
div.className='visible';
}
</script>
</head>
<div id ="menu">
<div id="logo"><img src="bhel.png" height="100%" width="100%"></div>
<div id="logotext"><font size="6" color="#2116a2"><b>Bharat Heavy Electricals Limited</b></font></font><span></span></div>
<div id="menulist"><a href="login.jsp">Log In</a></div>
<div id="menulist"><a href="#">Sign Up</a></div>
</div>
<body background="body.jpg">
<div id="ver_menu">
<a href="it_hod.jsp">Verify System Requisition Form</a>
<a href="it_verify_srs.jsp" class="active">Verify SRS</a>
<a href="it_verify_test_record.jsp">Verify Test Report</a>
<a href="it_verify_sec.jsp">Verify Security Test Report</a>
<a href="it_deploy.jsp">Verify Client Certificate</a>
</div>

<div id="box">
<center><h3> View System Requirement Specification</h3><br><br>
			<form action="it_view_srs.jsp">
			<select name ="select1"><br><br>
			<option value="developer">Developer</option>
			<option value="ak34">Akash Kundu</option>
			<option value="skb45">Sounak ka. singh</option>
			<option value="sourav34">Sourav Pal</option>
			</select>
			<input type="submit" value="submit">
			</form><br><br><br>
</center>
</div>
</body>
</html>