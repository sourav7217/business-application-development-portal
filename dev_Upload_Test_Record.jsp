<html>
<head>
<link rel="stylesheet" type="text/css" href = "dev.css">
<title>Upload Security Testing
</title>
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
<div id="menulist"><a href="#">Log In</a></div>
<div id="menulist"><a href="#">Sign Up</a></div>
</div>
<body  background="body.jpg">
<div id="body">
<center><a href="developer.html">Return to home page</a>
<form action="test_record_basic.jsp" method="post">
<h3>System Testing Report</h3>
Requisition Number :<br> <input type="text" name="req_no"><br><br>
Date Tested  :<br> <input type="text" name="date"><br><br>
Tester :<br> <input type="text" name="tester"><br><br>
Severity of Defect :<br> <textarea rows='5' cols='40' name="severity"></textarea><br><br>
Summary of Defect : <br><textarea rows='5' cols='40' name="summary"></textarea><br><br>
Closed prior to production : <br>Yes <input type="radio" name="radio1" value="yes" checked> 
								 No <input type="radio" name="radio1" value="no"><br><br>
Comments :<br> <textarea rows='5' cols='40' name="comment"></textarea><br><br>
<input type="submit" name="submit" value="submit"><br><br>
</form>



</center>
</div>
</body>