<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>STAY WHALE || Diary</title>
	<link rel="stylesheet" type="text/css" href="css/diary_index.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="js/diary_index.js"></script>
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
	
	<div class="section_wrap"></div>
	<section>
		<form>
			<div id="background" class="background" style="background-color: #E8F3FB;"></div>
			<div id="background" class="background" style="background-color: #F6DCDA;"></div>
			<div id="background" class="background" style="background-color: #F1E6CC;"></div>
			<div id="background" class="background" style="background-color: #F3DBC5;"></div>
			<div id="background" class="background" style="background-color: #D0CEF6;"></div>
			<div id="background" class="background" style="background-color: #D3F2DF;"></div>
			<div id="background" class="background" style="background-color: #E4EFD0;"></div>
		<div id="top_nav">
			<ul id="menu_bar">
				<li><a href="">여행 Diary</a></li>
				<li><a href="">자유게시판</a></li>
				<li><a href="Bulletin_Board_Review.jsp">리뷰</a></li>
				<li><a href="">1:1게시판</a></li>	
			</ul>			
			<div id="active_bar">
				<ul id="menu_bar2">
				<li><a href="">여행 Diary</a></li>
				<li><a href="">자유게시판</a></li>
				<li><a href="">리뷰</a></li>
				<li><a href="">1:1게시판</a></li>	
			</ul>
		</div>

		

		<div id="top_text">
			<span><b>여행일정과 경로를 공유해보세요</b></span>
		</div>
		
		<div id="top_image_frame">
			<div id="top_image">
				<img src="image/top_image1.png">
			</div>
			<div id="top_text2">
				<span id="content1"><b>꿈을 담은 특별한 여행</b></span>
				<span id="content2"><b>당신의 여행을 공유해 보세요.</b></span>
				<span id="top_text3">
					<ul id="top_text4">
						<li><b>추억과 계획의 공유공간.</b></li>
						<li># 현실화 - 상상속의 여행 현실화.</li>
						<li># 간직 - 좋은 기억은 오래 간직.</li>
						<li># 함께하기 - 취향과 관심사를 함께하는 여행. </li>
						<li># 공유 - 좋은 추억을 타인과 공유.</li>
					</ul><br>
					<p>계획했던 여행지를 지도에서 선택하고 여행의 계획을 세울수 있습니다.<br>
						같은 곳을 방문했던 다른 사람의 후기를 보고, 최적의 루트로 여행을 즐겨 보세요.
					</p>
				</span>
				<input type="button" name="tour_plan" id="tour_plan" value="여행계획하러가기">
				<input type="button" name="total_content" id="total_content" value="전체게시물 보기">
			</div>
		</div>
		<div id="title_wrap1">
			<strong>베스트 Diary</strong>
			<span id="icon"><img src="image/best.png"></span>
		</div>
		<div id="slide_container">
		<div id="slide1">
			<ul id="slide_list">
				<li>
					<div>
						<img src="image/p1.png">
					</div>
					<div>
						<ul>
							<li>제목 :엄마야 누나야 강변살자.</li>
							<li>출발일 : 2023.10.10 (3박)</li>
							<li>내용 :푸른언덕에 배낭을매고 황금빛 태양 축제를 여는</li>
							<li>userID</li>
							<li><strong># 바람, # 모래사장, #신난다, # 즐거운 하루 , # 신나는 하루</strong></li>
						</ul>

					</div>
		
				</li>
				<li>
					<div>
						<img src="image/p2.png">
					</div>
					<div>
						<ul>
							<li>어어엄마야누우우우나야 강변살자</li>
							<li>출발일 : 2023.10.10 (3박)</li>
							<li>내용 :푸른언덕에 배낭을매고 황금빛 태양 축제를 여는</li>
							<li>userID</li>
							<li><strong># 바람, # 모래사장, #신난다, # 즐거운 하루 , # 신나는 하루</strong></li>
						</ul>
					</div>
					
				</li>
				<li>
					<div>
						<img src="image/p3.png">
					</div>
					<div>
						<ul>
							<li>제목 :엄마야 누나야 강변살자.</li>
							<li>출발일 : 2023.10.10 (3박)</li>
							<li>내용 :푸른언덕에 배낭을매고 황금빛 태양 축제를 여는</li>
							<li>userID</li>
							<li><strong># 바람, # 모래사장, #신난다, # 즐거운 하루 , # 신나는 하루</strong></li>
						</ul>
					</div>
					
				</li>
				<li>
					<div>
						<img src="image/p4.png">
					</div>
					<div>
						<ul>
							<li>제목 :엄마야 누나야 강변살자.</li>
							<li>출발일 : 2023.10.10 (3박)</li>
							<li>내용 :푸른언덕에 배낭을매고 황금빛 태양 축제를 여는weofowiejfwioejfowejfiwejfweoifjweiofjwoeijfweoif</li>
							<li>userID</li>
							<li><strong># 바람, # 모래사장, #신난다, # 즐거운 하루 , # 신나는 하루</strong></li>
						</ul>
					</div>
				</li>
				<li>
					<div>
						<img src="image/p1.png">
					</div>
					<div>
						<ul>
							<li>제목 :엄마야 누나야 강변살자.</li>
							<li>출발일 : 2023.10.10 (3박)</li>
							<li>내용 :푸른언덕에 배낭을매고 황금빛 태양 축제를 여는</li>
							<li>userID</li>
							<li><strong># 바람, # 모래사장, #신난다, # 즐거운 하루 , # 신나는 하루</strong></li>
						</ul>

					</div>
		
				</li>
				<li>
					<div>
						<img src="image/p1.png">
					</div>
					<div>
						<ul>
							<li>제목 :엄마야 누나야 강변살자.</li>
							<li>출발일 : 2023.10.10 (3박)</li>
							<li>내용 :푸른언덕에 배낭을매고 황금빛 태양 축제를 여는</li>
							<li>userID</li>
							<li><strong># 바람, # 모래사장, #신난다, # 즐거운 하루 , # 신나는 하루</strong></li>
						</ul>

					</div>
		
				</li>
				<li>
					<div>
						<img src="image/p1.png">
					</div>
					<div>
						<ul>
							<li>제목 :엄마야 누나야 강변살자.</li>
							<li>출발일 : 2023.10.10 (3박)</li>
							<li>내용 :푸른언덕에 배낭을매고 황금빛 태양 축제를 여는</li>
							<li>userID</li>
							<li><strong># 바람, # 모래사장, #신난다, # 즐거운 하루 , # 신나는 하루</strong></li>
						</ul>

					</div>
		
				</li>
				<li>
					<div>
						<img src="image/p4.png">
					</div>
					<div>
						<ul>
							<li>제목 :엄마야 누나야 강변살자.</li>
							<li>출발일 : 2023.10.10 (3박)</li>
							<li>내용 :푸른언덕에 배낭을매고 황금빛 태양 축제를 여는weofowiejfwioejfowejfiwejfweoifjweiofjwoeijfweoif</li>
							<li>userID</li>
							<li><strong># 바람, # 모래사장, #신난다, # 즐거운 하루 , # 신나는 하루</strong></li>
						</ul>
					</div>
				</li>
			</ul>
			
		</div>
		
		</div>
			<button type="button" name="button_left" id="button_left"><img src="image/button_left.png"></button>
			<button type="button" name="button_right" id="button_right"><img src="image/button_right.png"></button>

		<div id="title_wrap2" class="title_wrap">
			<strong>지역별 Best<img src="image/best2.png" id="icon2"></strong>
		</div>

		

		<div id="bottom_frame">
			<strong>함께하는 <br>내나라 여행.</strong>
			<div id="bottom_main_img">
				<img src="image/bottom_img.jpg">
			</div>
	
			<ul class="ul_style" id="slide_list1">
					<li>
						<div><img src="image/p4.png"></div>
						<div>
							<ul>
							<li>제목 :엄마야 누나야 가아앙변.</li>
							<li>출발일 : 2023.10.10 (3박)</li>
							<li>동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라만세 무궁과 삼철니 화려가머어ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</li>
							<li>userID</li>
							<li><strong># 바람, # 모래사장, #신난다, # 즐거운 하루 , # 신나는 하루</strong></li>

						</ul>
							
						</div>
					</li>
					<li>
						<div><img src="image/p5.png"></div>
						<div>
							<ul>
							<li>제목 :살어리 살어리 낫다.</li>
							<li>출발일 : 2023.10.10 (3박)</li>
							<li>내용 :청산에 살어리가 낫는데 십리도 못가서 발병난다 여는</li>
							<li>userID</li>
							<li><strong># 신난다, # 두두두두두, #빵야방야, # 즐거운 하루 , # 신나는 하루</strong></li>
						</ul>
						</div>
					</li>
					<li>
						<div><img src="image/p6.png"></div>
						<div>
							<ul>
							<li>제목 : 나를 버리고 가시는 길은 십리도 못가서</li>
							<li>출발일 : 2023.10.10 (4박)</li>
							<li>내용 :아아 님은 갔습니다. 님은 갓지만 나는 님을 </li>
							<li>userID</li>
							<li><strong># 독립운동, # 닛본바시, # 오오토리바시, # 즐거운 하루 , # 신나는 하루</strong></li>
						</ul>
						</div>
					</li>
			</ul>
			<ul class="ul_style" id="slide_list2">
					<li>
						<div><img src="image/p7.png"></div>
						<div>
							<ul>
							<li>제목 : 울산베어와 함께 울산투어</li>
							<li>출발일 : 2023.10.10 (4박)</li>
							<li>내용 : 하늘을 우러러 한점 부끄럼이 없기를 잎새에 이는 바람에도 나는 괴로와 했다. </li>
							<li>userID</li>
							<li><strong># 동해물과, # 백두산이, # 마르고 닳도록, # 즐거운 하루 , # 신나는 하루</strong></li>
						</ul>
						</div>
					</li>
					<li>
						<div><img src="image/p8.png"></div>
						<div>
							<ul>
							<li>제목 : 울산베어와 함께 울산투어</li>
							<li>출발일 : 2023.10.10 (4박)</li>
							<li>내용 : 하늘을 우러러 한점 부끄럼이 없기를 잎새에 이는 바람에도 나는 괴로와 했다. </li>
							<li>userID</li>
							<li><strong># 동해물과, # 백두산이, # 마르고 닳도록, # 즐거운 하루 , # 신나는 하루</strong></li>
						</ul>
					</div>
					</li>
					<li>
						<div><img src="image/p9.png"></div>
						<div>
							<ul>
							<li>제목 : 울산베어와 함께 울산투어</li>
							<li>출발일 : 2023.10.10 (4박)</li>
							<li>내용 : 하늘을 우러러 한점 부끄럼이 없기를 잎새에 이는 바람에도 나는 괴로와 했다. </li>
							<li>userID</li>
							<li><strong># 동해물과, # 백두산이, # 마르고 닳도록, # 즐거운 하루 , # 신나는 하루</strong></li>
						</ul>
						</div>
					</li>
			</ul>
			<ul class="ul_style" id="slide_list3">
					<li>
						<div><img src="image/p10.png"></div>
						<div>
							<ul>
							<li>제목 : 루비와 함께하는 해적왕을 위한 여행</li>
							<li>출발일 : 2023.10.10 (4박)</li>
							<li>내용 : 내 어린시절 우연히 들었던 믿지 못할 한마디. 이 세상을 다준다는 매혹적인 이야기. </li>
							<li>userID</li>
							<li><strong># 해적왕, # 나는된다, # 나는야해적왕 , # 즐거운 하루 , # 신나는 하루</strong></li>
						</ul>
						</div>
					</li>
					<li>
						<div><img src="image/p11.png"></div>
						<div>
							<ul>
							<li>제목 : 루비와 함께하는 해적왕을 위한 여행</li>
							<li>출발일 : 2023.10.10 (4박)</li>
							<li>내용 : 내 어린시절 우연히 들었던 믿지 못할 한마디. 이 세상을 다준다는 매혹적인 이야기. </li>
							<li>userID</li>
							<li><strong># 해적왕, # 나는된다, # 나는야해적왕 , # 즐거운 하루 , # 신나는 하루</strong></li>
						</ul>
						</div>
					</li>
					<li>
						<div><img src="image/p12.png"></div>
						<div>
							<ul>
							<li>제목 : 루비와 함께하는 해적왕을 위한 여행</li>
							<li>출발일 : 2023.10.10 (4박)</li>
							<li>내용 : 내 어린시절 우연히 들었던 믿지 못할 한마디. 이 세상을 다준다는 매혹적인 이야기. </li>
							<li>userID</li>
							<li><strong># 해적왕, # 나는된다, # 나는야해적왕 , # 즐거운 하루 , # 신나는 하루</strong></li>
						</ul>
						</div>
					</li>
			</ul>
			<ul class="ul_style" id="slide_list4">
					<li>
						<div><img src="image/p1.png"></div>
						<div>
							<ul>
							<li>제목 : 키부츠지 무잔 사냥 여행.</li>
							<li>출발일 : 2023.10.10 (4박)</li>
							<li>내용 : 무엇이 재미있더냐? 무엇이 즐겁더냐 사람의 목숨을 무엇이라 생각하는 것이냐. </li>
							<li>userID</li>
							<li><strong># 요리이치, # 무잔, # 코쿠시보 , # 아카자 , # 신나는 하루</strong></li>
						</ul>
						</div>
					</li>
					<li>
						<div><img src="image/p2.png"></div>
						<div>
							<ul>
							<li>제목 : 키부츠지 무잔 사냥 여행.</li>
							<li>출발일 : 2023.10.10 (4박)</li>
							<li>내용 : 무엇이 재미있더냐? 무엇이 즐겁더냐 사람의 목숨을 무엇이라 생각하는 것이냐. </li>
							<li>userID</li>
							<li><strong># 요리이치, # 무잔, # 코쿠시보 , # 아카자 , # 신나는 하루</strong></li>
						</ul>
						</div>
					</li>
					<li>
						<div><img src="image/p3.png"></div>
						<div>
							<ul>
							<li>제목 : 키부츠지 무잔 사냥 여행.</li>
							<li>출발일 : 2023.10.10 (4박)</li>
							<li>내용 : 무엇이 재미있더냐? 무엇이 즐겁더냐 사람의 목숨을 무엇이라 생각하는 것이냐. </li>
							<li>userID</li>
							<li><strong># 요리이치, # 무잔, # 코쿠시보 , # 아카자 , # 신나는 하루</strong></li>
						</ul>
						</div>
					</li>
			</ul>
			<div id="button_list">
			<ul>
				<li><button class="btn" id="region1" type="button" ><span>경상권</span></button></li>
				<li><button class="btn" id="region2" type="button" ><span>전라권</span></button></li>
				<li><button class="btn" id="region3" type="button" ><span>제주도</span></button></li>
				<li><button class="btn" id="region4" type="button" ><span>기타</span></button></li>


			</ul>
			</div>
				
		</div>
		
	</form>
	</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>