<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8");%>
<html>
<head>
	<meta charset="utf-8">
	<title>STAY WHALE || Hotel_Resort_Reservation2</title>
	<link rel="stylesheet" type="text/css" href="css/hotel_resort_reservation2.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="js/hotel_resort_reservation2.js"></script>
	
	
	
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
					<div id="info_text"><b>기본정보</div>
						<div class="center_info_loca">위치정보</div>
						<div class="center_info_loca2">상세주소</div>
						<div id="info_text">공지사항</div>
						<div class="info_listtext1">공지사항 내용</div>
						<div id="info_text">부대시설</div>
						<div class="info_listtext2">부대시설 내용</div>
						<div id="info_text">조식정보</div>
						<div class="info_listtext3">조식정보 내용</div>
						<div id="info_text">취소 및 환불 규정</div>
						<div class="info_listtext4">취소 및 환불 규정 내용</div>

					<div id="info_text">편의시설 및 서비스</div>
					<div class="papago_wrap">
						<nav>
							<ul>
								<li>아이콘1</li>
								<li>아이콘2</li>
								<li>아이콘3</li>
								<li>아이콘4</li>
								<li>아이콘5</li>
								<li>아이콘6</li>
								<li>아이콘7</li>
								<li>아이콘8</li>
								<li>아이콘9</li>
								<li>아이콘10</li>
								<li>아이콘11</li>
								<li>아이콘12</li>
								<li>아이콘13</li>
								<li>아이콘14</li>
								<li>아이콘15</li>
								<li>아이콘16</li>
								<li>아이콘17</li>
								<li>아이콘18</li>
							</ul>
						</nav>
					</div>
					<div id="info_text">판매자 정보</div>
					<div class="info_listtext1">판매자 정보 내용</div>
			</div>
		</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>