<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<HTML>
    <HEAD>
        <TITLE>Approval</TITLE>
    </HEAD>

    <body background="body.jpg">
        <center><H3>Thanks to SRS !</H3></center>
        <BR>
        <BR>
<%			
			String reqid = request.getParameter("srs");
			//out.println("::"+reqid);
			String username = request.getParameter("username");
			//out.println("::"+username);
			/*Class.forName("com.mysql.jdbc.Driver"); 
			Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry1 = "select status from srs where req_no='"+reqid+"'";
			//out.println("::"+qry1);
			Statement st1=con1.createStatement();
			ResultSet rs1=st1.executeQuery(qry1);
			rs1.next();
			String status1=rs1.getString("status");
			if(status1!="dev_srs_submit"){*/
			try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry2 = "update srs set status='approve' where req_no='"+reqid+"'";
			//out.println("::"+qry2);
			Statement st2=con2.createStatement();
			st2.executeUpdate(qry2);
			}
			catch(Exception e)
			{
				out.println(e);
			}
			
%>
<center><Strong>List of approved requisition form</strong></center><br><br>
<%			
			try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con3 = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			String qry3 = "select * from srs where status='approve' and devid='"+username+"'";
			//out.println("::"+qry3);
			Statement st3=con3.createStatement();
			ResultSet rs=st3.executeQuery(qry3);
			while(rs.next())	
			{	
					String req_no= rs.getString("req_no");
%>			
				
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
			<TH>srsurity Test Number</TH>
			<TH>forward to Developer</TH>
			</tr>
			<tr>
			<TD> <%= rs.getString("srs_name") %> </TD>			
			<TD><a href="it_srs_submit.jsp?reqid=<%=req_no%>">Submit</a>
			</td>
			</tr>
			</table>
			<form>
<%			}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
%>
</body>
</html>