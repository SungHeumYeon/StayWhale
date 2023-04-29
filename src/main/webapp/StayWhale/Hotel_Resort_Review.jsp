<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8");%>
<html>
<head>
	<meta charset="utf-8">
	<title>STAY WHALE || Hotel_Resort_Review</title>
	<link rel="stylesheet" type="text/css" href="css/hotel_resort_review.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="js/hotel_resort_review.js"></script>
	
	
	
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = (String)session.getAttribute("id");
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
	<div class="section_wrap"></div>
		<section>
			<div class="top_info_wrap">
				<div class="top_info_left">
					<nav>
						<ul>
							<li class="main_photo">사진1</li>
							<div class="sub_photo_list">
								<li class="sub_photo">사진2</li>
								<li class="sub_photo">사진3</li>
								<li class="sub_photo">사진4</li>
								<li class="sub_photo">사진5</li>
							</div>
						</ul>
					</nav>
				</div>
				<div class="top_info_right">
					<nav>
						<ul>
							<li class="sub_conten1">5성급</li>
							<li class="sub_conten2">호텔명</li>
							<li class="sub_conten3">찜</li>
							<br>
							<li class="sub_conten4">평점</li>
							<br>
							<li class="sub_conten5">주소</li>
							<br>
						</ul>
						<textarea class="sub_conten6">호텔 소개</textarea>
					</nav>
				</div>
			</div>
			<div class="center_info_wrap">
				<div class="center_btlist">
					<nav>
						<ul>
							<a href="Hotel_Resort_Reservation.html"><li>객실안내</li></a>
							<a href="Hotel_Resort_Reservation2.html"><li>숙소정보</li></a>
							<a href="Hotel_Resort_Review.html"><li>Review</li></a>
						</ul>
					</nav>
				</div>
				<div class="review_wrap">
					<ul>
						<li class="review_1">별 아이콘</li>						
						<li class="review_2">평점</li>
						<li class="review_3">전체리뷰</li>
						<li class="review_4">이용객 추천 수</li>
					</ul>
				</div>
			</div>
		</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>