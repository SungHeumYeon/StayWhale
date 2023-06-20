# Web Project StayWhale
JSP MVC2 패턴으로 제작된 호텔&리조트 예약 사이트


## 🖥️ 프로젝트 소개
'여기어때'를 모델링하여 만든 호텔 예약 사이트입니다.
<br>

## 🕰️ 개발 기간
* 23.03.26일 - 23.06.02일

## 📺 실행영상
[![StayWhale 시연영상](http://img.youtube.com/vi/BkxuGYxb3cs/0.jpg)](https://youtu.be/BkxuGYxb3cs?t=0s)
* 이용 후기 게시판 실행 영상

[![StayWhale 시연영상](http://img.youtube.com/vi/qmceBHZ_p6o/0.jpg)](https://youtu.be/qmceBHZ_p6o?t=0s)
* 호텔 & 리조트 메인 기능 실행 영상

### 🧑‍🤝‍🧑 맴버구성
 - 연성흠 : Review 게시판(MVC2 -> Spring FrameWork로 변경) 구현 ~ing, 호텔&리조트 예약 기능

### ⚙️ 개발 환경
- `Java 8`
- `JDK 1.8.0`
- **Database** : MySql DB
- eclipse, Sublime Text, MySql WorkBench, apache Tomcat 8.5v

## 📌 주요 기능
#### 로그인
- DB값 검증
- 로그인 시 세션(Session) 생성
#### 회원가입
- 주소 API 연동
- AJAX를 활용한 ID 중복 체크
#### 리뷰 게시판
- MVC2 모델 구조에서 Spring FrameWork 구조로 변경 중
- File Multiple 속성을 이용한 후기 사진 업로드
#### 숙소 예약
- 호텔 선택(지역 선택 필수)
- 날짜 기준 예약 가능 객실 확인
- 마이페이지 제작 x, 가장 최근에 다녀온 호텔 기준 후기 작성 가능
