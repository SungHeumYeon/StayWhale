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
	alert("좋아요")
		/*if(id == "null") {
			alert("로그인을 먼저 해주세요")
		} else {
			$.ajax({
			url : "likeCheck.xr",
			type : "POST",
			data : {id: id, hotelNum: hotelNum},
			success : function(data){
				$(".likeCheck").prop("href", "unLikeCheck.xr")
				$(".likeicon").attr("src","image/like_icon.png")
				$(".like_text").html("찜 해제하기")
			}
		});
		}*/
	}
function unLike(id, hotelNum) {
	alert("좋아요 해제")
		/*if(id == "null") {
			alert("로그인을 먼저 해주세요")
		} else {
			$.ajax({
			url : "unLikeCheck.xr",
			type : "POST",
			data : {id: id, hotelNum: hotelNum},
			success : function(data){
				$(".likeCheck").prop("href", "likeCheck.xr")
				$(".likeicon").attr("src","image/unlike_icon.png")
				$(".like_text").html("찜하기")
			}
		});
		}*/
	}

$(function(){
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
});