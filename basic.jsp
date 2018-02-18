<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="org.apache.commons.fileupload.servlet.*"%>
<%@page import="org.apache.commons.fileupload.disk.*"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<HTML>
    <HEAD>
        <TITLE><center>Thanks for Adding to the Guest BoDesignation :ok!</center></TITLE>
    </HEAD>

    <body background="body.jpg">
        <center><H3>Thanks to fillup requisition form !</H3></center>
        <center>Here's what you and others have said:</center>
        <BR>
        <BR>
        <%


		int i=1;
		Class.forName("com.mysql.jdbc.Driver"); 
		Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
		String qry1 = "select MAX(SL) from requisition";
		PreparedStatement st1=con1.prepareStatement(qry1);
		ResultSet rs=st1.executeQuery();
		if(rs.next()){
		i = Integer.parseInt(rs.getString(1));
		i++;
		}
		String reqid = "req"+i;

	        String b_req = request.getParameter("brief_requirements");
            String d_req = request.getParameter("detailed_requirement");
			String f_aff = request.getParameter("functions_affected");
            String name = request.getParameter("name");
			String designation = request.getParameter("design");
            String department = request.getParameter("dept");
			String staff_no= request.getParameter("staffno");
            
             out.println("<center><B>Brief Requirement:: </B>" + b_req + "<BR></center>");
             out.println("<center><B>Detailed Requirement: (Use annexure): </B>" + d_req + "<BR></center>");
			 out.println("<center><B>Functions Affected:: </B>" + f_aff + "<BR></center>");
			 out.println("<center><B>Name :: </B>" + name + "<BR></center>");
			 out.println("<center><B>Designation :: </B>" + designation + "<BR></center>");
			 out.println("<center><B>Department :: </B>" + department + "<BR></center>");
			 out.println("<center><B>Staff Number : </B>" + staff_no + "<BR></center>");
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root123"); 
			PreparedStatement pst=con.prepareStatement("insert into requisition (requisition_no,b_req,d_req,f_aff,name,designation,department,staff_no)values(?,?,?,?,?,?,?,?)");
			pst.setString(1,reqid);
			pst.setString(2,b_req);
			pst.setString(3,d_req);
			pst.setString(4,f_aff);
			pst.setString(5,name);
			pst.setString(6,designation);
			pst.setString(7,department);
			pst.setString(8,staff_no);
			pst.executeUpdate();
			
%>
<!--%
int factSize=1024*1024*1024;
int fileSize=1024*1024*1024;
	try
	{	DiskFileItemFactory df=new DiskFileItemFactory();
		df.setSizeThreshold(factSize);
		out.println("sourav");
		df.setRepository(new File("D:\\TEST"));
		out.println("sourav1");
		ServletFileUpload upload=new ServletFileUpload(df);
		out.println("sourav2");
		upload.setSizeMax(fileSize);
		out.println("sourav3");
		List fItem=upload.parseRequest(request);
		out.println("sourav4");
		Iterator i=fItem.iterator();
		out.println("sourav5");
		while(i.hasNext())
		{
			FileItem fi=(FileItem)i.next();
			out.println("sourav6");
			String nam=fi.getName();
			out.println("sourav7");
			File f=new File("D:/VIDEOS/",nam);
			out.println("sourav8");
			fi.getSize();
			out.println("sourav9");
			fi.write(f);
			out.println("Successful:)");
		}
	}
	catch(Exception e)
	{
		out.println("error");
		e.printStackTrace();
	}

%-->	<br><br><center>Select a file to upload: <br />
		<form action = "upload.jsp" method = "post" enctype = "multipart/form-data">
		<input type="hidden" name="reqid" value="<%=reqid%>">
		<%

		session.setAttribute("reqid", reqid);

		%>
		<input type = "file" name = "file1" size="30"/>
         <br />
         <input type = "submit" value = "Upload File" />
		 </form>
		 </center>
		<br><center><a href="logout.jsp">Log Out</a></center>
		
    </BODY>
</HTML>