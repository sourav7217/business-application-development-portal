<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
<link rel="stylesheet" type="text/css" href="IT_HOD.css">
<script type="text/javascript" >  
function showcommentform() {  

document.getElementById('mylocation').innerHTML=deply.jsp; 
}  
</script>
<body background="body.jpg">

<center><h3>Deployment List</h3></center>
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
			
<%		String devid=request.getParameter("select1");
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "select * from deploy where devid='"+devid+"'";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(qry);
			while(rs.next())				
			{	String path=rs.getString("deploy_name");	
				String req_no=rs.getString("req_no");
%>				
			<tr bgcolor="#c2bdf9">
			<th>Deployment File Name</th>
			<th>View Details</th>
			</tr>
			<tr>
			<td><%=path%></a></td>
			<td>
				<form action="deploy_view.jsp" method="post">
				<input type="hidden" name="reqid" value="<%=req_no%>">
				<%session.setAttribute("username",devid);%>
				<input type="submit" value="View"onclick="showcommentform()">
				<div id="mylocation"></div>  
				</form>
			<!--a href="deploy_view.jsp?reqid=<!%=req_no%>">View Details</a-->
			</td>
			</tr>
			<%	
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
%>
</table>
<center><br><br><a href="login.jsp">Back to home page</a></center>
</html>
</body>