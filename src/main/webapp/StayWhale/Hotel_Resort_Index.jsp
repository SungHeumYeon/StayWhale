<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%@ page import="vo.HotelBean"%>
<%@ page import="java.text.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>STAY WHALE || Hotel Resort</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = (String)session.getAttribute("id");
		ArrayList <HotelBean> hotelList = (ArrayList<HotelBean>)request.getAttribute("hotelList");
		ArrayList <HotelBean> hotelSearchList = (ArrayList<HotelBean>)request.getAttribute("hotelSearchList");
		if(hotelSearchList != null) {
			hotelList = hotelSearchList;
		}
		DecimalFormat df = new DecimalFormat("###,###");
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
		<div class="section_wrap">
			<div class="side_wrap">
				<aside>
					<form action="hotelSearch.xr" method="post" name="hotelListForm" onsubmit="return search_check();">
					<div class="select_Wrap">
						<div>호텔 / 리조트</div>
						<div id="addr_selec">
							<select name="sido1" value = "시/도" id="sido1"></select>
							<select name="gugun1" value = "구/군" id="gugun1"></select>
						</div>
					</div>
					<div>
						<div style="margin-top: 20px;"><b>날짜</b></div>
						<div id="date_wrap">
							<input type="text" name="date_selec" readonly placeholder="날짜 선택" id="day_Selec">
							<input type="hidden" id="checkin">
							<input type="hidden" id="checkout">
						</div>
					</div>
					<div style="margin-top: 10px;"><b>상세조건</b></div>
						<div id="bt_wrap" style="margin-top: 10px;">
							<div class="bt1">
							  <button type="button" class="custom-btn btn-5" id="reset_Bt"><span>초기화</span></button>
							  <button type="submit" class="custom-btn btn-5"><span>적 용</span></button>
							</div>
						</div>
						
					<div>
						<div id="check_top_wrap">
							<ul>
						      <li><input type="checkbox" value="예약가능" id="check1" name="check1"><label for="check1"> 예약가능</label></li>
						      <li><input type="checkbox" value="프로모션" id="check2" name="check2"><label for="check2"> 프로모션</label></li>
					     	</ul>
					    </div>
				    </div>
				    <div>
					    <div>호텔 & 리조트 유형</div>
					    	<div id="grade_selec_wrap">
						    	<ul>
							      <li><input type="checkbox" value="5성급" id="check3" name="check3"><label for="check3"> 5성급</label></li>
							      <li><input type="checkbox" value="4성급" id="check4" name="check4"><label for="check4"> 4성급</label></li>
							      <li><input type="checkbox" value="특1급" id="check5" name="check5"><label for="check5"> 특1급</label></li>
							      <li><input type="checkbox" value="특급" id="check6" name="check6"><label for="check6"> 특급</label></li>
							    </ul>
						    </div>
				    </div>
					
				    <div style="margin-bottom: 10px;">가격<span style="font-size: 5px; color: gray;">(만원)</span></div>
				    <div id="price_Wrap">
					    <div class="range-slider">
						    <input type="text" class="js-range-slider">
						</div>
						<div class="extra-controls">
						    <input type="text" readonly class="js-input-from" id="price_left" name="price_left">
						    <input type="text" readonly class="js-input-to" id="price_right" name="price_right">
						</div>
					</div>
					<div style="margin-top: 25px">
						인원<span style="font-size: 5px; color: gray;">(최대 8명)</span>
						<div id="people_Wrap">
							<button type="button" id="dw"><img src="image/minus_Bt.png"></button>
							<span id="people_cnt" style="font-size: 22px">2</span>
							<input type="hidden" id="people_set" name="people_set" value="2">
							<button type="button" id="up"><img src="image/plus_BT.png"></button>
						</div>
					</div>
					<div style="margin-top: 20px">배드 타입</div>
					<div class="icon_Wrap">
						<div class="list_Wrap">
							<ul>
								<li><img src="image/single_Bed.png"><div id="single_Bed">싱글</div></li>
								<input type="hidden" id="single_Bed_value" name="single_Bed_value">
								<li><img src="image/double_Bed.png"><div id="double_Bed">더블</div></li>
								<input type="hidden" id="double_Bed_value" name="double_Bed_value">
								<li><img src="image/twin_Bed.png"><div id="twin_Bed">트윈</div></li>
								<input type="hidden" id="twin_Bed_value" name="twin_Bed_value">
								<li><img src="image/ondol_Bed.png"><div id="ondol_Bed">온돌</div></li>
								<input type="hidden" id="ondol_Bed_value" name="ondol_Bed_value">
							</ul>
						</div>
					</div>
					<div>공용 시설</div>
						<div class="check_box_wrap">
						<input type="hidden" name="detailHidden" id="detailHidden" value="">
							<ul style="margin-bottom: 10px">
						      <li><input type="checkbox" name="detail_check" value="피트니스" id="check7"><label for="check7"> 피트니스</label></li>
						      <li><input type="checkbox" name="detail_check" value="수영장" id="check8"><label for="check8"> 수영장</label></li>
						      <li><input type="checkbox" name="detail_check" value="사우나" id="check9"><label for="check9"> 사우나</label></li>
						      <li><input type="checkbox" name="detail_check" value="골프장" id="check10"><label for="check10"> 골프장</label></li>
						      <li><input type="checkbox" name="detail_check" value="레스토랑" id="check11"><label for="check11"> 레스토랑</label></li>
						      <li><input type="checkbox" name="detail_check" value="엘레베이터" id="check12"><label for="check12"> 엘레베이터</label></li>
						      <li><input type="checkbox" name="detail_check" value="라운지" id="check13"><label for="check13"> 라운지</label></li>
						      <li><input type="checkbox" name="detail_check" value="공용PC" id="check14"><label for="check14"> 공용PC</label></li>
						      <li><input type="checkbox" name="detail_check" value="BBQ" id="check15"><label for="check15"> BBQ</label></li>
						      <li><input type="checkbox" name="detail_check" value="카페" id="check16"><label for="check16"> 카페</label></li>
						      <li><input type="checkbox" name="detail_check" value="공용스파" id="check17"><label for="check17"> 공용스파</label></li>
						      <li><input type="checkbox" name="detail_check" value="족구장" id="check18"><label for="check18"> 족구장</label></li>
						      <li><input type="checkbox" name="detail_check" value="세미나실" id="check19"><label for="check19"> 세미나실</label></li>
						      <li><input type="checkbox" name="detail_check" value="편의점" id="check20"><label for="check20"> 편의점</label></li>
						      <li><input type="checkbox" name="detail_check" value="노래방" id="check21"><label for="check21"> 노래방</label></li>
						      <li><input type="checkbox" name="detail_check" value="주방식당" id="check22"><label for="check22"> 주방/식당</label></li>
						      <li><input type="checkbox" name="detail_check" value="세탁기" id="check23"><label for="check23"> 세탁기</label></li>
						      <li><input type="checkbox" name="detail_check" value="건조기" id="check24"><label for="check24"> 건조기</label></li>
						      <li><input type="checkbox" name="detail_check" value="탈수기" id="check25"><label for="check25"> 탈수기</label></li>
						      <li><input type="checkbox" name="detail_check" value="주차장" id="check26"><label for="check26"> 주차장</label></li>
						      <li><input type="checkbox" name="detail_check" value="취사가능" id="check27"><label for="check27"> 취사가능</label></li>
						      <li><input type="checkbox" name="detail_check" value="공용샤워실" id="check28"><label for="check28"> 공용샤워실</label></li>
						      <li><input type="checkbox" name="detail_check" value="온천" id="check29"><label for="check29"> 온천</label></li>
						      <li><input type="checkbox" name="detail_check" value="스키장" id="check30"><label for="check30"> 스키장</label></li>
					      	</ul>
						</div>
					<div>객실내 시설</div>
						<div class="check_box_wrap">
							<ul style="margin-bottom: 10px">
							<input type="hidden" name="amenities">
						      <li><input type="checkbox" name="detail_check" value="객실스파" id="check31"><label for="check31"> 객실 스파</label></li>
						      <li><input type="checkbox" name="detail_check" value="미니바" id="check32"><label for="check32"> 미니바</label></li>
						      <li><input type="checkbox" name="detail_check" value="와이파이" id="check33"><label for="check33"> 와이파이</label></li>
						      <li><input type="checkbox" name="detail_check" value="욕실용품" id="check34"><label for="check34"> 욕실 용품</label></li>
						      <li><input type="checkbox" name="detail_check" value="TV" id="check35"><label for="check35"> TV</label></li>
						      <li><input type="checkbox" name="detail_check" value="에어컨" id="check36"><label for="check36"> 에어컨</label></li>
						      <li><input type="checkbox" name="detail_check" value="냉장고" id="check37"><label for="check37"> 냉장고</label></li>
						      <li><input type="checkbox" name="detail_check" value="객실샤워실" id="check38"><label for="check38"> 객실 샤워실</label></li>
						      <li><input type="checkbox" name="detail_check" value="욕조" id="check39"><label for="check39"> 욕조</label></li>
						      <li><input type="checkbox" name="detail_check" value="드라이기" id="check40"><label for="check40"> 드라이기</label></li>
						      <li><input type="checkbox" name="detail_check" value="다리미" id="check41"><label for="check41"> 다리미</label></li>
						      <li><input type="checkbox" name="detail_check" value="전기밥솥" id="check42"><label for="check42"> 전기밥솥</label></li>
						 	 </ul>
						</div>
					<div>기 타</div>
						<div class="check_box_wrap">
							<ul>
							<input type="hidden" name="etc">
						      <li><input type="checkbox" name="detail_check" value="반려견동반" id="check43"><label for="check43"> 반려견 동반</label></li>
						      <li><input type="checkbox" name="detail_check" value="조식포함" id="check44"><label for="check44"> 조식포함</label></li>
						      <li><input type="checkbox" name="detail_check" value="객실내흡연" id="check45"><label for="check45"> 객실내 흡연</label></li>
						      <li><input type="checkbox" name="detail_check" value="발렛파킹" id="check46"><label for="check46"> 발렛 파킹</label></li>
						      <li><input type="checkbox" name="detail_check" value="금연" id="check47"><label for="check47"> 금연</label></li>
						      <li><input type="checkbox" name="detail_check" value="객실내취사" id="check48"><label for="check48"> 객실내 취사</label></li>
						      <li><input type="checkbox" name="detail_check" value="프린터사용" id="check49"><label for="check49"> 프린터 사용</label></li>
						      <li><input type="checkbox" name="detail_check" value="짐보관가능" id="check50"><label for="check50"> 짐보관 가능</label></li>
						      <li><input type="checkbox" name="detail_check" value="개인사물함" id="check51"><label for="check51"> 개인 사물함</label></li>
						      <li><input type="checkbox" name="detail_check" value="무료주차" id="check52"><label for="check52"> 무료 주차</label></li>
						      <li><input type="checkbox" name="detail_check" value="픽업가능" id="check53"><label for="check53"> 픽업 가능</label></li>
						      <li><input type="checkbox" name="detail_check" value="캠프파이어" id="check54"><label for="check54"> 캠프 파이어</label></li>
						      <li><input type="checkbox" name="detail_check" value="카드결재" id="check55"><label for="check55"> 카드 결재</label></li>
						      <li><input type="checkbox" name="detail_check" value="장애인편의시설" id="check56"><label for="check56"> 장애인 편의시설</label></li>
						    </ul>
					    </div>
					    </form>
				</aside>
			</div>
		<article>
			<nav>
				<ul class="info_list">
					<li><button type="button" a href='#pop_info_1' id="map_Bt" class="custom-btnn btn-3"><span><img src="image/map_icon.png">지 도</span></button></li>
					<div id="pop_info_1" class="pop_wrap" style="display:none;">
					  <div class="pop_inner">
					    <div class="mapWrap" id="map">
						</div>
					    <button type="button" class="btn_close">닫기</button>
					  </div>
					</div>
					<li><button type="button" id="high_Price_Bt" class="custom-btnn btn-3"><span><img src="image/high_price.png">높은 가격 순</span></button></li>
					<li><button type="button" id="low_Price_Bt" class="custom-btnn btn-3"><span><img src="image/low_price.png">낮은 가격 순</span></button></li>
					<li><button type="button" id="distance_Bt" class="custom-btnn btn-3"><span><img src="image/distance_icon.png">거리 순</span></button></li>
					<li><button type="button" id="recommen_Bt" class="custom-btnn btn-3"><span><img src="image/recommen_icon.png">추천 순</span></button></li>
				</ul>
			</nav>
				<div class="info">
					<div class="info_content">
						<ul>
							<%	
								for(int i=0; i<hotelList.size(); i++) {
									out.println("<a href='selecHotel.xr?hNum="+hotelList.get(i).getReg_num_h()+"&id="+id+"&cin="+hotelList.get(0).getCheckin()+"&cout="+hotelList.get(0).getCheckout()+"'><li>");
									out.println("<div class='list_image' style='background-image: url(image/" + hotelList.get(i).getAcc_picture() + "');>");
										out.println("<div class='content_text_wrap'>");
											out.println("<div class='info_in_text' id='info_intext1'><span>" + hotelList.get(i).getHotel_grade() + "</span></div>");
											out.println("<div class='info_in_text' id='info_intext2'><span>" + hotelList.get(i).getAcc_name() + "</span></div>");
											out.println("<div id='info_intext3'><span>★ " + hotelList.get(i).getRating() + " (" + df.format(hotelList.get(i).getReview_count()) + ")</span></div>");
											out.println("<div class='info_in_text' id='info_intext4'><span>" + hotelList.get(i).getLocation() + "</span></div>");
											out.println("<div id='info_intext5'><span>" + df.format(hotelList.get(i).getPrice()) + "</span>원</div>");
										out.println("</div>");
									out.println("</div>");
									out.println("</li></a>");
								}
							%>
						</ul>
					</div>
				</div>
			</div>
		</article>
	<jsp:include page="footer.jsp"/>
</body>
<link rel="stylesheet" type="text/css" href="css/hotel_resort_index.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="daterangepicker-master/daterangepicker.js"></script>
	<link rel="stylesheet" type="text/css" href="daterangepicker-master/daterangepicker.css"/>
	<script type="text/javascript" src="js/hotel_resort_index.js"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Do+Hyeon:400" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans:400" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Cute+Font:400" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
  	<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ion-rangeslider/2.3.1/css/ion.rangeSlider.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ion-rangeslider/2.3.1/js/ion.rangeSlider.min.js"></script>
</html>