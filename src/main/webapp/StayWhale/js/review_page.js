$(function(){
	 $("#content_ul > li").click(function() {
		var title = $(this).find("#title").html()
		var user_id = $(this).find("#user_id").html().replace("<br>", "")
		var travellocation = $(this).find("#travellocation").html()
		var avgscore = $(this).find("#avgscore").html()
		var num = $(this).find("#post_num").val()
		var category = $(this).find("#post_category").val()
		var like = $(this).find("#post_like").val()
		var readcount = $(this).find("#post_readcount").val()
		
		location.href="review_title_click.jsp?title=" + title + "&num=" + num + "&readcount=" + readcount;
		
	 });
	  
	 $("#review_search_icon").click(function() {
		var str = $("#search_selec").val();
		
		if(str == "제목") {
			str = "post_title";
		} else if(str == "여행지") {
			str = "post_travel_location";
		} else if(str == "작성자") {
			str = "post_user_id";
		}
	
		if($("#search_box").val() == "") {
			alert("검색하실 내용 입력 후 검색해주세요")
		} else {
			location.href="Bulletin_Board_Review.jsp?val=" + $("#search_box").val() + "&str=" + str;
		}
	 });
});