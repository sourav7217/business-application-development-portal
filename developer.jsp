<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href = "developer.css">
<title>Developer</title>
</head>
<div id ="menu">
<div id="logo"><img src="bhel.png" height="100%" width="100%"></div>
<div id="logotext"><font size="6" color="#2116a2"><b>Bharat Heavy Electricals Limited</b></font></font><span></span></div>
<div id="menulist"><a href="login.jsp">Log In</a></div>
<div id="menulist"><a href="#">Sign Up</a></div>
</div>
<body background="body.jpg">
			<style>
			table {
				border-collapse: collapse;
				width: 60%;
				}

			th, td {
				text-align: left;
				padding: 8px;
				}

			tr:nth-child(even){background-color: #f2f2f2}
			</style>				
<%String username = session.getAttribute("username").toString();%>
<div id="ver_menu">
<a href="developer.jsp" class="active">Pending Projects</a>
<a href="dev_srs_submit.jsp?devid=<%=username%>">Submit SRS for Approval</a>
<a href="dev_Upload_Test_Record.jsp?devid=<%=username%>">Upload Test Record</a>
<a href="dev_Upload_Security_Testing.jsp">Upload Security Testing</a>
<a href="deployment.jsp">Submit Deployment Form</a>
</div>	
<div id="ver_menu1">
<a href="project.jsp?username=<%=username%>" class="active">Preview Previous projects</a>
<a href="srs.jsp?username=<%=username%>">Preview Previous SRS</a>
<a href="test.jsp?username=<%=username%>">Preview Previous Test Report</a>
<a href="sec_test.jsp?username=<%=username%>">Preview Previous Security Testing</a>
<a href="deploy.jsp?username=<%=username%>">Preview Deployment Form</a>
</div>	
 
<div id="box">
<table align="center" cellpadding="5" cellspacing="5" border="1">  
<%		
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "select * from requisition where status='submit' or status='submit_to_dev' and developer='"+username+"'";
			//out.println(""+qry);
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(qry);
			while(rs.next())	
			{	
				String path=rs.getString("file_name");
				String reqid= rs.getString("requisition_no");				
%>
			<tr bgcolor="#c2bdf9">
			<TH>File Name</TH>
			<TH>View Details</TH>
			</tr>
			<tr>
			<TD><a href="downloadfile1.jsp?reqid=<%=reqid%>"><%=path%></a></TD>
			<TD>
				<form action="view.jsp" method="post">
				<input type="hidden" name="reqid1" value="<%=reqid%>">
				<input type="submit" value="View">
				</form>
			<!--a href="view.jsp?reqid=<!%=reqid%>">View Details</a-->
			</TD>
			</tr>
<%			}

%>
</div>
</table> 
</body>
</html>