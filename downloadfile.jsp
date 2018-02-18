<%@page import="java.io.FileInputStream"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="body.jpg">
<%
		String filename = "03-ER-008.pdf";
		String filepath = "D:\\VIDEOS\\";
		response.setContentType("APPLICATION/OCTET-STREAM");
		response.setHeader("Content-Disposition", "attachment; filename=\""+ filename + "\"");
		// use inline if you want to view the content in browser, helpful for pdf file
		// response.setHeader("Content-Disposition","inline; filename=\"" +filename + "\"");
		FileInputStream fileInputStream = new FileInputStream(filepath+ filename);
		int i;
		while ((i = fileInputStream.read()) != -1) {
			out.write(i);
		}
		  fileInputStream.close();   
%>
</body>
</html>