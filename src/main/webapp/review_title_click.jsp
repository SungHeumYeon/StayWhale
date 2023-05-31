<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DTO.Writer"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/review_title_click.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
<script src="js/review_title_click.js"></script>
<meta charset="UTF-8">
<title>StayWhale | Review</title>
</head>
<body>
	<jsp:useBean id="data" class="DAO.DataProcess_Review"> </jsp:useBean>
	<%
		request.setCharacterEncoding("utf-8");
		String id = (String) session.getAttribute("id");
		String title = request.getParameter("title");
		int pa = Integer.parseInt(request.getParameter("page"));
		int num = Integer.parseInt(request.getParameter("num"));
		int readcount = Integer.parseInt(request.getParameter("readcount"));
		data.review_readcount(readcount, num);
		ArrayList<Writer> arr = data.review_print(title, num);
		String[] reviewImages = arr.get(0).getPost_file().split(",");
		String before_title = data.review_before(num);
		String next_title = data.review_next(num);
		Writer befo_num = data.before_after(before_title);
		Writer next_num = data.before_after(next_title);
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
		<input type="hidden" value="<%= pa%>" class="paging">
		<div id="big_title"><h1 style="font-family: 'Lobster', cursive;">Review</h1></div>
		<div class="form_wrap">
			<%
			for(int i=0; i<arr.size(); i++) {
			out.println("<div class='num_wrap'>No. <input type='text' class='content_num' name='num' readonly value='" + arr.get(i).getPost_num() + "'></div>");
			out.println("<div class='title_wrap'><input type='text' class='content_title' name='title' readonly value='" + arr.get(i).getPost_title() + "'></div>");
			out.println("<div class='two_wrap'>");
			out.println("<label>작성일</label><input type='text' class='writeday' name='writeday' readonly value='" + arr.get(i).getPost_date() + "'>");
			out.println("<label>작성자</label><input type='text' class='id_text' name='id' value='" + arr.get(i).getUser_id() + "' readonly>");
			out.println("<label>숙소명</label><input type='text' class='travel' readonly name='travellocation' value='" + arr.get(i).getPost_travel_location() + "'>");
			out.println("<label>평점</label><input type='text' class='avg_text' name='avgscore' readonly>");
			out.println("<label>조회수</label><input type='text' class='read_count' name='read_count' value='" + arr.get(i).getPost_readcount() + "' readonly>");
			out.println("</div>");
			out.println("<div class='content_wrap'>");
			out.println(" <div class='content_text'><textarea class='txt' name='txt' readonly>" + arr.get(i).getPost_body().replaceAll("<br>", "\r\n") + "</textarea></div>");
			out.println("</div>");
			if(arr.get(i).getPost_rating() == 1.0) {
				%>
				<script>
					$(".avg_text").val("★");
					$(".avg_text").css('color','#006CFA');
				</script>
				<%
			} else if (arr.get(i).getPost_rating() == 2.0) {
				%>
				<script>
					$(".avg_text").val("★★");
					$(".avg_text").css('color','#006CFA');
				</script>
				<%
			} else if (arr.get(i).getPost_rating() == 3.0) {
				%>
				<script>
					$(".avg_text").val("★★★");
					$(".avg_text").css('color','#006CFA');
				</script>
				<%
			} else if (arr.get(i).getPost_rating() == 4.0) {
				%>
				<script>
					$(".avg_text").val("★★★★");
					$(".avg_text").css('color','#006CFA');
				</script>
				<%
			} else if (arr.get(i).getPost_rating() == 5.0){
				%>
				<script>
					$(".avg_text").val("★★★★★");
					$(".avg_text").css('color','#006CFA');
				</script>
				<%
			}
			if(!arr.get(i).getPost_file().equals("null")) {
				out.println("<div id='file_image_wrap' class='file_image_wrap'>");
				for(int y=0; y<reviewImages.length; y++) {
					out.println("<div class='images'><img src='http://localhost:8081/StayWhale/review_image/" + reviewImages[y] + "'></div>");
				}
				out.println("</div>");
			}
			out.println("<div id='sucess_bt'>");
			String obj = arr.get(i).getUser_id();
			if(obj.equals(id)) {
				out.println("<button type='button' class='custom-btn btn-5' id='change_bt'>수 정</button>");
				out.println("<button type='button' class='custom-btn btn-5' id='delete_bt'>삭 제</button>");
			} else { }
			out.println("<button type='button' class='custom-btn btn-5' onclick=location.href='reviewSelec.xr?page="+pa+"'>목 록</button>");
			out.println("<input type='hidden' class='page' value='"+pa+"'>");
			out.println("</div>");	
			}
			out.println("<div id='next_befor_wrap'>");
			if(!before_title.equals("")) {
				out.println("<div id='befor_review'>");
					out.println("<div>이전 리뷰</div>");
					out.println("<input type='hidden' class='str' value='" + befo_num.getPost_num() + "'>");
					out.println("<input type='text' class='before_next' style='cursor: pointer;' readonly value='" + before_title + "'>");
					out.println("<input type='hidden' class='readcount' value='" + befo_num.getPost_readcount() + "'>");
				out.println("</div>");
			}
			if(!next_title.equals("")) {
				out.println("<div id='next_review'>");
					out.println("<div>다음 리뷰</div>");
					out.println("<input type='hidden' class='str' value='" + next_num.getPost_num() + "'>");
					out.println("<input type='text' class='before_next' style='cursor: pointer;' readonly value='" + next_title + "'>");
					out.println("<input type='hidden' class='readcount' value='" + next_num.getPost_readcount() + "'>");
				out.println("</div>");
			}
			out.println("</div>");
			%>
		</div>
	</section>
	<jsp:include page="footer.jsp"/>
</body>
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> 
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
</html>