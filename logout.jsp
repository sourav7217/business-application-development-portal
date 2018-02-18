<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Log out</title>
</head>
<body background="body.jpg">
<%
 
    String nam=(String)session.getAttribute("username");
    if(nam!=null)
        {
           out.println(nam+" loged out,<br><br><center> <a href=\"login.jsp\">Back</a></center>");
           session.removeAttribute("username");
           session.removeAttribute("password");
             
        }
     else
         {
         out.println("<br><br><center>You are already not login <a href=\"login.jsp\">Back</a></center>");
     }
 
 
 
%>
</body>
</html>