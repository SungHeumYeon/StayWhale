function openCloseToc() {
    if(document.getElementById('toc-content').style.display === 'block') {
      document.getElementById('toc-content').style.display = 'none';
      document.getElementById('event_wrap').style.display = 'block';
      document.getElementById('toc-toggle').textContent = '펼치기';
    } else {
      document.getElementById('toc-content').style.display = 'block';
      document.getElementById('event_wrap').style.display = 'none';
      document.getElementById('toc-toggle').textContent = '숨기기';
    }
  }

function like(id, hotelNum) {
		if(id == "null") {
			alert("로그인을 먼저 해주세요")
		} else {
			$.ajax({
			url : "likeCheck.xr",
			type : "POST",
			data : {id: id, hotelNum: hotelNum},
			success : function(data){
				$("#top_info_right").load(location.href + " #top_info_right");
				$(".likeicon").attr("src","image/like_icon.png")
				$(".like_text").html("찜 해제하기")
			}
		});
		}
	}
function unLike(id, hotelNum) {
		if(id == "null") {
			alert("로그인을 먼저 해주세요")
		} else {
			$.ajax({
			url : "unLikeCheck.xr",
			type : "POST",
			data : {id: id, hotelNum: hotelNum},
			success : function(data){
				$("#top_info_right").load(location.href + " #top_info_right");
				$(".likeicon").attr("src","image/unlike_icon.png")
				$(".like_text").html("찜하기")
			}
		});
		}
	}

$(function(){
	$(".on").first().addClass("active")
	 $('.slider-for').slick({
		slidesToShow: 1,
		slidesToScroll: 1,
		arrows: false,
		fade: true,
		asNavFor: '.slider-nav',
		autoplay: true,
		autoplaySpeed : 2000,
		pauseOnHover : true
	});
	$('.slider-nav').slick({
		slidesToShow: 3,
		slidesToScroll: 1,
		asNavFor: '.slider-for',
		dots: false,
		centerMode: true,
		focusOnSelect: true,
		prevArrow : $('.prevArrow'), 
  		nextArrow : $('.nextArrow')
	});
	$(".on").click(function(){
       $(this).toggleClass("active");
       $(this).siblings().removeClass("active")
    });
    
    var a = new Date();
    var year = a.getFullYear();
    var month = a.getMonth()+1;
    var date = a.getDate();
    $("#day_Selec").daterangepicker({
        "autoApply": true,
        "autoUpdateInput": true,
        "locale": {
            "format": "YYYY-MM-DD",
            "separator": " ~ ",
            "fromLabel": "From",
            "toLabel": "To",
            "customRangeLabel": "Custom",
            "weekLabel": "W",
            "font-size": "40",
            "daysOfWeek": [
                "일",
                "월",
                "화",
                "수",
                "목",
                "금",
                "토"
            ],
            "monthNames": [
                "1월",
                "2월",
                "3월",
                "4월",
                "5월",
                "6월",
                "7월",
                "8월",
                "9월",
                "10월",
                "11월",
                "12월"
            ],
        },
        "minDate": year + '-' + month + '-' + date,
    });
});