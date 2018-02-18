<%@page import="java.io.FileInputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="body.jpg">
<%	
    String reqid1 = request.getParameter("reqid");
	//String reqid1 = session.getAttribute("reqid").toString();
	try{
		Class.forName("com.mysql.jdbc.Driver"); 
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
		String qry = "select file_name from requisition where requisition_no='"+reqid1+"'";
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery(qry);
		while(rs.next())				
		{
		String filename=rs.getString("file_name");
		String filepath = "D:\\VIDEOS\\";
		response.setContentType("APPLICATION/OCTET-STREAM");
		//response.setHeader("Content-Disposition", "attachment; filename=\""+ filename + "\"");
		// use inline if you want to view the content in browser, helpful for pdf file
	    response.setHeader("Content-Disposition","inline; filename=\"" +filename + "\"");
		FileInputStream fileInputStream = new FileInputStream(filepath+ filename);
		int i;
		while ((i = fileInputStream.read()) != -1) {
			out.write(i);
		}
		  fileInputStream.close(); 
		}	
		}
	catch(Exception e)
	{
		out.println("error");
		e.printStackTrace();
	}
%>
</body>
</html>