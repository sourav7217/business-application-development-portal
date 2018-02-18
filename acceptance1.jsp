<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href = "admin.css">
<title>Administrator</title>

<script type="text/javascript">

function myFunction()
{
document.getElementById("myDropdown").classList.toggle("show");
}
</script>
</head>
<div id ="menu">
<div id="logo"><img src="bhel.png" height="100%" width="100%"></div>
<div id="logotext"><font size="6" color="#2116a2"><b>Bharat Heavy Electricals Limited</b></font></font><span></span></div>
<div id="menulist"><a href="login.jsp">Log In</a></div>
<div id="menulist"><a href="#">Sign Up</a></div>
</div>
<body  background="body.jpg">
<div id="ver_menu">
<a href="admin.jsp">Verify Deployment Form</a>
<a href="acceptance.jsp" class="active">Acceptance Approval</a>
</div><br><br><br><br><br><br><br><br><br>	
<center><Strong>Confirmation Of Deployment Form</strong></center><br><br>
<table align="center" cellpadding="5" cellspacing="5" border="1">    
				
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
<%			String username=request.getParameter("select1");
			try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con3 = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry3 = "select * from deploy where status='submit_to_admin' and devid='"+username+"'";
			//out.println("::"+qry3);
			Statement st3=con3.createStatement();
			ResultSet rs=st3.executeQuery(qry3);
			while(rs.next())	
			{	
					String req_no= rs.getString("req_no");
%>			

			
			<tr bgcolor="#c2bdf9">
			<TH>Deployment Form Number</TH>
			<TH>View Final Details</TH>
			</tr>
			<tr>
			<TD> <%= rs.getString("deploy_name") %> </TD>			
			<TD><a href="deploy_view.jsp?reqid=<%=req_no%>">Final View</a>
			</td>
			</tr>
			
			<form>
<%			}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
%>
</table>
</body>
</html>
