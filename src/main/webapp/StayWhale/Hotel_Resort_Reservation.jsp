<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="vo.HotelBean"%>
<%@ page import="vo.likeVO"%>
<%@ page import="java.text.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="utf-8">
	<title>STAY WHALE || Hotel Resort Reservation</title>
	<link rel="stylesheet" type="text/css" href="css/hotel_resort_reservation.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-latest.js"></script> 
	<script src="js/hotel_resort_reservation.js"></script>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = (String)session.getAttribute("id");
		ArrayList<HotelBean> selecHotel = (ArrayList<HotelBean>)request.getAttribute("selecHotel");
		likeVO likevo = (likeVO)request.getAttribute("result");
		pageContext.setAttribute("likeSelec",likevo.getLike_check());
		String str = "";
		for(int i=0; i<selecHotel.size(); i++) {
			str += selecHotel.get(i).getRoom_picture() + ",";
		}
		String[] imageList = str.split(",");
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
		<section>
			<div class="top_info_wrap">
				<div class="top_info_left">
					  <div class="slider-for">
					  <%
					  	for(int i=0; i<imageList.length; i++) {
					  		out.println("<div class='item'><img src='image/" + imageList[i] + "'></div>");
					  	}
					  %>
					  </div>
					  <div class="sub_image_wrap">
						  <span class="prevArrow"><img src="image/arrow_left.png"></span>
							  <div class="slider-nav">
								<%
								 	for(int i=0; i<imageList.length; i++) {
								 		out.println("<div class='item'><img src='image/" + imageList[i] + "'></div>");
									}
								%>
							  </div>
						  <span class="nextArrow"><img src="image/arrow_right.png"></span>
					  </div>
				</div>
				<div class="top_info_right">
					<nav>
						<ul class="hotelContext">
							<div class="contextTop">
								<%
									out.println("<li class='sub_conten1'>" + selecHotel.get(0).getHotel_grade() + "</li>");
									out.println("<li class='sub_conten2'>" + selecHotel.get(0).getAcc_name() + "</li>");
									out.println("<li class='sub_conten3'>" + selecHotel.get(0).getRating() + "</li>");									
								 %>
							</div>
							<div>
								<%
									out.println("<li class='sub_conten4'>" + selecHotel.get(0).getLocation() + "</li>");
								%>
							</div>
						</ul>
					</nav>
						<%
							out.println("<div class='sub_contenWrap'>");
								out.println("<div><span>간단 Comment</span><span class='toc-toggle' id='toc-toggle' onclick='openCloseToc()'>펼치기</span></div>");
								out.println("<div class='toc-content' id='toc-content'>"+selecHotel.get(0).getComment()+"</div>");
							out.println("</div>");
						%>
						<div id="event_wrap" class="event_wrap">
							<h3>★ 진행중인 이벤트 ★ </h3>
							<p>* 진행중인 이벤트 1</p>
							<p>* 진행중인 이벤트 2</p>
							<p>* 진행중인 이벤트 3</p>
							<p>* 진행중인 이벤트 4</p>
							<p>* 진행중인 이벤트 5</p>
						</div>
						<div class="like_wrap">
							<c:choose>  
								<c:when test="${likeSelec==0}">
									<div class="likeCheck" onclick="like('<%=id%>', '<%=selecHotel.get(0).getReg_num_h()%>'); return false;"><img class="likeicon" src="image/unlike_icon.png"></div>
									<div class="like_text">찜하기</div>
								</c:when> 
								<c:otherwise>
									<div class="likeCheck" onclick="unLike('<%=id%>', '<%=selecHotel.get(0).getReg_num_h()%>'); return false;"><img class="likeicon" src="image/like_icon.png"></div>
									<div class="like_text">찜 해제하기</div>
								</c:otherwise>
							</c:choose>
							
						</div>
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
				<div class="center_info_calen">
					<div class="center_info_cal">
						<div><b>날짜</div>
							<form>
								  <select name="날짜 / 달력" >
								    <option value="none">날짜 선택</option>
								  </select>
							</form>
						</div>
					</div>
				</div>
				<div class="bot_info_wrap">
					<div class="bot_info_box">
						<ul>
							<li class="bot_photo">사진</li>
							<li class="bot_name">방 이름</li>
							<li class="bot_price">가격</li>
							<li class="bot_won">330,000</li>
							<li class="bot_roominfo">객실 상세 정보 확인</li>
							<li class="bot_roominfobt">정보확인</li>
							<li class="bot_resev">예약</li>
						</ul>
					</div>
				</div>
		</section>
	<jsp:include page="footer.jsp"/>
</body>

<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> 
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
</html>