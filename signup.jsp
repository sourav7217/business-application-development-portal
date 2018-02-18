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
<title>Signup</title>
</head>
<body>
<%
String fname=request.getParameter("fname"); 
String mname=request.getParameter("mname"); 
String lname=request.getParameter("lname"); 
String username=request.getParameter("username"); 
String dept=request.getParameter("dept"); 
String email=request.getParameter("email");
String cont=request.getParameter("cont"); 
String pwd=request.getParameter("pwd"); 
String repwd=request.getParameter("repwd"); 
Class.forName("com.mysql.jdbc.Driver"); 
Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
PreparedStatement pst=con.prepareStatement("insert into signup (firstname,middle,lastname,userid,department,email,contact,password,repassword)values(?,?,?,?,?,?,?,?,?)");
pst.setString(1,fname);
pst.setString(2,mname);
pst.setString(3,lname);
pst.setString(4,username);
pst.setString(5,dept);
pst.setString(6,email);
pst.setString(7,cont);
pst.setString(8,pwd);
pst.setString(9,repwd);
pst.executeUpdate();
%>
    <% 
    if (pwd!=null && repwd!=null) {	 
      if (!pwd.equals(repwd)) { 
    	  response.sendRedirect("error1.jsp");
      } else {
    %>
         <jsp:forward page="index.jsp" />
    <%
      }
    } 
    %>
<a href ="index.jsp">Login</a><br/><br/>
<a href="home.jsp">Home</a>
</body>
</html>