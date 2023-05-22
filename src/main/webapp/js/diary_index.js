$(function(){
      
    });

$(function(){
	var slide = $("#bottom_frame > ul");
	$("#region1").click(function(){		
		slide.eq(0).css("opacity","1");
		slide.eq(1).css("opacity","0");
		slide.eq(2).css("opacity","0");
		slide.eq(3).css("opacity","0");
	});
	$("#region2").click(function(){		
		slide.eq(0).css("opacity","0");
		slide.eq(1).css("opacity","1");
		slide.eq(2).css("opacity","0");
		slide.eq(3).css("opacity","0");
	});
	$("#region3").click(function(){		
		slide.eq(0).css("opacity","0");
		slide.eq(1).css("opacity","0");
		slide.eq(2).css("opacity","1");
		slide.eq(3).css("opacity","0");
	});
	$("#region4").click(function(){		
		slide.eq(0).css("opacity","0");
		slide.eq(1).css("opacity","0");
		slide.eq(2).css("opacity","0");
		slide.eq(3).css("opacity","1");
	});

	$("input[type=button]").mouseenter(function(){
		$(this).css("background-color", "black");
	});
	$("input[type=button]").mouseleave(function(){
		$(this).css("background-color", "#333");	
	});

	var slide2 = $(".background");
	var currentIndex = 0;
	var slideCount = slide2.length;


	slide2.eq(currentIndex).css("opacity","1");

	setInterval(function(){
		slide2.eq(currentIndex).css("opacity","0");
		slide2.eq(currentIndex).css("transition","opacity 1s ease-in-out");

		currentIndex = (currentIndex+1)%slideCount;

		slide2.eq(currentIndex).css("opacity","1");
		slide2.eq(currentIndex).css("transition","opacity 1s ease-in-out");


	},3000);

	$("#button_left").mousedown(function(){    // 슬라이드 방향버튼 호버효과 == 이미지 교체 
		var nowImg = $(this).find("img")
		var nowSrc = nowImg.attr("src");
		var Src = nowSrc.substring(0,nowSrc.lastIndexOf("_"));
		nowImg.attr("src", Src+"_left_click.png");	

	});
	
	$("#button_left").mouseup(function(){
		var nowImg = $(this).find("img")
		var nowSrc = nowImg.attr("src");
		var Src = nowSrc.substring(0,nowSrc.lastIndexOf("_"));
		nowImg.attr("src", Src+".png");	

	});

	$("#button_right").mousedown(function(){
		var nowImg = $(this).find("img")
		var nowSrc = nowImg.attr("src");
		var Src = nowSrc.substring(0,nowSrc.lastIndexOf("_"));
		nowImg.attr("src", Src+"_right_click.png");	

	});
	
	$("#button_right").mouseup(function(){
		var nowImg = $(this).find("img")
		var nowSrc = nowImg.attr("src");
		var Src = nowSrc.substring(0,nowSrc.lastIndexOf("_"));
		nowImg.attr("src", Src+".png");	

	});

	

	
	var slides = $("#slide_list");
	var first_li = $("#slide_list >li").first();
	var first_width = first_li.outerWidth(true);
	var first_clone =first_li.clone(true);
	var prot =0;// 광클 금지 (0== 허용, 1== 금지)  타임아웃을 이용하여  광클릭시 계속 실행되는 것을 막음.


	$("#button_right").click(function(){	// 슬라이드 버튼 클릭시 슬라이드 이동 ( 왼쪽 , 오른쪽 )
		if (prot === 1) return false;
    		prot = 1;
		

		slides.animate(                     // 무한 슬라이드 효과 원리는 슬라이드의 1) 프레임에서 보여줄 크기를 정하고 overflow hidden
		{left: "-=" + first_width + "px"},400,    // 2) Ul자체를 오른쪽 또는 왼쪽으로 이동 3) 첫<li>요소를 맨뒤로 계속 보냄.
		function()
		{
			slides.append($("#slide_list > li:first-child")).css({left:0});
			}
		
		);

		 setTimeout(function(){prot = 0;}, 500);

	
	});
		


		$("#button_left").click(function(){
			if (prot === 1) return false;
    		prot = 1;
			
			slides.prepend($("#slide_list > li:last-child")).css({left: -first_width});
			slides.animate({
			left: "+=" + first_width + "px"
		});
			setTimeout(function(){prot = 0;}, 500);
	
	});



		function interval(){  // 자동슬라이드 구현 
			slides.animate(
		 	{left: "-=" + first_width + "px"},400, 
		 	function(){slides.append($("#slide_list > li:first-child")).css({left:0});});
		}

		

		var auto_slide = setInterval(interval, 5000);

		$("#slide_list").mouseenter(function(){   // 마우스 enter시 자동슬라이드 멈춤
			auto_slide =clearInterval(auto_slide);

		});
		$("#slide_list").mouseleave(function(){
			auto_slide = setInterval(interval,5000);

		});



		});

