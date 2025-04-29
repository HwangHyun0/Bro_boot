<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ include file="../inc/header.jsp" %>
	
	<div class="contents">

		<!-- ABOUT BG -->
		<div class="bg_wrap evt">
		    <div class="wrap">
		        <div class="tit_wrap">
		            <h2 class="tit02">ABOUT</h2>
		        </div>
		    </div>
		    <div class="video_box">
			    <!-- <figure class="bg">
			        <img src="../images/img_bg_carrers.png">
			    </figure> -->
			    <div class="video_mask"></div>
			    <video src="${pageContext.request.contextPath }/images/about.mp4" muted autoplay loop playsinline></video>
			</div>
		</div>
		<!-- //ABOUT BG -->
		
		<!-- ABOUT 01 -->
		<div class="content_wrap about">
		    <div class="wrap">
		        <div class="layout_wrap evt">
		            <div class="left">
		                <h3 class="tit04">Our <br>Values</h3>
		            </div>
		            <div class="right">
		                <p class="txt">
		                    앤더블유는
		                    너와 나, 고객과 사용자, 사람과 AI의 관계에서
		                    소통의 철학과 몰입의 태도로 
		                    한걸음 더 나가고자 합니다. 
		                </p>
		            </div>
		        </div>
		        <div class="layout_wrap evt">
		            <div class="left">
		                <h3 class="tit04">Our <br>Business</h3>
		            </div>
		            <div class="right">
		                <p class="txt">
		                    새롭게 출시되는 서비스와 콘텐츠를
		                    새로운 가치(New Trend)로써 고객에게 전달하기 위해 
		                    사용자의 경험을 구현하고 소통하게 만드는 일, 
		                    이것이 앤더블유가 하는 일입니다.
		                </p>
		                <!-- Swiper -->
		                <div class="about_business">
		                    <!-- Add Arrows -->
		                    <div class="swiper-button">
		                        <button class="swiper-button-prev"><i class="ico_prev"><span class="blind">이전</span></i></button>
		                        <button class="swiper-button-next"><i class="ico_next"><span class="blind">다음</span></i></button>
		                    </div>
		                    <div class="swiper-container">
		                        <div class="swiper-wrapper">
		                            <div class="swiper-slide">
		                                <div class="item">
		                                    <p>UI/UX Service</p>
		                                    <ul>
		                                        <li><strong>UI/UX Consulting</strong><span>UI/UX 방법론을 통한 컨설팅 서비스 제공</span></li>
		                                        <li><strong>UI/UX Design</strong><span>사용자 편의와 경험을 생각한 디자인 구현</span></li>
		                                        <li><strong>Responsive Design</strong><span>다양한 디바이스에서 적용가능한 반응형 디자인 구현</span></li>
		                                    </ul>
		                                </div>
		                            </div>
		                            <div class="swiper-slide">
		                                <div class="item">
		                                    <p>Solution Development</p>
		                                    <ul>
		                                        <li><strong>Web Standards</strong><span>웹표준 준수로 웹 접근성 마크 획득</span></li>
		                                        <li><strong>Solution Selling</strong><span>솔루션 시스템의 업무화면 가이드 및 템플릿 제공</span></li>
		                                    </ul>
		                                </div>
		                            </div>
		                            <div class="swiper-slide">
		                                <div class="item">
		                                    <p>Experience</p>
		                                    <ul>
		                                        <li><strong>Medical system <br>platform service</strong><span>일반적인 업무와 다른 특수 의료 시스템 플랫폼 서비스 제공</span></li>
		                                    </ul>
		                                </div>
		                            </div>
		                            <div class="swiper-slide">
		                                <div class="item">
		                                    <p>Major Business</p>
		                                    <ul>
		                                        <li><strong>Wellness <br>Healthcare <br>platform building</strong><span>웰니스를 기반으로 건강진단 및 매일체크 가능한 헬스케어 플랫폼 사업 확장</span></li>
		                                    </ul>
		                                </div>
		                            </div>
		                        </div>
		                    </div>                            
		                </div>
		            </div>
		        </div>
		        <div class="layout_wrap evt">
		            <div class="left">
		                <h3 class="tit04">Welfare <br>Process</h3>
		            </div>
		            <div class="right">
		                <p class="txt">
		                    좋은 디자인을 좋은 
		                    서비스로 편리하게,
		                    앤더블유는 좋은 사용자  
		                    경험을 구현하는 
		                    4가지 체계적인 단계를 
		                    가지고 있습니다.  
		                </p>
		                <ul class="step_box evt list">
		                    <li class="icon01">
		                        <div class="step_tit">Step.1 분석</div>
		                        <div class="step_sub">Analysis</div>
		                        <div class="step_txt">사용자들의 환경과 행동패턴을 관찰하여 트렌드를 분석</div>
		                    </li>
		                    <li class="icon02">
		                        <div class="step_tit">Step.2 설계</div>
		                        <div class="step_sub">Design</div>
		                        <div class="step_txt">현재 서비스 환경에서 문제점을 찾아내고 개선할 수 있는 부분을 추출하여 더나은 서비스를 정의</div>
		                    </li>
		                    <li class="icon03">
		                        <div class="step_tit">Step.3 개발</div>
		                        <div class="step_sub">Development</div>
		                        <div class="step_txt">프로토타입을 구체화하여 최적으로 상호작용을 할 수 있는 트렌드에 맞춘 표준화 된 기술 구현 </div>
		                    </li>
		                    <li class="icon04">
		                        <div class="step_tit">Step.4 품질관리</div>
		                        <div class="step_sub">Quality <br>Managementsis</div>
		                        <div class="step_txt">실서비스를 시뮬레이터 테스트와 프로그램 안정성 확보를 통해 최상의 품질로 사용자에게 제공</div>
		                    </li>
		                </ul>
		            </div>
		        </div>
		    </div>
		</div>
		<!-- //ABOUT 01 -->
		
		<!-- history -->
		<div class="content_wrap history txt_move">
		    <div class="wrap">
		        <div class="layout_wrap evt">
		            <div class="left">
		                <h3 class="tit04">Our<br>History</h3>
		                <div class="swiper-button">
		                    <button class="swiper-button-prev"><i class="ico_prev"><span class="blind">이전</span></i></button>
		                    <button class="swiper-button-next"><i class="ico_next"><span class="blind">다음</span></i></button>
		                </div>
		            </div>
		            <div class="right">
		                <!-- Swiper -->
		                <div class="about_history">
		                    <!-- Add Arrows -->
		                    <div class="swiper-container">
		                        <div class="swiper-wrapper">
		                            <div class="swiper-slide">
		                                <div class="item">
		                                    <p>2021</p>
		                                    <ul>
		                                    	<li>
		                                            <strong>09</strong>
		                                            <span>건강 관리 장치 및 이의 동작 방법 특허 등록</span>
		                                        </li>
		                                    	<li>
		                                            <strong>07</strong>
		                                            <span>(주)나이스디앤비 우수기술기업인증 (등급:B0)</span>
		                                        </li>
		                                        <li>
		                                            <strong>03</strong>
		                                            <span>중소벤처기업진흥공단 '고성장촉진자금' R&D사업 선정</span>
		                                        </li>
		                                        <li>
		                                            <strong>02</strong>
		                                            <span>한국벤처투자(주) 창업지원 연계투자 투자유치</span>
		                                        </li>
		                                    </ul>
		                                </div>
		                            </div>
		                            <div class="swiper-slide">
                                        <div class="item">
                                            <p>2020</p>
                                            <ul>
                                                <li>
                                                    <strong>12</strong>
                                                    <span>㈜나이스디앤비 우수기술기업 인증서 획득(등급:B-)</span>
                                                </li>
                                                <li>
                                                    <strong>05</strong>
                                                    <span>중소벤처기업진흥공단 '창업도약패키지' R&D사업 선정</span>
                                                </li>
                                                <li>
                                                    <strong>03</strong>
                                                    <span>중소벤처기업진흥공단 '일자리창출촉진' R&D사업 선정</span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="item">
                                            <p>2019</p>
                                            <ul>
                                                <li>
                                                    <strong>11</strong>
                                                    <span>'창업도약패키지' 사업화 매출부문 총장상 수상(주관:인덕대학교)</span>
                                                </li>
                                                <li>
                                                    <strong>06</strong>
                                                    <span>중소벤처기업진흥공단 '초기창업패키지' R&D사업 선정</span>
                                                </li>
                                                <li>
                                                    <strong>02</strong>
                                                    <span>기업부설연구소 설립</span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="item">
                                            <p>2018</p>
                                            <ul>
                                                <li>
                                                    <strong>11</strong>
                                                    <span>건강관리장치 및 이의동작방법 특허 출원</span>
                                                </li>
                                                <li>
                                                    <strong>08</strong>
                                                    <span>기술보증기금 R&D 벤처기업 인증</span>
                                                </li>
                                                <li>
                                                    <strong>03</strong>
                                                    <span>산업디자인전문회사, 소프트웨어 사업자 신고증명서 획득</span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="item">
                                            <p>2016</p>
                                            <ul>
                                                <li>
                                                    <strong>07</strong>
                                                    <span>㈜앤더블유 법인 설립 (여성기업 인증)</span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>                            
                        </div>
                    </div>
                </div>
                <div class="bg_txt row_right">SINCE 2016</div>
		    </div>
		</div>
		<!-- //history -->
		
		<!-- partners -->
		<div class="content_wrap partners evt txt_move">
		    <div class="wrap">
		        <div class="layout_wrap evt">
		            <div class="left">
		                <h3 class="tit04">Our<br>Partners</h3>
		            </div>
		            <div class="right">
		                <ul class="evt list">
		                   <li><img src="../images/partner01.png"></li> 
		                   <li><img src="../images/partner02.png"></li> 
		                   <li><img src="../images/partner03.png"></li> 
		                   <li><img src="../images/partner04.png"></li> 
		                   <li><img src="../images/partner05.png"></li> 
		                   <li><img src="../images/partner06.png"></li> 
		                   <li><img src="../images/partner07.png"></li> 
		                   <li><img src="../images/partner08.png"></li> 
		                   <li><img src="../images/partner09.png"></li> 
		                   <li><img src="../images/partner10.png"></li> 
		                   <li><img src="../images/partner11.png"></li> 
		                   <li><img src="../images/partner12.png"></li> 
		                   <li><img src="../images/partner13.png"></li> 
		                   <li><img src="../images/partner14.png"></li> 
		                   <li><img src="../images/partner15.png"></li> 
		                   <li><img src="../images/partner16.png"></li> 
		                   <li><img src="../images/partner17.png"></li> 
		                   <li><img src="../images/partner18.png"></li> 
		                   <li><img src="../images/partner19.png"></li> 
		                   <li><img src="../images/partner20.png"></li> 
		                   <li><img src="../images/partner21.png"></li> 
		                   <li><img src="../images/partner22.png"></li> 
		                   <li><img src="../images/partner23.png"></li>
						   <li><img src="../images/partner24.png"></li>
		                </ul>
		            </div>
		        </div>
		    </div>
		</div>
		<!-- history -->
		
		<div class="content_wrap map evt">
		    <!-- * 카카오맵 - 지도퍼가기 -->
			<!-- 1. 지도 노드 -->
			<div id="daumRoughmapContainer1620004652341" class="root_daum_roughmap root_daum_roughmap_landing" style="width:100%"></div>
			
			<!--
				2. 설치 스크립트
				* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
			-->
			<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
			
			<!-- 3. 실행 스크립트 -->
			<script charset="UTF-8">
				var windowWidth = $( window ).outerWidth();
				if(windowWidth <= 768) mapHeight = 250;
				else mapHeight = 500;
				new daum.roughmap.Lander({
					"timestamp" : "1620004652341",
					"key" : "25m2u",
					"mapHeight" : mapHeight
				}).render();
			</script>
			<a name="contact"></a>
	        <div class="layout_wrap wrap evt">
	        	<div class="left">
                    <h3 class="tit04">Contact us</h3>
                </div>
	            <div class="right">
	                <p class="txt">
                            앤더블유에 더 빨리 도착하려면
                    </p>
                    <div class="info">
                        <ul class="info_con info_left">
                            <li>
                                <strong class="txt_01">지하철 이용 시 <br>6호선 봉화산역에서 더 빨라요.</strong>
                                <span class="txt_02">봉화산역에서 버스이용 2114, 241, 75, 75-1번</span>
                                <span>봉화산역 3번출구 승차 → 중랑경찰서 하차</span>
                            </li>
                            <li>
                                <strong class="txt_01">차량 이용시 네비게이션에<br>'앤더블유'를 검색해 주세요.</strong>
                                <span class="txt_02">검색이 안된다면</span>
                                <span>서울시 중랑구 신내역로3길 40-36  신내데시앙플렉스 B동 1층 B102호</span>
                            </li>
                        </ul>
                        <ul class="info_con info_right">
                            <li>
                                <strong><span class="txt_03">신내역에서</span> 6호선/경춘선</strong>
                                <span><em class="txt_04">도보 10분</em>
                                    공영버스주차장 입구를 지나 신내역로 1길 따라 좌회전 후
                                    신내역로 3길 따라 좌회전하여 직진 (중랑경찰서 방향)</span>
                            </li>
                            <li>
                                <strong><span class="txt_03">잠실역에서 </span> 30분</strong>
                                <span><em class="txt_04">버스 1680번</em>
                                    잠실광역환승센터(지하) 승차 → 중랑경찰서 후문 하차</span>
                            </li>
                            <li>
                                <strong><span class="txt_03">강남구청에서</span> 1시간</strong>
                                <span><em class="txt_04">버스 242번</em>
                                    강남구청.강남세무서 승차 → 중랑공영차고지 하차</span>
                            </li>
                            <li>
                                <strong><span class="txt_03">종로1가에서</span> 1시간</strong>
                                <span><em class="txt_04">버스 260번</em>
                                    종로 1가 승차 → 중랑공영차고지 하차</span>
                            </li>
                        </ul>
                    </div>
	            </div>
	        </div>
	    </div>
	
	</div>
	<%@ include file="../inc/footer.jsp" %>