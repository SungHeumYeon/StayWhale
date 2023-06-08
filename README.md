# SpringBoot-Project-MEGABOX
JSP MVC2 패턴으로 제작된 호텔&리조트 예약 사이트


## 🖥️ 프로젝트 소개
'여기어때'를 참고하여 만든 숙소 예약 사이트입니다.
<br>

## 🕰️ 개발 기간
* 23.03.26일 - 23.06.02일

### 🧑‍🤝‍🧑 맴버구성
 - 연성흠 : Review 게시판(MVC2 -> Spring FrameWork로 변경) 구현, 호텔&리조트 예약 부분, 로그인, 회원가입

### ⚙️ 개발 환경
- `Java 8`
- `JDK 1.8.0`
- **Database** : MySql DB
- eclipse, Sublime Text, MySql WorkBench

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
- 예약 완료
