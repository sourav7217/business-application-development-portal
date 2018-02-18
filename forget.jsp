<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="body.jpg">
<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123");
        String password=(String)session.getAttribute("password");  
        String username=(String)session.getAttribute("username");
		String oldpwd=request.getParameter("username");
		String newpwd=request.getParameter("newpassword");
		String conpwd=request.getParameter("confirmpassword");
		String dept=request.getParameter("dept");
        if (newpwd.equals("") || conpwd.equals(""))
		{
        	out.println("New Password and Comfirm password , both are required.");
            getServletContext().getRequestDispatcher("/WEB-INF/jsp/teacher/TeacherChangePassword.jsp").forward(request,response);
        }
		else if (!newpwd.equals(conpwd))
		{
			out.println("Your New password and confirm password does not match.");
			getServletContext().getRequestDispatcher("/WEB-INF/jsp/teacher/TeacherChangePassword.jsp").forward(request,response);
		}
		PreparedStatement pst=con.prepareStatement("update forget set newpassword= ? where username=? and password= ? and dept= ?");
			pst.setString(1,username);
			pst.setString(2,password);
			pst.setString(3,newpwd);
			pst.setString(4,dept);
			int i= pst.executeUpdate();
			if(i>0)
			{
					out.println("Password doesnot Change..Try Again.");
                    getServletContext().getRequestDispatcher("/WEB-INF/jsp/teacher/TeacherChangePassword.jsp").forward(request,response);
            }
			else
		    {
    				out.println("Your password Change Successfully..");
                    getServletContext().getRequestDispatcher("/WEB-INF/jsp/teacher/TeacherChangePassword.jsp").forward(request,response);
            }
		}	
		catch(Exception e)
	    {
			e.printStackTrace();
		}

%>
</body>
</html>