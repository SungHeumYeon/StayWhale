# Web Project StayWhale
JSP 및 MVC2 아키텍처 패턴으로 제작된 호텔&리조트 예약 사이트 + 스프링 프레임 워크 기반 CRUD 후기 게시판

## 🖥️ 프로젝트 소개
'여기어때'를 모델링하여 만든 호텔 예약 사이트입니다.
<br>
### 🐳 STAY WHALE
고래가 머무는 곳

넓은 바다를 헤엄치며 살아가는 <u>'고래가 머물다 가는 곳'</u> 이라는 이름<br>
넓은 웹이라는 바다에서 누구나 쉽고 편하게 서비스를 제공받고자 하는<br>
숙소 예약 웹사이트를 제작 해보고 싶어 만들게 되었습니다.

## 🕰️ 개발 기간
* 23.03.26일 - 23.06.02일

## 📺 실행영상
[![StayWhale 시연영상](http://img.youtube.com/vi/BkxuGYxb3cs/0.jpg)](https://youtu.be/BkxuGYxb3cs?t=0s)
** 이용 후기 게시판 실행 영상 **

[![StayWhale 시연영상](http://img.youtube.com/vi/qmceBHZ_p6o/0.jpg)](https://youtu.be/qmceBHZ_p6o?t=0s)
** 호텔 & 리조트 메인 기능 실행 영상 **

### 🧑‍🤝‍🧑 맴버 구성
 - 연성흠 : Review 게시판(MVC2 -> Spring FrameWork로 변경) 구현 ~ing, 호텔&리조트 예약 및 결재 기능

### ⚙️ 개발 환경
- `Java 8`
- `JDK 1.8.0`
- **Database** : MySql DB Workbench
- eclipse, Sublime Text, MySql WorkBench, apache Tomcat 8.5v, GSON etc.

## 📌 주요 기능
#### 로그인 [상세코드 확인](https://github.com/webpofol/StayWhale/wiki/로그인-기능-소개)
- DB값 검증
- 로그인 시 세션(Session) 생성
- 세션을 활용하여 로그인 후 사용자가 보고있던 페이지로 전환(편리성 강화)
#### 회원가입
- 주소 API 연동
- AJAX를 활용한 ID 중복 체크
#### 리뷰 게시판
- MVC2 모델 구조에서 Spring FrameWork 구조로 변경
- File Multiple 속성을 이용한 다수의 후기 사진 업로드 가능
- 8개 게시글 출력 후 페이징 처리
- 제목, 작성자, 호텔&리조트 숙소명 기준 검색 기능
#### 숙소 예약
- 후기의 갯수 기준으로 추천 순 정렬, 낮은가격 순 정렬, 높은 가격 순 정렬 가능
- 다수의 CheckBox를 활용한 검색 기능 강화
- DateRangePicker를 활용한 달력 날짜 기준 예약 가능 객실 확인
- 마이페이지 제작이 안된 관계로 가장 최근 다녀온 호텔&리조트 기준 후기 작성 가능

## 🛠️ 추가 보완
#### 230624 Iamport Rest API를 활용한 호텔 예약 결재 기능 구현 완료
