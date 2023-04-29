<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.awt.Graphics2D" %>
<%@ page import="java.awt.image.renderable.ParameterBlock" %>
<%@ page import="java.awt.image.BufferedImage" %>
<%@ page import="javax.media.jai.JAI" %>
<%@ page import="javax.media.jai.RenderedOp" %>
<%@ page import="javax.imageio.ImageIO" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="data" class="DAO.DataProcess"> </jsp:useBean>
	<jsp:useBean id="obj" class="DTO.Writer"> </jsp:useBean>
	<%
		String uploadPath=request.getRealPath("StayWhale/review_image");
		int size = 10*1024*1024; // 첨부 파일의 용량(10메가)
		String filename1="";
		String origfilename1="";
	
	try{
		MultipartRequest multi=new MultipartRequest(request,
							uploadPath,
							size, 
							"UTF-8",
				new DefaultFileRenamePolicy());
		
		Enumeration files=multi.getFileNames();
		
		String file1 =(String)files.nextElement();
		filename1=multi.getFilesystemName(file1);
		origfilename1= multi.getOriginalFileName(file1);

		obj.setUser_id(multi.getParameter("id"));
		obj.setPost_title(multi.getParameter("title"));
		obj.setPost_body(multi.getParameter("txt").replace("\r\n","<br>"));
		obj.setPost_file(filename1);
		obj.setPost_like(0);
		obj.setPost_travel_location(multi.getParameter("travellocation"));
		obj.setPost_rating(Double.parseDouble(multi.getParameter("reviewStar")));
		
		}catch(Exception e){
			e.printStackTrace();
		}
		
		data.review_insert(obj);
		response.sendRedirect("../Bulletin_Board_Review.jsp");
	%>
</body>
</html>