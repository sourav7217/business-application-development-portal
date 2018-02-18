<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>File Save</title>
</head>
<body background="body.jpg">
<%
String b_req=request.getParameter("brief_requirements"); 
String d_req=request.getParameter("detailed_requirement"); 
String f_aff=request.getParameter("functions_affected"); 
String name=request.getParameter("name"); 
String designation=request.getParameter("design"); 
String depertment=request.getParameter("dept");
String staff_no=request.getParameter("staffno"); 
String file_name=request.getParameter("filename"); 
Class.forName("com.mysql.jdbc.Driver"); 
Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
PreparedStatement pst=con.prepareStatement("insert into requisition (b_req,d_req,f_aff,name,designation,depertment,staff_no,file_name)values(?,?,?,?,?,?,?,?)");
pst.setString(1,b_req);
pst.setString(2,d_req);
pst.setString(3,f_aff);
pst.setString(4,name);
pst.setString(5,designation);
pst.setString(6,depertment);
pst.setString(7,staff_no);
pst.setString(8,file_name);
pst.executeUpdate();
%>
</body>
</html>