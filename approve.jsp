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
        <center><H3>Thanks to approve requisition form !</H3></center>
        <BR>
        <BR>
<%			String username = session.getAttribute("username").toString();
			String reqid1 = request.getParameter("reqid1");
			try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "update requisition set status='approve' where requisition_no='"+reqid1+"'";
			Statement st=con.createStatement();
			st.executeUpdate(qry);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
%>
<center><Strong>List of approved requisition form</strong></center><br><br>
		
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
<%			
			try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "select * from requisition where status='approve' and department=(select department from dept_hod where userid='"+username+"')";
			//out.println("::"+qry);
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(qry);
			while(rs.next())	
			{	
					String reqid= rs.getString("requisition_no");
%>	
			<tr bgcolor="#c2bdf9">
			<TH>Requisition number</TH>
			<TH>forward to IT-HOD</TH>
			</tr>
			<tr>
			<TD> <%= rs.getString(10) %> </TD>			
			<TD><a href="submit.jsp?reqid=<%=reqid%>">Submit</a>
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
<html>