<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   	
   	<%@ include file="../inc/header.jsp" %>
		<input type="hidden" id="moreIndex" name="moreIndex" value="${moreIndex }"/>
		<input type="hidden" id="pageCnt" name="pageCnt" value="${pageCnt }"/>
		<div class="contents">
		    <!-- WORK LNB -->
		    <div class="aside_menu_wrap">
		        <div class="wrap">
		            <div class="aside_menu evt">
		                <ul class="depth1">
		                    <li class="active">
		                        <a href="/work/work.do">WORK</a>
		                        <ul class="depth2" id="depth2">
		                            <li id="depth2_all"><a href="/work/work.do">ALL</a></li>
		                            <li id="depth2_01"><a href="/work/work.do?classify=01">금융</a></li>
		                            <li id="depth2_02"><a href="/work/work.do?classify=02">공공기관</a></li>
		                            <li id="depth2_03"><a href="/work/work.do?classify=03">의료</a></li>
		                            <li id="depth2_04"><a href="/work/work.do?classify=04">포탈·기업</a></li>
		                        </ul>
		                    </li>
		                    <li><a href="/about/about.do">ABOUT</a></li>
		                    <li><a href="/news/news.do">NEWS</a></li>
		                    <li><a href="/careers/careers.do">CAREERS</a></li>
		                    <li><a href="/upload/file/brochure.pdf" download>BROCHURE <i class="ico_down"><span class="blind">다운로드</span></i></a></li>
		                </ul>
		            </div>
		        </div>
		    </div>
		    <!-- // WORK LNB -->
		
		    <div class="mob_category_wrap wrap">
		        <div class="select_box">
		            <select id="m_depth2" onchange="if(this.value) location.href=(this.value);">
		                <option id="m_depth2_all" value="/work/work.do">ALL</option>
		                <option id="m_depth2_01" value="/work/work.do?classify=01">금융</option>
		                <option id="m_depth2_02" value="/work/work.do?classify=02">공공기관</option>
		                <option id="m_depth2_03" value="/work/work.do?classify=03">의료</option>
		                <option id="m_depth2_04" value="/work/work.do?classify=04">포탈·기업</option>
		            </select>
		        </div>
		    </div>
		
		    <!-- WORK LIST -->
		    <div class="work_contents_wrap">
		        <div class="wrap">
		            <div class="work_contents">
		                <div class="work_list evt list" id="work_list">
		                <c:if test="${fn:length(workList) != 0}">
                			<c:forEach var="w" items="${workList}" varStatus="st">
               					<c:if test="${st.count%15 == 5}">
               						<!-- 5번째 카피라이트 -->
		                            <div class="work_item">
		                                <div class="item">
		                                    <div class="txt left">
		                                    	<fmt:parseNumber var="num" value="${st.count/15}" integerOnly="true"></fmt:parseNumber>
		                                    	<c:if test="${num%5 == 0}"><p>고객 <br>중심의 <br>기술서비스</p></c:if>
		                                    	<c:if test="${num%5 == 1}"><p>좋은<br>디자인과<br>편리한<br>서비스</p></c:if>
		                                    	<c:if test="${num%5 == 2}"><p>경험을<br>통한<br>편한 UI</p></c:if>
		                                    	<c:if test="${num%5 == 3}"><p>인간중심의<br>기술<br>가치</p></c:if>
		                                    	<c:if test="${num%5 == 4}"><p>고객과<br>사용자의<br>소통</p></c:if>
		                                    </div>
		                                </div>
		                            </div>
		                            <!-- //5번째 카피라이트 -->
               					</c:if>
               					<c:if test="${st.count%15 == 11}">
               						<!-- 12번째 카피라이트 -->
		                            <div class="work_item">
		                                <div class="item">
		                                    <div class="txt right">
		                                        <fmt:parseNumber var="num2" value="${st.count/15}" integerOnly="true"></fmt:parseNumber>
		                                    	<c:if test="${num%5 == 0}"><p>철저한<br>분석을 통한<br>UI설계</p></c:if>
		                                    	<c:if test="${num%5 == 1}"><p>더 나은<br>서비스,<br>경험</p></c:if>
		                                    	<c:if test="${num%5 == 2}"><p>새로운<br>가치<br>전달</p></c:if>
		                                    	<c:if test="${num%5 == 3}"><p>소통과<br>몰입의<br>방법론</p></c:if>
		                                    	<c:if test="${num%5 == 4}"><p>전문적인<br>기술<br>서비스</p></c:if>
		                                    </div>
		                                </div>
		                            </div>
		                            <!-- //12번째 카피라이트 -->
               					</c:if>
               					<fmt:parseDate var="project_start_dt" value="${w.project_start_dt}" pattern="yyyy-MM-dd"/>
								<fmt:formatDate var="year_project_start_dt" value="${project_start_dt}" pattern="yyyy"/>
			                    <fmt:formatDate var="month_project_start_dt" value="${project_start_dt}" pattern="MM"/>
			                    <div class="work_item" id="boardItem_${w.board_no }">
	                                <a href="javascript:fn_viewWork(${w.board_no },'${w.view_yn }');" class="item">
	                                    <div class="img_box">
	                                        <figure class="bg"><img src="${w.thumb_file_list[0].file_path}/${w.thumb_file_list[0].re_file_nm}"></figure>
	                                        <div class="logo">
	                                            <img src="${w.logo_file_list[0].file_path}/${w.logo_file_list[0].re_file_nm}">
	                                        </div>
	                                    </div>
	                                    <c:if test="${w.view_yn == 'N'}">
	                                    <div class="info confidential">
	                                    </c:if>
	                                    <c:if test="${w.view_yn != 'N'}">
	                                    <div class="info">
	                                    </c:if>
	                                        <div class="date">
	                                            <span class="year">${year_project_start_dt}</span>
	                                            <span class="month">${month_project_start_dt}</span>
	                                        </div>
	                                        <div class="txt">
	                                            <span class="hashtag">
	                                            	<c:forEach var="keyword" items="${w.project_keyword_list}">
	                                            		<span>${keyword}</span>
	                                            	</c:forEach>
	                                            </span>
	                                            <strong class="tit">${w.title}</strong>
	                                        </div>
	                                        <c:if test="${w.view_yn == 'N'}">
                                            	<span class="confi_txt">대외비 프로젝트로 상세를 지원하지 않습니다.</span>
                                            </c:if>
	                                    </div>
	                                </a>
	                            </div>
	                          </c:forEach>
	                       </c:if>
		                </div>
		            </div>
		            <div class="btn_wrap">
		            <c:if test="${pageCnt != 0 && pageCnt != moreIndex}">
		                <button class="btn_more" onclick="fn_moreWork()"><span>MORE</span></button>
		            </c:if>
		            </div>
		        </div>
		    </div>
		    <!-- // WORK LIST -->
		
		</div>
		
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/work/work.js"></script>
	<script>
        $(window).on('load scroll', function(){
            var h = $('.btn_wrap').outerHeight();
            $('.aside_menu').css('paddingBottom', h);
            $('.work_contents_wrap').css('minHeight', $('.aside_menu').outerHeight() + 15);     
            // WORK LIST 레프트랑 푸터 겹침 방지
            if($(window).scrollTop() + $('.logo').outerHeight() + $('.aside_menu').height() > $('.btn_wrap').offset().top){
                $('.contents').addClass('up');
            } else{
                $('.contents').removeClass('up');
            }
        });
    </script>
	<%@ include file="../inc/footer.jsp" %>
		