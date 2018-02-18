<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<jsp>
<head>
<link rel="stylesheet" type="text/css" href = "IT_HOD.css">
<title>IT-HOD</title>
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
<body background="body.jpg">
<div id="ver_menu"><br><br><br>
<a href="it_hod.jsp" class="active">Verify System Requisition Form</a>
<a href="it_verify_srs.jsp">Verify SRS</a>
<a href="it_verify_test_record.jsp">Verify Test Report</a>
<a href="it_verify_sec.jsp">Verify Security Test Report</a>
<a href="it_deploy.jsp">Verify Client Certificate</a>
</div>
<div id="box">
<br><center><h3>Welcome IT Department</h3></center>
<center><h3>View System Requisition Form</h3></center><br><br>
<table align="center" cellpadding="5" cellspacing="5" border="1">  	
				
			<style>
			table {
				border-collapse: collapse;
				width: 100%;
				}

			th, td {
				text-align: left;
				padding: 8px;
				}

			tr:nth-child(even){background-color: #f2f2f2}
            </style> 
<%		String username = session.getAttribute("ithod").toString();
		String reqid=request.getParameter("reqid1");
			try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "select * from requisition where status='submit'";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(qry);
			while(rs.next())	
			{		
				String path=rs.getString("file_name");
				String reqid1= rs.getString("requisition_no");				
%> 
			<tr bgcolor="#c2bdf9">
			<th>File Name</th>
			<th>View Details</th>
			<th>Selection of Developer</th>
			<th>Submit To Developer</th>
			</tr>
			<tr>
			<td><a href="downloadfile1.jsp?reqid=<%=reqid1%>"><%=path%></a></td>
			<td><!--a href="view.jsp?reqid=<!%=reqid1%>">View Details</a-->
			<form action="view.jsp" method="post">
			<input type="hidden" name="reqid1" value="<%=reqid1%>">
			<input type="submit" value="View Details">
			</form></td>
			<td>
			<form action="it_submit.jsp" method = "post">
			<select name ="select"><br><br>
			<option value="developer">Developer</option>
			<option value="ak34">Akash Kundu</option>
			<option value="skb45">Sounak ka. singh</option>
			<option value="sourav34">Sourav Pal</option>
			</select><br><br></td>
			<td>
			<input type="hidden" name="reqid" value="<%=reqid1%>">	
			<input type="submit" value="Submit"></td>
			</tr>
			</form>
<%			}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
%>
</table>
</div>
</body>