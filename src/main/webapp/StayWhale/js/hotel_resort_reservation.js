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
				alert(data)
			}
		});
		}
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