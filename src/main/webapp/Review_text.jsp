<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DTO.Writer"%>
<%@ page import="vo.HotelBean"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/review_text.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="js/review_text.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="data" class="DAO.DataProcess_Review"> </jsp:useBean>
	<%
		request.setCharacterEncoding("utf-8");
		String id = (String) session.getAttribute("id");
		int pa = Integer.parseInt(request.getParameter("page"));
		HotelBean hotelbean = data.writeReview(id);
		if(hotelbean.getAcc_name() == null) {
			%> 
			<script>
				alert("예약 정보가 존재하지 않습니다.")
				history.back()
			</script>
			<%
		} else {
			%> 
			<script>
				var result = confirm("가장 최근에 예약하신 호텔의 후기를 작성하시겠습니까")
				if(result == true) {
					
				} else {
					history.back()
				}
			</script>
			<%
		}
	%>
	<%
		if(id == null) {
	%>
		<jsp:include page="Header_Login_Fail.jsp" >
			<jsp:param name="id" value="<%= id%>"/>
		</jsp:include>
		<script>
			alert("로그인을 먼저 해주세요")
			history.back()
		</script>
	<%
	} else {
	%>
		<jsp:include page="Header_Login_Success.jsp"/>
	<%
	}
	%>

	<section>
		<div id="big_title"><h1 style="font-family: 'Lobster', cursive;">Review Write</h1></div>
		<div class="form_wrap">
			<form action="dbprocess/review_Insert.jsp" id="myform" onsubmit="return check()" method="post" enctype="multipart/form-data">
				<div class="title_wrap"><input type="text" class="content_title" name="title" placeholder="제목을 입력해주세요"></div>
				<input type="hidden" value="<%= pa%>" name="page">
				<input type="hidden" value="<%= hotelbean.getReg_num_h()%>" name="hNum">
				<div class="secon_wrap" style="margin-top: 10px;">
					<div class="avgscore_wrap">평점
					<fieldset class="avgscore">
						<input type="radio" name="reviewStar" value="5" id="rate1"><label
							for="rate1">★</label>
						<input type="radio" name="reviewStar" value="4" id="rate2"><label
							for="rate2">★</label>
						<input type="radio" name="reviewStar" value="3" id="rate3"><label
							for="rate3">★</label>
						<input type="radio" name="reviewStar" value="2" id="rate4"><label
							for="rate4">★</label>
						<input type="radio" name="reviewStar" value="1" id="rate5"><label
							for="rate5">★</label>
					</fieldset>
					</div>
					<div>작성자<input type="text" class="id_text" value= "<%= id%>" name="id" readonly></div>
					<div>숙소명<input type="text" class="location_text" name="travellocation" value="<%= hotelbean.getAcc_name()%>" readonly></div>
				</div>
				<div style="display: flex; justify-content: center;">
					<textarea class="txt" name="txt" placeholder="소중한 리뷰를 작성해 주세요."></textarea>
				</div>
				<div id="input_file_wrap">
					<div class="filebox">
					    <input type="text" class="upload-name" name="upload-name" readonly placeholder="첨부파일">
					    <label for="file">파일찾기</label><input type="file" id="file" name="filename[]" multiple accept="image/*">
					</div>
				</div>
				<div id="preview"></div>
				<div id="sucess_bt">
					<button type="button" class="custom-btn btn-5" onclick="location.href='reviewSelec.xr?page=<%= pa%>'">목 록</button>
					<button type="submit" class="custom-btn btn-5">완 료</button>
				</div>
			</form>
		</div>
	</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>