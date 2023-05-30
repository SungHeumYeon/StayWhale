<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ page import="DTO.Writer"%>
<%@ page import="vo.PageInfo"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/review_page.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="js/review_page.js"></script>

<meta charset="UTF-8">
<title>StayWhale | Review</title>
</head>
<body>
	<jsp:useBean id="data" class="DAO.DataProcess_Review"> </jsp:useBean>
	<jsp:useBean id="obj" class="DTO.Writer"> </jsp:useBean>
	<%
		request.setCharacterEncoding("utf-8");
		String id = (String) session.getAttribute("id");
		ArrayList<Writer> arr = (ArrayList<Writer>)request.getAttribute("reviewList");
		
		String txt = "";
		for(int i=0; i<arr.size(); i++) {
			txt += arr.get(i).getPost_file() + ",/";
		}
		String[] reviewImage = txt.split(",/");

		
		PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
		int listCount=pageInfo.getListCount();
		int nowPage=pageInfo.getPage();
		int maxPage=pageInfo.getMaxPage();
		int startPage=pageInfo.getStartPage();
		int endPage=pageInfo.getEndPage();
		String search = (String)request.getAttribute("search");
		String str = (String)request.getAttribute("str");
		String val = (String)request.getAttribute("val");
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
	<section id="section_wrap">
		<div id="title_wrap">
			<div id="big_title">
				<h1 style="font-family: 'Lobster', cursive;">Review Bulletin</h1>
				<h4 id="title_under">StayWhale 회원님만의 추억을 기록해주세요</h4>
			</div>
		</div>
		<div id="content_wrap">
			<div id="content_1">
				<ul id="content_ul">
					<%
						for(int i=0; i<arr.size(); i++) {
							out.println("<li id='content_li'>");
							if(arr.get(i).getPost_file().equals("null")) {
								out.println("<div id='thumbnail' style='background-image: url(image/no-photo.png);'></div>");
							} else {
								for(int y=0; y<reviewImage.length; y++) {
									String[] imgValue = reviewImage[i].split(",");
									for(int x=0; x<imgValue.length; x++) {
										out.println("<div id='thumbnail' style='background-image: url(http://localhost:8081/StayWhale/review_image/"+imgValue[x]+");'></div>");
									}
									break;
								}
							}
							out.println("<div id='title'>"+ arr.get(i).getPost_title() +"</div>");
							out.println("<div id='profile_wrap'>");
							out.println("<img src='image/review_profile_icon.png'>");
							out.println("<div>");
							out.println("<div id='profile_text'><label id='user_id'>" + arr.get(i).getUser_id() + "<br></label><label id='post_date'>" + arr.get(i).getPost_date() + "</label></div>");
							out.println("</div>");
							out.println("<div><div id='travellocation'>" + arr.get(i).getPost_travel_location() + "</div>");
							if(arr.get(i).getPost_rating() == 1.0) {
								out.println("<div id='avgscore'>" + "★" + "</div></div>");
							} else if(arr.get(i).getPost_rating() == 2.0) {
								out.println("<div id='avgscore'>" + "★★" + "</div></div>");
							} else if(arr.get(i).getPost_rating() == 3.0) {
								out.println("<div id='avgscore'>" + "★★★" + "</div></div>");
							} else if(arr.get(i).getPost_rating() == 4.0) {
								out.println("<div id='avgscore'>" + "★★★★" + "</div></div>");
							} else if(arr.get(i).getPost_rating() == 5.0) {
								out.println("<div id='avgscore'>" + "★★★★★" + "</div></div>");
							}
							out.println("<input type='hidden' id='post_num' name='post_num' value='" + arr.get(i).getPost_num() + "'>");
							out.println("<input type='hidden' id='post_category' name='post_category' value='" + arr.get(i).getPost_category() + "'>");
							out.println("<input type='hidden' id='post_like' name='post_like' value='" + arr.get(i).getPost_like()+ "'>");
							out.println("<input type='hidden' id='post_readcount' name='post_readcount' value='" + arr.get(i).getPost_readcount()+ "'>");
							out.println("</li>");
						}
					%>
				</ul>
			</div>
		</div>
			<div id="search_wrap">
				<div class="page_wrap">
					<%if(search == "search") {%>
						<section id="pageList">
							<%if(nowPage<=1){ %>
							<input type="image" class="prevAfterIcons" src="image/left_icon.png">
							<%}else{ %>
							<a href="reviewSearch.xr?page=<%=nowPage-1 %>&str=<%= str%>&val=<%= val%>"><input type="image" class="prevAfterIcons" src="image/left_icon.png"></a>
							<%} %>
					
							<%for(int a=startPage;a<=endPage;a++){
									if(a==nowPage){%>
							<span class="pageNum"><%=a %></span>
							<%}else{ %>
							<a href="reviewSearch.xr?page=<%=a %>&str=<%= str%>&val=<%= val%>"><span class="pageNum"><%=a %></span>
							</a>
							<%} %>
							<%} %>
					
							<%if(nowPage>=maxPage){ %>
							<input type="image" class="prevAfterIcons" src="image/right_icon.png">
							<%}else{ %>
							<a href="reviewSearch.xr?page=<%=nowPage+1 %>&str=<%= str%>&val=<%= val%>"><input type="image" class="prevAfterIcons" src="image/right_icon.png"></a>
							<%} %>
						</section>
					<%}else{%>
						<section id="pageList">
							<%if(nowPage<=1){ %>
							<input type="image" class="prevAfterIcons" src="image/left_icon.png">
							<%}else{ %>
							<a href="reviewSelec.xr?page=<%=nowPage-1 %>"><input type="image" class="prevAfterIcons" src="image/left_icon.png"></a>
							<%} %>
					
							<%for(int a=startPage;a<=endPage;a++){
									if(a==nowPage){%>
							<span class="pageNum"><%=a %></span>
							<%}else{ %>
							<a href="reviewSelec.xr?page=<%=a %>"><span class="pageNum"><%=a %></span>
							</a>
							<%} %>
							<%} %>
					
							<%if(nowPage>=maxPage){ %>
							<input type="image" class="prevAfterIcons" src="image/right_icon.png">
							<%}else{ %>
							<a href="reviewSelec.xr?page=<%=nowPage+1 %>"><input type="image" class="prevAfterIcons" src="image/right_icon.png"></a>
							<%} %>
						</section>
					<%}%>
				</div>
				<div id="che_wrap">
					<div id="search_div">
						<select id="search_selec">
							<option>제목</option>
							<option>숙소명</option>
							<option>작성자</option>
						</select>
						<input type="hidden" class="pageInfo" value="<%= nowPage%>">
						<input id="search_box" type="text" placeholder="검 색">
						<img id="review_search_icon" src="image/review_search_icon.png">
					</div>
				</div>
				<div id="wri_bt">
					<button type="button" class="custom-btn btn-5" onclick="location.href='Review_text.jsp?page=<%= nowPage%>'">Review 작성</button>
				</div>
			</div>
	</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>