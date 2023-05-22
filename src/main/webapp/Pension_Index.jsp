<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Pension Index</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="js/pension_index.js"></script>
	<link rel="stylesheet" type="text/css" href="css/pension_index.css">
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9ac96333bf6ff2bb0f94315ab1e58bf1&libraries=services"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = (String) session.getAttribute("id");
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
	<div class="section_wrap"></div>
		<div id="main_search_wrap">
			<div id="image_in" class="image_in">
				<div class="selec_wrap">
					<div id="search_01">
						<ul>
							<li>지역 선택</li>
							<li>체크인</li>
							<li>체크아웃</li>
						</ul>
					</div>
					<form>
						<div id="search_02">			
							<ul>
								<li>
									<select name="sido1" value = "시/도" id="sido1"></select>
									<select name="gugun1" value = "구/군" id="gugun1"></select>
								</li>
								<li>
									<input type="text" name="from" id="from" class="datepicker" style="cursor: ponter" placeholder="select a check-in date">
								</li>
								<li>
									<input type="text" name="to" id="to" class="datepicker" style="cursor: ponter" placeholder="select a check-out date">
								</li>
							</ul>
						</div>
						<div class="bt_wrap">
							<button type="reset" class="custom-btn btn-5" id="reset_Bt"><span>초기화</span></button>
							<button type="button" class="custom-btn btn-5" id="confim_Bt"><span>검 색</span></button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<section id="fir_sec">
		<div id="theme_wrap">
			<div>
				<ul id="icon_list">
					<li><img src="image/pension_new_icon.png">
					<div>신규</div></li>
					<li><img src="image/pension_hot_icon.png">
					<div>Best Hot</div></li>
					<li><img src="image/pension_sale_icon.png">
					<div>특가</div></li>
					<li><img src="image/pension_golf_icon.png">
					<div>골프</div></li>
					<li><img src="image/pension_kiz_icon.png">
					<div>키즈</div></li>
					<li><img src="image/pension_suffing_icon.png">
					<div>서핑</div></li>
					<li><img src="image/pension_hanok_icon.png">
					<div>한옥</div></li>
					<li><img src="image/pension_view_icon.png">
					<div>전망</div></li>
					<li><img src="image/pension_sigol_icon.png">
					<div>시골</div></li>
					<li><img src="image/pension_sea_icon.png">
					<div>바다</div></li>
				</ul>
			</div>
		</div>
	</section>
	<section id="sec_section">
		<div id="two_title">
			<img src="image/pension_reccomend.png">StayWhale의 추천 펜션
		</div>
			<div class="rec_info">
				<ul>
					<li>
						<div class="title_image">
							<div id="rec_content">
								<div class="name">숲의 길 펜션</div>
								<div class="address">경기 가평<span class="avgscore"><span id="score_star"> ★</span>4.7</span></div>
								<div class="price">200,000<span>원 부터</span></div>
							</div>
						</div>
					</li>
					<li>
						<div class="title_image">
							<div id="rec_content">
								<div class="name">숲의 길 펜션</div>
								<div class="address">경기 가평<span class="avgscore"><span id="score_star"> ★</span>4.7</span></div>
								<div class="price">200,000<span>원 부터</span></div>
							</div>
						</div>
					</li>
					<li>
						<div class="title_image">
							<div id="rec_content">
								<div class="name">숲의 길 펜션</div>
								<div class="address">경기 가평<span class="avgscore"><span id="score_star"> ★</span>4.7</span></div>
								<div class="price">200,000<span>원 부터</span></div>
							</div>
						</div>
					</li>
					<li>
						<div class="title_image">
							<div id="rec_content">
								<div class="name">숲의 길 펜션</div>
								<div class="address">경기 가평<span class="avgscore"><span id="score_star"> ★</span>4.7</span></div>
								<div class="price">200,000<span>원 부터</span></div>
							</div>
						</div>
					</li>
					<li>
						<div class="title_image">
							<div id="rec_content">
								<div class="name">숲의 길 펜션</div>
								<div class="address">경기 가평<span class="avgscore"><span id="score_star"> ★</span>4.7</span></div>
								<div class="price">200,000<span>원 부터</span></div>
							</div>
						</div>
					</li>
					<li>
						<div class="title_image">
							<div id="rec_content">
								<div class="name">숲의 길 펜션</div>
								<div class="address">경기 가평<span class="avgscore"><span id="score_star"> ★</span>4.7</span></div>
								<div class="price">200,000<span>원 부터</span></div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		<h2 style="margin-bottom: 30px; margin-top: 50px;">Hot한 행사</h2>
			<div class="event_info_wrap">
				<ul>
					<li>끝나가는 행사</li>
					<li>진행중인 행사1</li>
					<li>진행중인 행사2</li>
					<li>진행중인 행사3</li>
					<li>진행중인 행사4</li>
				</ul>
			</div>
		</form>
	</section>
<jsp:include page="footer.jsp"/>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css"/>
</html>