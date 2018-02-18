<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>	
<body background="body.jpg">
			<style>
			table {
				border-collapse: collapse;
				width: 100%;
				}

			th, td {
				text-align: left;
				padding: 8px;
				}

			tr:nth-child(even){background-color: #f2f2f2}
            </style>
				<table align="center" cellpadding="5" cellspacing="5" border="1">   
				<tr bgcolor="#c2bdf9">
			   <TH>Requisition number:</TH>
			   <TH>Date of tested:</TH>
               <TH>Tester</TH>
               <TH>Severity of Defect: </TH>
               <TH>Summary of Defect: </TH>
               <TH>Closed prior to production:</TH>
			   <TH>Comment</TH>
			  
         </TR>
<%			String username = request.getParameter("username");
			String reqid = request.getParameter("srs");
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "select * from test_record where req_no='"+reqid+"' and devid='"+username+"'";
			//out.println(""+qry);
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(qry);
			while(rs.next())	{	%>		
			<TR>
               <TD> <%= rs.getString(1) %> </TD>
               <TD> <%= rs.getString(12) %> </TD>
               <TD> <%= rs.getString(3) %> </TD>
               <TD> <%= rs.getString(4) %> </TD>
               <TD> <%= rs.getString(5) %> </TD>
			   <TD> <%= rs.getString(9) %> </TD>
			   <TD> <%= rs.getString(7) %> </TD>

           </TR>
		  <% 
		}

		} catch (Exception e) {
				e.printStackTrace();
			}
%>
       </TABLE>
	   
    </BODY>
</HTML>
