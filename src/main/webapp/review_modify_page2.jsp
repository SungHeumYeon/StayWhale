<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DTO.Writer"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/review_modify_page2.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="js/review_modify_page2.js"></script>
<meta charset="UTF-8">
<title>Review modify</title>
</head>
<body>
	<jsp:useBean id="data" class="DAO.DataProcess_Review"> </jsp:useBean>
	<%
		request.setCharacterEncoding("utf-8");
		String id = (String) session.getAttribute("id");
		String title = request.getParameter("title");
		String text = request.getParameter("text").replaceAll("<br>", "\r\n");
		String avgscore = request.getParameter("avgscore");
		int num = Integer.parseInt(request.getParameter("num"));
		String travellocation = request.getParameter("travellocation");
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
		<div id="big_title"><h1 style="font-family: 'Lobster', cursive;">Review Modify</h1></div>
		<div class="form_wrap">
			<form action="dbprocess/review_modify.jsp" id="myform" onsubmit="return check()">
				<div class="num_wrap">No. <input type='text' class='content_num' name='num' readonly value="<%= num%>"></div>
				<div class="title_wrap"><input type="text" class="content_title" name="title" value="<%= title%>"></div>
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
					<div>숙소명<input type="text" class="location_text" name="travellocation" value="<%= travellocation%>" readonly></div>
				</div>
				<div style="display: flex; justify-content: center;">
					<textarea class="txt" name="txt"><%= text%></textarea>
				</div>
				<div id="img_list_wrap">
					<div></div>
				</div>
				<div id="sucess_bt">
					<button type="button" class="custom-btn btn-5" onclick="location.href='Bulletin_Board_Review.jsp'">목 록</button>
					<button type="submit" class="custom-btn btn-5">수정완료</button>
				</div>
			</form>
		</div>
	</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>