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
			$(".likeicon").attr("src","image/like_icon.png")
			$(".like_text").html("찜 해제하기")
			$("#top_info_right").load(location.href + " #top_info_right");
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
			$(".likeicon").attr("src","image/unlike_icon.png")
			$(".like_text").html("찜하기")
			$("#top_info_right").load(location.href + " #top_info_right");
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
		if($(this).css("color") == "rgb(0, 108, 250)") {		} 
		else {
			$(this).toggleClass("active");
			$(this).siblings().removeClass("active")
		}
		if($(this).children("span").text() == "숙소정보") {
			if ($(".review_image_slick").hasClass("slick-initialized")) {
			    $(".review_image_slick").slick("unslick");
			    $(".center_calen_wrap").css("display", "none")
				$(".ajax").css("display", "none")
				$(".hotel_info_wrap").css("display", "block")
				$(".hotel_review_wrap").css("display", "none")
			} else {
				$(".center_calen_wrap").css("display", "none")
				$(".ajax").css("display", "none")
				$(".hotel_info_wrap").css("display", "block")
				$(".hotel_review_wrap").css("display", "none")
			}
		} else if($(this).children("span").text() == "객실안내") {
			if ($(".review_image_slick").hasClass("slick-initialized")) {
				$(".review_image_slick").slick("unslick");
				$(".center_calen_wrap").css("display", "block")
				$(".ajax").css("display", "block")
				$(".hotel_info_wrap").css("display", "none")
				$(".hotel_review_wrap").css("display", "none")
			} else {
				$(".center_calen_wrap").css("display", "block")
				$(".ajax").css("display", "block")
				$(".hotel_info_wrap").css("display", "none")
				$(".hotel_review_wrap").css("display", "none")
			}
		} else if($(this).children("span").text() == "Review") {
			autosize($("textarea"));
			$("textarea").css("height","auto");
			$(".hotel_review_wrap").css("display", "block")
			$(".ajax").css("display", "none")
			$(".hotel_info_wrap").css("display", "none")
			$(".center_calen_wrap").css("display", "none")
			
			autosize.update($("textarea")); // autosize 업데이트

			if($(".review_image_slick").hasClass("slick-initialized") == false) {
				$(".review_image_slick").slick({
						fade : true,
						dots : true,
						autoplay : false,
    					arrows : false
				});
				$(".slick-slider").css("display", "flex");
				$(".slick-slider").css("justify-content", "center");
				$(".slick-dots").css("display", "flex");
				$(".slick-dots").css("justify-content", "center");
			}
		}
    });
    
	
	$(".button").click(function() {
		if($("#cin").val() == $("#cout").val()) {
			alert("이용 하실 날짜를 선택해주세요")
			return false;
		}
	});
	
	$(document).ready(function() {
	  $(".hotel_info_wrap button").click(function() {
	    // 모든 div 숨기기
	    $(".hotel_info_wrap div").hide();
	    // 클릭한 버튼의 다음 div 요소 보이기
	    $(this).next("div").show();
	  });
	});

	
	$(".roomDetail").click(function() {
		$(this).next().show();
	});
	$(".modalClose").click(function() {
		$('.modal').hide();
	});
	
	$(".roomImageMoreWrap").hide()
	$(".roomMore").click(function() {
		var roomImageMoreWrap = $(this).closest('.bot_info_wrap').next('.roomImageMoreWrap');
	    var moreImage = roomImageMoreWrap.find('.moreImage');
	    
	    if(roomImageMoreWrap.css("display") === "none") {
			roomImageMoreWrap.show();
			$(moreImage).slick({
				dots : true,
				autoplay: false,
				prevArrow : "<span class='prevArrow2'><img src='image/left_icon.png'></span>",
		  		nextArrow : "<span class='nextArrow2'><img src='image/right_icon.png'></span>"
			});
			$(moreImage).slick("setPosition");
			$(".slick-slider").css("display", "flex");
			$(".slick-slider").css("justify-content", "center");
			$(".slick-slider").css("align-items", "center");
			$(".slick-dots").css("display", "flex");
			$(".slick-dots").css("justify-content", "center");
		} else {
			$(moreImage).slick('unslick');
			roomImageMoreWrap.hide();
		}
	});
	$(".closeBt").click(function() {
	    var roomImageMoreWrap = $(this).parent().parent();
	    var moreImage = $(this).closest('.roomImageMoreWrap').find('.moreImage');

	    roomImageMoreWrap.hide();
	    $(moreImage).slick('unslick');
	});
	
	var initialChange = true;
	$("#day_Selec").on("change", function() {	
		if (initialChange) {
	        initialChange = false;
	        return;
	    }
		
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
			  url: "roomSearch.xr",
			  type: "POST",
			  dataType: "JSON",
			  contentType: "application/json; charset=utf-8",
			  data: JSON.stringify(info),
			  success: function (data) {
				var nullHtml = "";
			    console.log(data);
			    if (data == "") {
					nullHtml += "<div class='nullHtmlWrap'>"
					nullHtml += "<div class='nullHtml'>"
					nullHtml += "<div class='nullHtmlImage'><img src='image/roomnull_icon.png'></div>"
					nullHtml += "해당기간에는 예약가능한 객실이 없습니다"
					nullHtml += "<div class='nullMent'>날짜를 다시 선택해주시길 바랍니다</div></div></div>"
					
					$(".ajax").html(nullHtml);
			    }
				else {
				    var txt = "";
				    for (var i = 0; i < data.length; i++) {
				      txt += data[i].room_picture + ",/";
				    }
				    var roomList = txt.split(",/");
				    var html = "";
				
				    for (var i = 0; i < data.length; i++) {
				      html += "<div class='bot_info_wrap'><div class='bot_info_box'><ul>";
				      var imageUrl = roomList[i].split(",");
				      for (var x = 0; x < imageUrl.length; x++) {
				        html += "<li class='bot_photo' style='background-image: url(image/" + imageUrl[x] + ")'><image src='image/image_more.png' class='roomMore'></li>";
				      }
				      html += "<li class='bot_name'>" + data[i].room_name + "</li>";
				      html += "<li class='bot_price'>가격</li>";
				      	var price = parseFloat(data[i].price.replace(/\B(?=(\d{3})+(?!\d))/g, ''));
						var daysDifference = parseInt(data[0].daysDifference);
						if (!isNaN(price) && !isNaN(daysDifference)) {
						  var totalPrice = price * daysDifference;
						  html += "<li class='bot_won'><span class='dayCount'>" + data[0].daysDifference + "박</span>" + totalPrice.toLocaleString() + "원</li>";
						} else {
						  html += "<li class='bot_won'>가격 정보를 가져올 수 없습니다.</li>";
						}
				      html += "<div class='roomDetail'>"
				      html += "<li class='bot_roominfo'>객실 상세 정보 확인</li>";
				      html += "<li class='bot_roominfobt'>></li>";
				      html += "</div>";
				      html += "<div class='modal'>";
				      html += "<div class='modal-content'>";
				      html += "<div class='detailTitle'><h2>객실 이용 안내<h2></div>"
				      html += "<div class='detailTxt'><h3>편의시설</h3>"
				      html += data[i].room_detail;
				      html += "</div>";
				      html += "<div class='detailInfo'><h3>기본정보</h3>";
				      html += "객실 타입 : "+data[i].room_type+"<br>";
				      html += "기준 인원 : "+data[i].standard_amount+"명<br>";
				      html += "침대 타입 : "+data[i].stay_type;
				      html += "</div>"
				      html += "<div class='modalClose'><span> 닫기 </span></div>";
				      html += "</div></div>";
				      html += "<input type='hidden' id='roomNum' value='"+data[i].room_num+"'>"
				      html += "<li class='bot_resev'><div class='button'><p class='btnText'>예약하기</p><div class='btnTwo'><p class='btnText2'>GO!</p></div></div></li></ul></div></div>";
				      html += "<div class='roomImageMoreWrap'>";
				      html += "<div class='closeIconWrap'><img src='image/close_icon.png' class='closeBt'></div>";
				      html += "<div class='moreImage'>";
				      for (var v = 0; v < imageUrl.length; v++) {
				        html += "<div class='images'><img src='image/" + imageUrl[v] + "'></div>";
				      }
				      html += "</div></div>";
				      $(".ajax").html(html);
				    }
			    }
			    $(".roomImageMoreWrap").hide();
			    // 이벤트 핸들러 등록
			    $(".roomMore").click(function () {
			      var roomImageMoreWrap = $(this).closest('.bot_info_wrap').next('.roomImageMoreWrap');
			      var moreImage = roomImageMoreWrap.find('.moreImage');
			
			      if (roomImageMoreWrap.css("display") === "none") {
						roomImageMoreWrap.show();
				        moreImage.slick({
							dots : true,
					        autoplay: false,
					        prevArrow: "<span class='prevArrow2'><img src='image/left_icon.png'></span>",
					        nextArrow: "<span class='nextArrow2'><img src='image/right_icon.png'></span>"
			        });
			        moreImage.slick("setPosition");
			        $(".slick-slider").css("display", "flex");
					$(".slick-slider").css("justify-content", "center");
					$(".slick-slider").css("align-items", "center");
					$(".slick-dots").css("display", "flex");
					$(".slick-dots").css("justify-content", "center");
			      } else {
			        roomImageMoreWrap.hide();
			        moreImage.slick('unslick');
			      }
			    });
			    $(".closeBt").click(function () {
			      var roomImageMoreWrap = $(this).parent().parent();
			      var moreImage = roomImageMoreWrap.find('.moreImage');
			
			      roomImageMoreWrap.hide();
			      moreImage.slick('unslick');
			    });
			    
			    $(".roomDetail").click(function() {
					$(this).next().show();
				});
				$(".modalClose").click(function() {
					$('.modal').hide();
				});
				
				$(".button").click(function() {
					var roomNum = $(this).closest(".bot_resev").siblings("#roomNum").val();
					if($("#cin").val() == $("#cout").val()) {
						alert("이용 하실 날짜를 선택해주세요")
						return false;
					} else if($("#id").val() == "null") {
						alert("로그인을 먼저 해주세요")
						location.href = "Login.jsp"
					} else {
					  	if(!confirm("해당 객실로 예약하시겠습니까?")){
						    alert("취소 되었습니다.");
						} else {
						    location.href = "hotelReserve.xr?hNum="+$("#hnum").val()+"&cin="+$("#cin").val()+"&cout="+$("#cout").val()+"&rNum="+roomNum+"&uid="+$("#id").val()
						}
					}
				});
				
			  },
			});
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