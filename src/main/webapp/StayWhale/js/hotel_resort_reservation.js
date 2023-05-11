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
	$("#day_Selec").change(function() {
		var date = $("#day_Selec").val().split(" ");
		$("#cin").val(date[0])
		$("#cout").val(date[2])

		var info = {
			"cin": $("#cin").val(),
			"cout": $("#cout").val(),
			"hnum": $("#hnum").val()
		};
		
		if(info.cin != info.cout) {
			$.ajax({
				url : "roomSearch.xr",
				type : "POST",
				dataType : "JSON",
				contentType: "application/json; charset=utf-8",
				data : JSON.stringify(info),
				success : function(data){
					console.log(data)
					var txt = "";
					for(var i=0; i<data.length; i++) {
						txt += data[i].room_picture + ",/";
					}
					var roomList = txt.split(",/");					
					var html = "";
					
					for (var i=0; i<data.length; i++) {
						html += "<div class='bot_info_wrap'><div class='bot_info_box'><ul>";
			            var imageUrl = roomList[i].split(",");
		                for(var x=0; x<imageUrl.length; x++) {
							html += "<li class='bot_photo' style='background-image: url(image/"+imageUrl[x]+")'></li>";
						}
			            html += "<li class='bot_name'>" + data[i].room_name + "</li>";
			            html += "<li class='bot_price'>가격</li>";
			            html += "<li class='bot_won'>" + data[i].price.replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원</li>";
			            html += "<li class='bot_roominfo'>객실 상세 정보 확인</li>";
			            html += "<li class='bot_roominfobt'>></li>";
			            html += "<li class='bot_resev'>예약하기</li></ul></div></div>";
			            $(".ajax").html(html);
		            }
				},
				error :function(error) {
					console.log(error)
				}
			});
		}
	});
	
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
		if($(this).css("color") == "rgb(0, 108, 250)") {		} 
		else {
			$(this).toggleClass("active");
			$(this).siblings().removeClass("active")
		}
		if($(this).children("span").text() == "숙소정보") {
			$(".center_calen_wrap").css("display", "none")
			$(".ajax").css("display", "none")
			$(".hotel_info_wrap").css("display", "block")
		} else if($(this).children("span").text() == "객실안내") {
			$(".center_calen_wrap").css("display", "block")
			$(".ajax").css("display", "block")
			$(".hotel_info_wrap").css("display", "none")
			
		}
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