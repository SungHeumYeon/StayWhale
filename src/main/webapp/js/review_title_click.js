
$(function(){ 
      $("#change_bt").click(function() {
		  	alert("수정완료 후 완료 버튼을 눌러주세요")
		  	var num = $(".content_num").val();
			var id = $(".id_text").val();
			var re_text = $(".txt").val().replace(/(?:\r\n|\r|\n)/g ,"<br>");
			var re_travellocation = $("input[name=travellocation").val();
			var re_title = $(".content_title").val();
			var re_avg = $(".avg_text").val();
			var page = $(".paging").val();
			
			location.href = "review_modify_page2.jsp?page="+page+"&text="+re_text+"&title="+re_title+"&avgscore="+re_avg+"&travellocation="+re_travellocation+"&num="+num;
	  });
	  
	  $('.txt').each(function(){
		  autosize(this);
		}).on('autosize:resized', function(){
		  console.log('textarea height updated');
		});
	  
	  $("#delete_bt").click(function() {
		  var num = $(".content_num").val();
		  if(!confirm("글을 삭제 하시겠습니까?")){
			    alert("취소 되었습니다.");
			} else {
			    location.href="dbprocess/review_delete.jsp?num=" + num;
			}
	  });
	  
	  $(".before_next").click(function() {
		 var title = $(this).val();
		 var readcount = $(this).next().val();
		 var num = $(this).prev().val();
		 var pa = $(".page").val()

		 if(num == 0) {
			 alert("더 이상 확인 하실 글이 없습니다.")
		 } else {
		 	location.href="review_title_click.jsp?title=" + title + "&num=" + num + "&readcount=" + readcount + "&page=" + pa;
		 }
	  });

	$(".file_image_wrap").slick({
		fade : true,
		dots : true,
		autoplay: false,
		prevArrow : "<span class='prevArrow2'><img src='image/left_icon.png'></span>",
		nextArrow : "<span class='nextArrow2'><img src='image/right_icon.png'></span>"
	});
		$(".file_image_wrap").slick("setPosition");
		$(".slick-slider").css("display", "flex");
		$(".slick-slider").css("align-items", "center");
		$(".slick-dots").css("display", "flex");
		$(".slick-dots").css("justify-content", "center");
	  
});