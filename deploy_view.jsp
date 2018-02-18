<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
<link rel="stylesheet" type="text/css" href="IT_HOD.css">
<script type="text/javascript">
</script>
<body  background="body.jpg">
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
			  
<table align="center" cellpadding="5" cellspacing="5" border="1">    
			
		 <tr bgcolor="#c2bdf9">   
		 <TH>IP number</TH>
	     <TH>Server name</TH>
         </TR>
<%		
try{		String reqid = request.getParameter("reqid");
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "select * from deploy where req_no='"+reqid+"'";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(qry);
			if(rs.next())	{	%>		
			<TR>
               <TD> <%= rs.getString(1) %> </TD>
               <TD> <%= rs.getString(2) %> </TD>
           </TR>
		  <% 
		}

		} catch (Exception e) {
				e.printStackTrace();
			}
%>
</table>
</body>
</html>