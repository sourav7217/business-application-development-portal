<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<HTML>
    <HEAD><link rel="stylesheet" type="text/css" href = "developer.css">
        <TITLE>Approval</TITLE>
    </HEAD>
<div id ="menu">
<div id="logo"><img src="bhel.png" height="100%" width="100%"></div>
<div id="logotext"><font size="6" color="#2116a2"><b>Bharat Heavy Electricals Limited</b></font></font><span></span></div>
<div id="menulist"><a href="#">Log In</a></div>
<div id="menulist"><a href="#">Sign Up</a></div>
</div>
    <body background="body.jpg"><br><br><br><br><br><br><br><br><br>
        <center><H3>Thanks to approve Test Record!</H3></center>
        <BR>
        <BR>
<%			
			String reqid = request.getParameter("srs");
			//out.println("::"+reqid);
			String username = request.getParameter("username");
			try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry2 = "update test_record set status='approve' where req_no='"+reqid+"'";
			//out.println("::"+qry2);
			Statement st2=con2.createStatement();
			st2.executeUpdate(qry2);
			}
			catch(Exception e)
			{
				out.println(e);
			}
			
%>
<center><Strong>List of approved requisition form</strong></center><br><br>
<%			
			try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con3 = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry3 = "select * from test_record where status='approve' and devid='"+username+"'";
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
				text-align: left;
				padding: 8px;
				}

			tr:nth-child(even){background-color: #f2f2f2}
            </style>
			<table align="center" cellpadding="5" cellspacing="5" border="1">    
			<tr bgcolor="#c2bdf9">
			<TH>Test Record Number</TH>
			<TH>Forward To Developer</TH>
			</tr>
			<tr>
			<TD> <%= rs.getString("test_name") %> </TD>			
			<TD><a href="it_test_record_submit.jsp?reqid=<%=req_no%>">Submit</a>
			</td>
			</tr>
			</table>
			<form>
<%			}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
%>
</body>
</html>

