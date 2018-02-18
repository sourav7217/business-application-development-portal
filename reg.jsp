<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String username=request.getParameter("username"); 
String password=request.getParameter("password");
String type=request.getParameter("type1");
if(type==null  || type.equals("select_user")){
	type="";
	out.print("It should not empty");
}
if(username==null) username="";
if(password==null) password="";

String qry="";
int i=0;
if (username.equals("") || password.equals("") || type.equals("")) {
	 
    out.print("Invalid parameters ");
	i=2;
}

else{
	if("client".equals(type))
	{	
		System.out.println("user type="+type); 
		qry="select count(*) from client where userid=? and password=?";
		try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123");	
		PreparedStatement ps=con.prepareStatement(qry);
		ps.setString(1,username);
		ps.setString(2,password);
		ResultSet rs=ps.executeQuery(); 
		if(rs.next())
			i=Integer.parseInt(rs.getString(1));
			}
		catch(Exception exp){
		out.println("Error:"+exp.toString());
		}
		if(i==1){
	   	 out.println("Welcome " + username + " 	");
   		 session.setAttribute("username",username);
   		 session.setAttribute("password",password);
   		 response.sendRedirect("client.jsp");
		}
	}
	else if("dept_hod".equals(type))
	{
		System.out.println("user type="+type);
		qry="select count(*) from dept_hod where userid=? and password=?";
		try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123");	
		PreparedStatement ps=con.prepareStatement(qry);
		ps.setString(1,username);
		ps.setString(2,password);
		ResultSet rs=ps.executeQuery(); 
		if(rs.next())
			i=Integer.parseInt(rs.getString(1));
			}
		catch(Exception exp){
		out.println("Error:"+exp.toString());
		}
		if(i==1){
	   	 out.println("Welcome " + username + " 	");
   		 session.setAttribute("username",username);
   		 session.setAttribute("password",password);
   		 response.sendRedirect("dept_hod.jsp");
		}
	}
	else if("developer".equals(type))
	{		
		System.out.println("user type="+type);
		qry="select count(*) from developer where userid=? and password=?";
		try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123");	
		PreparedStatement ps=con.prepareStatement(qry);
		ps.setString(1,username);
		ps.setString(2,password);
		ResultSet rs=ps.executeQuery(); 
		if(rs.next())
			i=Integer.parseInt(rs.getString(1));
		}
		catch(Exception exp){
		out.println("Error:"+exp.toString());
		}
		if(i==1){
	   	 out.println("Welcome " + username + " 	");
   		 session.setAttribute("username",username);
   		 session.setAttribute("password",password);
   		 response.sendRedirect("developer.jsp");
		}
	}
	else if("it_hod".equals(type))
	{	
		System.out.println("user type="+type);
		if(username.equals("ithod") && password.equals("ithod123"))
			i=1;
		if(i==1){
			out.println("Welcome " + username + " 	");
			session.setAttribute(username, "ithod");
			session.setAttribute(password, "ithod123");
			response.sendRedirect("it_hod.jsp");
		}
	}
	else if("admin".equals(type))
	{	
		System.out.println("user type="+type);
		if(username.equals("admin") && password.equals("admin"))
			i=1;
		if(i==1){
			out.println("Welcome " + username + " 	");
			session.setAttribute(username, "admin");
			session.setAttribute(password, "admin");
			response.sendRedirect("admin.jsp");
		}
	}
	else i=2;
}
if(i ==0){
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123");	
PreparedStatement ps=con.prepareStatement(qry);
ps.setString(1,username);
ps.setString(2,password);
ResultSet rs=ps.executeQuery(); 
	if(rs.next()){
			i=Integer.parseInt(rs.getString(1));
	}
	
}
catch(Exception exp){
	//out.println("Error:"+exp.toString());
	//response.sendError(999, "ERROR OCCURED");
}
}
/*	if(i==1){
	   	 out.println("Welcome " + username + " 	");
   		 session.setAttribute(username, "username");
   		 session.setAttribute(password, "password");
   		 response.sendRedirect("requisitionform.html");
		}*/
	//else{
		if(i!=1){%>
		<body  background="body.jpg">
<%		out.println("<center>login fail<br>");
		out.println("<a href= \"login.jsp\">Log Back</a></center>");%>
		</body>
<%		// response.sendRedirect("error.jsp");
		}
%>