var didScroll; 
var delta = 5; // 이벤트가 발생했을때 이전과 현재 스크롤의 위치 차이를 비교하기 위한 변수
var lastScrolled = 0; // 초기위치 +  스크롤이 이동할때마다 위치를 기록함.
var navbarHeight = $("header").outerHeight()+50; // outerHeight == 내부높이 +padding + border이다. 
$(window).scroll(function(event){
    didScroll = true;     // 마우스 스크롤이 들어왔을때 임의의 변수를 true;로 초기화.
});

setInterval(function(){
	if(didScroll){   //스크롤이 들어오면 true이므로, if 이하문장 실행.
		hasScrolled();  // 스크롤이 들어오면 실행. 
		didScroll = false;      
	}

},1000)



function hasScrolled(){
	var st  = $(this).scrollTop();  // $(this).scrollTop()는 현재 이벤트가 발생한 요소의 스크롤바가 수직으로 얼마나 떨어져 있는지를 나타냄.(이동 후 수치)



	if(Math.abs(lastScrolled - st) <= delta){ 	// 이전위치와 현재위치의 차이를 비교하고   delta(5)보다 작을때에는 이벤트가 발생하지 않도록.
		return; 	 	//return 구문을 사용하는 이유는, if문 내의 조건식이 false인 경우에는 이후의 코드를 실행하지 않아도 되기 때문이다 따라서, return 구문을 사용하여 함수를 종료함으로써 코드 실행 효율을 높일 수 있다.
	}

	if(st > lastScrolled && st > navbarHeight ){
		$("#active_bar").css({opacity:1, transition:"opacity 0.2s ease-in-out"});
		$("#active_bar" ).css("z-index", "995");
		$("#menu_bar2").css("z-index", "999");
		setTimeout(function(){
			$("#active_bar").css({opacity:0, transition:"opacity 0.2s ease-in-out"});
			$("#menu_bar2").css("z-index", "910");
			$("#active_bar").css("z-index", "910");
		},5000);

		
	}else{   // 스크롤업 ( st < lastScrolled)

		if(st+$(window).height() < $(document).height()){
			$("#active_bar").css({opacity:1, transition:"opacity 0.2s ease-in-out"});
			$("#active_bar").css("z-index", "995");
			$("#menu_bar2").css("z-index", "999");

			setTimeout(function(){
				$("#active_bar").css({opacity:0, transition:"opacity 0.2s ease-in-out"});
				$("#menu_bar2").css("z-index", "910");
				$("#active_bar").css("z-index", "910");
			},5000);
		}
	}

	lastScrolled = st; 
}


$(function(){    // 상단 네비게이션바 및 엑티브바  마우스 호버효과

	$("#menu_bar> li").each(function(){
		$(this).mouseenter(function(){
			$(this).css("text-decoration","underline");
			$(this).css("text-decoration","text-underline-position:under");
			$(this).css("font-size", "20px")
		});

		$(this).mouseleave(function(){
			$(this).css("text-decoration","none");
			$(this).css("font-size", "15px");

		});


	});

	$("#menu_bar2 li").each(function(){
		$(this).mouseenter(function(){
			$(this).css("text-decoration","underline");
			$(this).css("text-decoration","text-underline-position:under");
			$(this).css("font-size", "20px")
		});
		$(this).mouseleave(function(){
			$(this).css("text-decoration","none");
			$(this).css("font-size", "15px");

		});


		});


});


