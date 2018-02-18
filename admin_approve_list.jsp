<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<HTML>
    <HEAD>
        <TITLE>Approval</TITLE>
    </HEAD>

    <body background="body.jpg">
	<center><Strong>List of approved Deployment Form</strong></center><br><br>
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
		
<%		
			try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con3 = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry3 = "select * from deploy where status='approve'";
			//out.println("::"+qry3);
			Statement st3=con3.createStatement();
			ResultSet rs=st3.executeQuery(qry3);
			while(rs.next())	
			{	
					String req_no= rs.getString("req_no");
%>	
			<tr bgcolor="#c2bdf9">
			<TH>Deployment Number</TH>
			<TH>View Details of deploment Form</TH>
			<TH>Forward to Developer</TH>
			</tr>
			<tr>
			<TD> <%= rs.getString("deploy_name") %> </TD>	
			<TD>
			<a href="deploy_view.jsp?reqid=<%=req_no%>">view</a>
			</TD>	
			<TD><form action="admin_deploy_submit.jsp?reqid=<%=req_no%>" method="post">
				<input type="hidden" name="view" value="submit">
				<input type="submit" value="submit">
				</form>
			</td>
			</tr>
			
			
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