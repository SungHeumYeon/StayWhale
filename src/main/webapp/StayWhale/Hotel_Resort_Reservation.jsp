<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="vo.HotelBean"%>
<%@ page import="vo.HotelRoomBean"%>
<%@ page import="java.text.*" %>
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
		String cin = request.getParameter("cin");
		String cout = request.getParameter("cout");
		likeVO likevo = (likeVO)request.getAttribute("result");
		pageContext.setAttribute("likeSelec",likevo.getLike_check());
		DecimalFormat df = new DecimalFormat("###,###");
		
		String txt = "";
		for(int i=0; i<selecHotel.size(); i++) {
			txt += selecHotel.get(i).getRoom_picture() + ",/";
		}
		String[] roomList = txt.split(",/");
		
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
				<div class="top_info_right" id="top_info_right">
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
							<h3>★ 진행중인 Event ★ </h3>
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
							<button class="on"><span>객실안내</span></button>
							<button class="on"><span>숙소정보</span></button>
							<button class="on"><span>Review</span></button>
						</ul>
					</nav>
				</div>
				<div class="center_calen_wrap">
					<div class="center_cal">
					<input type="hidden" id="cin" name="cin" value="<%= cin%>">
					<input type="hidden" id="cout" name="cout" value="<%= cout%>">
					<input type="hidden" id="hnum" name="hnum" value="<%= selecHotel.get(0).getReg_num_h()%>">
						<%
							if(cin == null || cin.equals("null") || cout == null || cout.equals("null")) {
								out.println("<input type='text' name='date_selec' readonly id='day_Selec'>");
							} else {
								out.println("<input type='text' name='date_selec' readonly id='day_Selec' value='"+cin+" ~ "+cout+"'>");
							}
						%>
						
					</div>
				</div>
			</div>
				<div class="ajax">
				<%	
					for(int i=0; i<selecHotel.size(); i++) {
						out.println("<div class='bot_info_wrap'>");
				 		out.println("<div class='bot_info_box'>");
				 		out.println("<ul>");
				 		for (int y=0; y<roomList.length; y++) {
						    String[] roomValues = roomList[i].split(",");
						    for(int x=0; x<roomValues.length; x++) {
						    	out.println("<li class='bot_photo' style='background-image: url(image/"+roomValues[x]+")'></li>");
						    }
						    break;
						}
				 		out.println("<li class='bot_name'>"+selecHotel.get(i).getRoom_name()+"</li>");
				 		out.println("<li class='bot_price'>가격</li>");
				 		out.println("<li class='bot_won'>"+df.format(selecHotel.get(i).getRoom_price())+"원</li>");
				 		out.println("<li class='bot_roominfo'>객실 상세 정보 확인</li>");
				 		out.println("<li class='bot_roominfobt'>></li>");
				 		out.println("<li class='bot_resev'>예약하기</li>");
				 		out.println("</ul>");
				 		out.println("</div>"); 
				 		out.println("</div>");
					} 		
				%>
				</div>
				<div class="hotel_info_wrap">
					<button><span>기본정보</span></button>
					<div>
						<%
							out.println(selecHotel.get(0).getDetail());
						%>
					</div>
					<button><span>편의시설 및 서비스</span></button>
					<button><span>판매자정보</span></button>
				</div>
		</section>
	<jsp:include page="footer.jsp"/>
</body>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="daterangepicker-master/daterangepicker.js"></script>
<link rel="stylesheet" type="text/css" href="daterangepicker-master/daterangepicker.css"/>
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> 
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
</html>