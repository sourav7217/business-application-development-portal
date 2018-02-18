<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<HTML>
    <HEAD>
        <TITLE>Reject</TITLE>
    </HEAD>

    <body background="body.jpg">
        <center><H2>Successfully rejected!</H2></center>
        <BR>
        <BR>

<%		    String username = session.getAttribute("username").toString();
			String reqid1 = request.getParameter("reqid1");
			String comment=request.getParameter("comments");
			try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "update requisition set status='reject' where requisition_no='"+reqid1+"'";
			Statement st=con.createStatement();
			st.executeUpdate(qry);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "select * from requisition where status='reject' and requisition_no='"+reqid1+"'";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(qry);
			while(rs.next())	{	

%>			
			<!--tr bgcolor="#c2bdf9">
			<TH>Requisition number</TH></tr>
			<tr><TD> <!%= rs.getString(10) %> </TD>
			</tr-->
			
<%			}
			}
			catch(Exception e)
			{
				out.println(e);
			}
%>
</table>	
<%			Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			PreparedStatement pst=con1.prepareStatement("insert into requisition (comment) values(?)");
			pst.setString(1,comment);
			pst.executeUpdate();
%>
			<center><Strong>Rejected list</strong></center>
			<table align="center" cellpadding="5" cellspacing="5" border="1">    
			<style>
			table {
				border-collapse: collapse;
				width: 40%;
				}

			th, td {
				text-align: left;
				padding: 8px;
				}
			tr:nth-child(even){background-color: #f2f2f2}
			</style>
			
<%			try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "select *  from requisition where status='reject' and department=(select department from dept_hod where userid='"+username+"')";
			//out.println("::"+qry);
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(qry);
			while(rs.next())	
			{
%>			
			<tr bgcolor="#c2bdf9">
			<th>Requisition number</th>
			</tr>
			<tr>
			<td> <%= rs.getString(10) %> </td>
			</tr>
			
<%			}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
%>
</table>
<br><br><center><br><br><a href="developer.jsp">Back to home page</a></center>
</body>
</html>