<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<HTML>
    <HEAD>
        <TITLE>Approval</TITLE>
    </HEAD>

    <BODY background="body.jpg">
        <BR>
        <BR>
<%			String username = session.getAttribute("username").toString();%>
<center><Strong>List of approved requisition form</strong></center><br><br>
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
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "select * from requisition where status='submit_to_dev' and name='"+username+"'";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(qry);
			while(rs.next())	
			{	
					String reqid= rs.getString("requisition_no");
%>	
			
			<tr bgcolor="#c2bdf9">
			<TH>Requisition number</TH>
			<TH>View details</TH>
			</tr>
			<tr>
			<TD> <%= rs.getString(10) %> </TD>			
			<TD><!--a href="view.jsp?reqid=<!=reqid%>">View</a-->
			<form action="view.jsp" method="post">
			<input type="hidden" name="reqid1" value="<%=reqid%>">
			<input type="submit" value="View Details">
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
<br><br> <center>
		<a href="logout.jsp">Log Out</a>
		</center>
</body>
<html>