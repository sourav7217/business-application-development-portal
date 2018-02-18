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
<%String username = request.getParameter("username");%>
<div id="ver_menu">
<a href="developer.jsp">Pending Projects</a>
<a href="dev_srs_submit.jsp">Submit SRS for Approval</a>
<a href="dev_Upload_Test_Record.jsp">Upload Test Record</a>
<a href="dev_Upload_Security_Testing.jsp">Upload Security Testing</a>
<a href="deployment.jsp" class="active">Submit Deployment Form</a>
</div>	
<div id="ver_menu1">
<a href="project.jsp?username=<%=username%>" >Preview Previous projects</a>
<a href="srs.jsp?username=<%=username%>" >Preview Previous SRS</a>
<a href="test.jsp?username=<%=username%>">Preview Previous Test Report</a>
<a href="sec_test.jsp?username=<%=username%>">Preview Previous Security Testing</a>
<a href="deploy.jsp?username=<%=username%>" class="active">Preview Deployment Form</a>
</div>	
<div id="box"><center>
<table align="center" cellpadding="5" cellspacing="5" border="1">    
<%		
			try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con3 = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry3 = "select * from deploy where status='submit' and devid='"+username+"'";
			//out.println("::"+qry3);
			Statement st3=con3.createStatement();
			ResultSet rs=st3.executeQuery(qry3);
			while(rs.next())	
			{	
					String req_no= rs.getString("req_no");
%>			
				
			<style>
			table {
				border-collapse: collapse;
				width: 60%;
				}

			th, td {
				text-align: center;
				padding: 8px;
				}

			tr:nth-child(even){background-color: #f2f2f2}
            </style>
		
			<tr bgcolor="#c2bdf9">
			<TH>Deployment Number</TH>
			<TH>View Details of deploment Form</TH>
			<TH>submit to Admin</TH>
			<TH>Reject</TH>
			</tr>
			<tr>
			<TD> <%= rs.getString("deploy_name") %> </TD>	
			<TD>
			<a href="deploy_view.jsp?reqid=<%=req_no%>">view</a>
			</TD>	
			<TD><a href="dev_submit_to_admin_deployform.jsp?reqid=<%=req_no%>">submit</a> </TD>
			<TD><a href="dept_deploy_reject.jsp">reject</a> </TD>
			</tr>
			
			
<%			}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
%>
</table>
</center>
</div>
</body>
</html>