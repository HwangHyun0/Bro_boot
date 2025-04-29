$(function(){
	
	//header 
	function toggleMenu() {
	    if ($(window).width() >= 768) {
	        
	        $('.header .menu').removeClass('on');
	        $('.header .menu_btn').removeClass('on');
	        $('.header').removeClass('on');
	        $('.header .menu > li > .depth2').removeClass('on');
	        
	        $('.header').hover(function() {
	            $(this).addClass('active');
	        }, function() {
	            $(this).removeClass('active');
	        });
	
	        $('.header .menu > li').hover(function() {
	            $(this).children('a').addClass('active');
	        }, function() {
	            $(this).children('a').removeClass('active');
	        });
	
	        $('.header .menu > li .depth2 a').hover(function() {
	            $(this).addClass('active');
	        }, function() {
	            $(this).removeClass('active');
	        });
	
	        $(".header .menu > li > a").siblings('.depth2').css('display', 'flex');
	        
	    } else {
	        $('.header').off('mouseenter mouseleave');
	        $('.header .menu > li').off('mouseenter mouseleave');
	        $('.header .menu > li .depth2 a').off('mouseenter mouseleave');
	        $(".header .menu > li > a").off('click');
	        
	        $(".header .menu > li > a").on('click', function() {
	            var $depth2 = $(this).siblings('.depth2');
	            if ($depth2.hasClass('on')) {
	                $depth2.removeClass('on');
	                $(this).removeClass('on');
	            } else {
	                $('.depth2').removeClass('on');
	                $(".header .menu > li > a").removeClass('on');
	                $depth2.addClass('on');
	                 $(this).addClass('on');
	            }
	        });
	    }
	}
	toggleMenu();
	$(window).resize(function() {
	    toggleMenu(); // resize 시마다 호출
	});
		
	$('.menu_btn').on('click', function(){
		$('.menu').toggleClass('on');
		$(this).toggleClass('on')
		$('.header').toggleClass('on')
	})
	

let totalWidth = 0;
    let currentLeft = 0;
    const pixelsPerSecond = 70;
    let animationDuration;

    function calculateTotalWidth() {
        const $marquee = $('.marquee');
        const $images = $('.marquee .marquee-group');
        totalWidth = 0;

        // 각 이미지 그룹의 너비 계산
        $images.each(function() {
            totalWidth += $(this).outerWidth(true); // margin 포함 너비
		console.log(totalWidth)
        });
        // 마키의 총 너비 설정
        $marquee.width(totalWidth);

        // 애니메이션 시간 재계산
        animationDuration = totalWidth / pixelsPerSecond;
    }

    function startMarquee() {
        const $marquee = $('.marquee');
        let isAnimating = false;
        let remainingDuration;
    
        function animateMarquee() {
            isAnimating = true;
            remainingDuration = (totalWidth / 2 - Math.abs(currentLeft)) / pixelsPerSecond; // 남은 거리에 따라 시간 계산
    
            $marquee.css({ left: currentLeft }); // 현재 위치에서 다시 시작
            $marquee.animate({ left: - totalWidth / 2 }, {
                duration: remainingDuration * 1000, // 남은 거리에 따른 시간
                easing: 'linear',
                step: function(now) {
                    currentLeft = now; // 현재 위치 업데이트
                },
                complete: function() {
                    currentLeft = 0; // 애니메이션이 끝나면 위치 초기화
                    animateMarquee(); // 애니메이션을 다시 시작
                }
            });
        }
    
        animateMarquee(); // 최초 애니메이션 시작
    
        // 마우스 호버 또는 포커스 시 애니메이션 멈춤
        $marquee.on('mouseenter focusin', '.busi_box', function() {
            if (isAnimating) {
                $marquee.stop(); // 애니메이션 정지
                isAnimating = false; // 애니메이션 상태 비활성화
            }
        });
    
        // 마우스가 벗어나거나 포커스 아웃 시 애니메이션 재개
        $marquee.on('mouseleave focusout', '.busi_box', function() {
            if (!isAnimating) {
                animateMarquee(); // 애니메이션 재개
            }
        });
    }
    
     if($('.marquee').length){
        calculateTotalWidth();
        startMarquee();
    }   
    
    $(window).on('resize', function () {


        if($('.marquee').length){
            currentLeft = 0; 
            calculateTotalWidth(); 
            $('.marquee').stop(); 
            startMarquee(); 
        }   

    });
    
    $('.business .con_busi_box + .con_busi_box').slideUp(0)
    $('.business .more_btn').on('click', function(){
		$(this).css('display', 'none')
		$('.business .con_busi_box + .con_busi_box').slideDown(500);
	})
	
	/*$('.main .section01 .cont li a').hover(function(){
		$(this).addClass('on')
	},function(){
		$(this).removeClass('on')
	})*/
	
$('.main .section01 .cont li a').hover(function() {
    var $this = $(this);
$this.addClass('on');
    // 마우스를 올리면 반복적인 setInterval로 on 클래스를 추가하고 제거
    var interval = setInterval(function() {
        $this.addClass('on');  // `on` 클래스 추가
        
        // 6초 후에 `on` 클래스를 제거
        setTimeout(function() {
            $this.removeClass('on'); // `on` 클래스 제거
        }, 5000); // 6초 후에 removeClass('on') 실행
    }, 5500); // 12초마다 (6초 유지 + 6초 후 제거)

    // 마우스를 떼면 interval을 멈추고 `on` 클래스를 바로 제거
    $this.mouseleave(function() {
        clearInterval(interval);  // setInterval 멈추기
        $this.removeClass('on');   // 바로 `on` 클래스 제거
    });

}, function() {
    var $this = $(this);
    $this.removeClass('on'); // 마우스를 떼면 즉시 `on` 클래스 제거
});




    // 푸터 하단 고정
    $(window).on('load resize', function(){    
        $('.wrapper').css({
            paddingBottom : $('.footer').outerHeight(),
        });
    })
});
