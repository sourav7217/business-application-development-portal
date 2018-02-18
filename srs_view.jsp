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
			   <TH>System Description:</TH>
               <TH>Requirement ID and Requirement (Functions, Controls, Validation etc.)</TH>
               <TH>SRS0001: </TH>
               <TH>SRS0002:</TH>
               <TH>SRS0003:</TH>
			   <TH>SRS0004:</TH>
			   <TH>use this space if necessary : </TH>
               <TH>Users of the system:</TH>
			   <TH>Data volume expected:</TH>
			   <TH>Backup requirement: </TH>
			   <TH>Retention period:</TH>
			   <TH>Security requirement:</TH>
         </TR>
<%		
			String reqid = request.getParameter("srs");
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry = "select * from srs where req_no='"+reqid+"'";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(qry);
			while(rs.next())	{	%>		
			<TR>
               <TD> <%= rs.getString(1) %> </TD>
               <TD> <%= rs.getString(2) %> </TD>
               <TD> <%= rs.getString(3) %> </TD>
               <TD> <%= rs.getString(4) %> </TD>
               <TD> <%= rs.getString(5) %> </TD>
			   <TD> <%= rs.getString(6) %> </TD>
			   <TD> <%= rs.getString(7) %> </TD>
			   <TD> <%= rs.getString(8) %> </TD>
			   <TD> <%= rs.getString(9) %> </TD>
			   <TD> <%= rs.getString(10) %> </TD>
			   <TD> <%= rs.getString(11) %> </TD>
			   <TD> <%= rs.getString(12) %> </TD>
			   <TD> <%= rs.getString(13) %> </TD>
           </TR>
		  <% 
		}

		} catch (Exception e) {
				e.printStackTrace();
			}
%>
       </TABLE>
	   <center><a href="it_view_srs.jsp">BACK</a></center>
       <BR>
    </BODY>
</HTML>
