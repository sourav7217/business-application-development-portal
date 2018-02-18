<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<title>IT-HOD</title>
<body link="green">
<%			String reqid = request.getParameter("reqid");
			try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "select * from requisition where requisition_no='"+reqid+"'";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(qry);
			while(rs.next())	
			{	String path=rs.getString("file_name");
				int j = Integer.parseInt(rs.getString("SL"));
%>
				<center>
				<br><br><input type="radio" name="radio" value="<%j=j+1;%>">
				<a href="downloadfile1.jsp?reqid=<%=reqid%>"><%=path%></a>
				<!--a href="downloadfile1.jsp"><%=path%></a-->
				<a href="view.jsp?reqid=<%=reqid%>">View Details</a>
				<!--a href="view.jsp">View Details</a-->
		
			<table align="center" cellpadding="5" cellspacing="5" border="1">    
			<tr bgcolor="#c2bdf9">
			<TH>Submited Forms</TH>
			<TH>Allocate Developer</TH></tr>
			<tr>
			<TD> <%= rs.getString(1) %> </TD>
			<TD><a href="it_hod.jsp">send</a></td>
			</tr>
			</table>
<%			}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
%>
<%
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "update requisition set status='submit' where requisition_no='"+reqid+"'";
			Statement st=con.createStatement();
			st.executeUpdate(qry);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
%>
</body>
</html>
