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
	<center><Strong><h2>Thanks to approve this request</h2></strong></center><br><br>
	<%		String req_no= request.getParameter("reqid");
		    try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry2 = "update deploy set status='submit_to_admin' where req_no='"+req_no+"'";
			//out.println("::"+qry2);
			Statement st2=con2.createStatement();
			st2.executeUpdate(qry2);
			}
			catch(Exception e)
			{
				out.println(e);
			}
%>
<center><Strong><h4><a href="login.jsp">Back To Home Page</a></h4></strong></center><br><br>
</body>
</html>