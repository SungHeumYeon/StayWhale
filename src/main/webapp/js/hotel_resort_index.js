function search_check() {
	var date = $("#day_Selec").val().split(" ");
	var checkin = date[0]
	var checkout = date[2]
	$("#checkin").val(checkin)
	$("#checkout").val(checkout)
	
	if($("#sido1").val() == "시/도" || $("#gugun1").val() == "구/군" || $("#gugun1").val() == "시/군"){
		alert("지역을 선택해주세요")
		return false
	}
}

$(function() {
	$(document).ready(function() {
		$(".info_list > li").click(function() {
			if($(this).text() == "추천 순") {
				hotelList.sort(function(a, b) {
				    return b.review_count - a.review_count;
				});
				// 정렬된 결과 출력
				var recommen = "";
				hotelList.forEach(function(hotel) {
				    recommen += "<a href='selecHotel.xr?hNum="+hotel.reg_num_h+"&id="+$(".user").val()+"&cin="+$("#checkin").val()+"&cout="+$("#checkout").val()+"'><li>";
					recommen += "<div class='list_image' style='background-image: url(image/" + hotel.acc_picture + "');>"
						recommen += "<div class='content_text_wrap'>"
							recommen += "<div class='info_in_text' id='info_intext1'><span>" + hotel.hotel_grade + "</span></div>"
							recommen += "<div class='info_in_text' id='info_intext2'><span>" + hotel.acc_name + "</span></div>"
							recommen += "<div id='info_intext3'><span>★ " + hotel.rating.toFixed(1) + " (" + hotel.review_count + ")</span></div>"
							recommen += "<div class='info_in_text' id='info_intext4'><span>" + hotel.location + "</span></div>"
							recommen += "<div id='info_intext5'><span>" + hotel.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "</span>원</div>";
						recommen += "</div>"
					recommen += "</div>"
					recommen += "</li></a>"
				});
				$(".info_content > ul").html(recommen)
				
			} else if ($(this).text() == "낮은 가격 순") {
				// price를 오름차순으로 정렬
				hotelList.sort(function(a, b) {
				    return a.price - b.price;
				});
				// 정렬된 결과 출력
				var low = "";
				hotelList.forEach(function(hotel) {
				    low += "<a href='selecHotel.xr?hNum="+hotel.reg_num_h+"&id="+$(".user").val()+"&cin="+$("#checkin").val()+"&cout="+$("#checkout").val()+"'><li>"
					low += "<div class='list_image' style='background-image: url(image/" + hotel.acc_picture + "');>"
						low += "<div class='content_text_wrap'>"
							low += "<div class='info_in_text' id='info_intext1'><span>" + hotel.hotel_grade + "</span></div>"
							low += "<div class='info_in_text' id='info_intext2'><span>" + hotel.acc_name + "</span></div>"
							low += "<div id='info_intext3'><span>★ " + hotel.rating.toFixed(1) + " (" + hotel.review_count + ")</span></div>"
							low += "<div class='info_in_text' id='info_intext4'><span>" + hotel.location + "</span></div>"
							low += "<div id='info_intext5'><span>" + hotel.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "</span>원</div>";
						low += "</div>"
					low += "</div>"
					low += "</li></a>"
				});
				$(".info_content > ul").html(low)
			} else {
				// price를 내림차순으로 정렬
				hotelList.sort(function(a, b) {
				    return b.price - a.price;
				});
				// 정렬된 결과 출력
				var high = "";
				hotelList.forEach(function(hotel) {
					high += "<a href='selecHotel.xr?hNum="+hotel.reg_num_h+"&id="+$(".user").val()+"&cin="+$("#checkin").val()+"&cout="+$("#checkout").val()+"'><li>"
					high += "<div class='list_image' style='background-image: url(image/" + hotel.acc_picture + "');>"
						high += "<div class='content_text_wrap'>"
							high += "<div class='info_in_text' id='info_intext1'><span>" + hotel.hotel_grade + "</span></div>"
							high += "<div class='info_in_text' id='info_intext2'><span>" + hotel.acc_name + "</span></div>"
							high += "<div id='info_intext3'><span>★ " + hotel.rating.toFixed(1) + " (" + hotel.review_count + ")</span></div>"
							high += "<div class='info_in_text' id='info_intext4'><span>" + hotel.location + "</span></div>"
							high += "<div id='info_intext5'><span>" + hotel.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "</span>원</div>";
						high += "</div>"
					high += "</div>"
					high += "</li></a>"
				$(".info_content > ul").html(high)
				});
			}
		});
	});
	
    $(".info_list > li:first-child").find("img").attr("src", "image/recommen_icon_on.png");
    $(".info_list > li:first-child").find("span").css("color", "#006CFA");
    var a = new Date();
    var year = a.getFullYear();
    var month = a.getMonth()+1;
    var date = a.getDate();
	var publicArray = []

    $("#reset_Bt").click(function() {
        $("input[type=checkbox]").prop("checked", false);
        location.href = "hotelPrint.xr";
    });	
	
	$(document).ready(function(){
	    $("input:checkbox[name=detail_check]").change(function(){
	        if($(this).is(":checked") && !publicArray.includes($(this).val())){
	            publicArray.push($(this).val())
	        } else {
	            for(var i=0; i<publicArray.length; i++) {
					if(publicArray[i] === $(this).val()) {
						publicArray.splice(i, 1);
					}
				}
	        }
	        $("#detailHidden").val(publicArray)
	    });
	});
	
    $("#dw").click(function() {
        var val = $("#people_cnt").text();
        $("#people_cnt").html(parseInt(val) -1);
        if(val == 0) {
            $("#people_cnt").html("0");
        }
        $("#people_set").val($("#people_cnt").text()) 
    });
    $("#up").click(function() {
        var val = $("#people_cnt").text();
        $("#people_cnt").html(parseInt(val) +1);
        if(val == 8) {
            $("#people_cnt").html("8");
        }
        $("#people_set").val($("#people_cnt").text())
    });
    
    $("#day_Selec").daterangepicker({
        "autoApply": false,
        "locale": {
            "format": "YYYY-MM-DD",
            "separator": " ~ ",
            "applyLabel": "확인",
            "cancelLabel": "취소",
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
    }, function(start, end, label) {
      console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
    });


    $(".info_list > li").click(function() {
        for(var i=0; i<$(".info_list > li").children().length; i++)
        {
           $(".info_list > li:eq("+i+")").find("span").css("color", "black");
           var resetSrc = $(".info_list > li:eq("+i+")").find("img").attr("src").replace("_on", "");
           $(".info_list > li:eq("+i+")").find("img").attr("src", resetSrc);
        }

        var imgSrc = $(this).find("img").attr("src");
        var newSrc = imgSrc.substring(0, imgSrc.lastIndexOf('.'));
        
        $(this).find("img").attr("src", newSrc + "_on." + /[^.]+$/.exec(imgSrc));
        $(this).find("span").css("color", "#006CFA");
    });

    $(".list_Wrap > ul > li").click(function() {
        var nowimg = $(this).find("img");
        var srcName = nowimg.attr("src");
        var newSrc = srcName.substring(0, srcName.lastIndexOf('.'));

        if($(this).css("background-color") == "rgba(0, 0, 0, 0)") {
			$(this).next().val($(this).find("div").html())
          $(this).find("img").attr("src", newSrc + '_on.' + /[^.]+$/.exec(srcName));
          $(this).css("color", "white");
          $(this).css("background-color", "#006CFA");
        }
        else if ($(this).css("background-color") == "rgb(0, 108, 250)"){
			$(this).next().val("")
          var onSrc = newSrc.slice(0, -3);
          $(this).find("img").attr("src", onSrc + '.' + /[^.]+$/.exec(srcName));
          $(this).css("color", "black");
          $(this).css("background-color", "rgba(0, 0, 0, 0)");
        }
    });
        var $range = $(".js-range-slider"),
        $inputFrom = $(".js-input-from"),
        $inputTo = $(".js-input-to"), instance

    $range.ionRangeSlider({
        skin: "round",
        type: "double",
        min: 0,
        max: 100,
        from: 0,
        to: 60,
        onStart: updateInputs,
        onChange: updateInputs
    });
    instance = $range.data("ionRangeSlider");

    function updateInputs (data) {
      from = data.from;
        to = data.to;
        
        $("#price_left").val(from + "만원");
        $("#price_right").val(to + "만원");
    }

    $inputFrom.on("input", function () {
        var val = $(this).prop("value");
        
        // validate
        if (val < min) {
            val = min;
        } else if (val > to) {
            val = to;
        }
        
        instance.update({
            from: val
        });
    });

    $inputTo.on("input", function () {
        var val = $(this).prop("value");
        
        // validate
        if (val < from) {
            val = from;
        } else if (val > max) {
            val = max;
        }
        
        instance.update({
            to: val
        });
    });

    $('document').ready(function() {
      var area0 = ["시/도","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
      var area1 = ["구/군","강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
      var area2 = ["구/군","계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
      var area3 = ["구/군","대덕구","동구","서구","유성구","중구"];
      var area4 = ["구/군","광산구","남구","동구","북구","서구"];
      var area5 = ["구/군","남구","달서구","동구","북구","서구","수성구","중구","달성군"];
      var area6 = ["구/군","남구","동구","북구","중구","울주군"];
      var area7 = ["구/군","강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
      var area8 = ["시/군","고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
      var area9 = ["시/군","강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
      var area10 = ["시/군","제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
      var area11 = ["시/군","계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
      var area12 = ["시/군","군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
      var area13 = ["시/군","광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
      var area14 = ["시/군","경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
      var area15 = ["시/군","거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
      var area16 = ["시/군","서귀포시","제주시","남제주군","북제주군"];

     // 시/도 선택 박스 초기화
     $("select[name^=sido]").each(function() {
      $selsido = $(this);
      $.each(eval(area0), function() {
       $selsido.append("<option value='"+this+"'>"+this+"</option>");
      });
      $selsido.next().append("<option value=''>구/군</option>");
     });

     // 시/도 선택시 구/군 설정
     $("select[name^=sido]").change(function() {
      var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
      var $gugun = $(this).next(); // 선택영역 군구 객체
      $("option",$gugun).remove(); // 구군 초기화

      if(area == "area0")
       $gugun.append("<option value=''>구/군 선택</option>");
      else {
       $.each(eval(area), function() {
        $gugun.append("<option value='"+this+"'>"+this+"</option>");
        });
        }
       });
    });
});
