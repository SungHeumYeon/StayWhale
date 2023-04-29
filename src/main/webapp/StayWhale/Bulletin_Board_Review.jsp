<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DTO.Writer"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/review_page.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="js/review_page.js"></script>

<meta charset="UTF-8">
<title>StayWhale | Review</title>
</head>
<body>
	<jsp:useBean id="data" class="DAO.DataProcess"> </jsp:useBean>
	<jsp:useBean id="obj" class="DTO.Writer"> </jsp:useBean>
	<%
		request.setCharacterEncoding("utf-8");
		String id = (String) session.getAttribute("id");
		
		String val = request.getParameter("val");
		String str = request.getParameter("str");
	%>
	<%
		if(id == null) {
	%>
		<jsp:include page="Header_Login_Fail.jsp" >
			<jsp:param name="id" value="<%= id%>"/>
		</jsp:include>
	<%
	} else {
	%>
		<jsp:include page="Header_Login_Success.jsp"/>
	<%
	}
	%>
	<section id="section_wrap">
		<div id="title_wrap">
			<div id="big_title">
				<h1 style="font-family: 'Lobster', cursive;">Review Bulletin</h1>
				<h4 id="title_under">StayWhale 회원님만의 추억을 기록해주세요</h4>
			</div>
		</div>
		<div id="content_wrap">
			<div id="content_1">
				<ul id="content_ul">
					<%
						if(val == null) {
							ArrayList<Writer> arr = data.review_check();
							for(int i=0; i<arr.size(); i++) {
								out.println("<li id='content_li'>");
								if(arr.get(i).getPost_file().equals("null")) {
									out.println("<div id='thumbnail' style='background-image: url(image/no-photo.png);'></div>");
								} else {
									out.println("<div id='thumbnail' style='background-image: url(review_image/" + arr.get(i).getPost_file() + ");'></div>");	
								}
								out.println("<div id='title'>"+ arr.get(i).getPost_title() +"</div>");
								out.println("<div id='profile_wrap'>");
								out.println("<img src='image/review_profile_icon.png'>");
								out.println("<div>");
								out.println("<div id='profile_text'><label id='user_id'>" + arr.get(i).getUser_id() + "<br></label><label id='post_date'>" + arr.get(i).getPost_date() + "</label></div>");
								out.println("</div>");
								out.println("<div><div id='travellocation'>" + arr.get(i).getPost_travel_location() + "</div>");
								if(arr.get(i).getPost_rating() == 1.0) {
									out.println("<div id='avgscore'>" + "★" + "</div></div>");
								} else if(arr.get(i).getPost_rating() == 2.0) {
									out.println("<div id='avgscore'>" + "★★" + "</div></div>");
								} else if(arr.get(i).getPost_rating() == 3.0) {
									out.println("<div id='avgscore'>" + "★★★" + "</div></div>");
								} else if(arr.get(i).getPost_rating() == 4.0) {
									out.println("<div id='avgscore'>" + "★★★★" + "</div></div>");
								} else if(arr.get(i).getPost_rating() == 5.0) {
									out.println("<div id='avgscore'>" + "★★★★★" + "</div></div>");
								}
								out.println("<input type='hidden' id='post_num' name='post_num' value='" + arr.get(i).getPost_num() + "'>");
								out.println("<input type='hidden' id='post_category' name='post_category' value='" + arr.get(i).getPost_category() + "'>");
								out.println("<input type='hidden' id='post_like' name='post_like' value='" + arr.get(i).getPost_like()+ "'>");
								out.println("<input type='hidden' id='post_readcount' name='post_readcount' value='" + arr.get(i).getPost_readcount()+ "'>");
								out.println("</li>");
							}
						} else {
							ArrayList<Writer> arr_search = data.review_search(val, str);
							for(int i=0; i<arr_search.size(); i++) {
								out.println("<li id='content_li'>");	
								if(arr_search.get(i).getPost_file().equals("null")) {
									out.println("<div id='thumbnail' style='background-image: url(image/no-photo.png);'></div>");
								} else {
									out.println("<div id='thumbnail' style='background-image: url(review_image/" + arr_search.get(i).getPost_file() + ");'></div>");	
								}
								out.println("<div id='title'>"+ arr_search.get(i).getPost_title() +"</div>");
								out.println("<div id='profile_wrap'>");
								out.println("<img src='image/review_profile_icon.png'>");
								out.println("<div>");
								out.println("<div id='profile_text'><label id='user_id'>" + arr_search.get(i).getUser_id() + "<br></label><label id='post_date'>" + arr_search.get(i).getPost_date() + "</label></div>");
								out.println("</div>");
								out.println("<div><div id='travellocation'>" + arr_search.get(i).getPost_travel_location() + "</div>");
								if(arr_search.get(i).getPost_rating() == 1.0) {
									out.println("<div id='avgscore'>" + "★" + "</div></div>");
								} else if(arr_search.get(i).getPost_rating() == 2.0) {
									out.println("<div id='avgscore'>" + "★★" + "</div></div>");
								} else if(arr_search.get(i).getPost_rating() == 3.0) {
									out.println("<div id='avgscore'>" + "★★★" + "</div></div>");
								} else if(arr_search.get(i).getPost_rating() == 4.0) {
									out.println("<div id='avgscore'>" + "★★★★" + "</div></div>");
								} else if(arr_search.get(i).getPost_rating() == 5.0) {
									out.println("<div id='avgscore'>" + "★★★★★" + "</div></div>");
								}
								out.println("<input type='hidden' id='post_num' name='post_num' value='" + arr_search.get(i).getPost_num() + "'>");
								out.println("<input type='hidden' id='post_category' name='post_category' value='" + arr_search.get(i).getPost_category() + "'>");
								out.println("<input type='hidden' id='post_like' name='post_like' value='" + arr_search.get(i).getPost_like()+ "'>");
								out.println("<input type='hidden' id='post_readcount' name='post_readcount' value='" + arr_search.get(i).getPost_readcount()+ "'>");
								out.println("</li>");
							}
						}
					%>
				</ul>
			</div>
		</div>
			<div id="search_wrap">
				<div id="next_wrap">
					<div id="next_page"><image src="image/left_icon.png"> 1 2 3 4 5 <image src="image/right_icon.png"></div>
				</div>
				<div id="che_wrap">
					<div id="search_div">
						<select id="search_selec">
							<option>제목</option>
							<option>숙소명</option>
							<option>작성자</option>
						</select>
						<input id="search_box" type="text" placeholder="검 색">
						<img id="review_search_icon" src="image/review_search_icon.png">
					</div>
				</div>
				<div id="wri_bt">
					<button type="button" class="custom-btn btn-5" onclick="location.href='Review_text.jsp'">Review 작성</button>
				</div>
			</div>
	</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>