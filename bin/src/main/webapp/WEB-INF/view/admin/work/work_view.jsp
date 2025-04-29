<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   	<%@ include file="../inc/header.jsp" %>
   	
   	<input type="hidden" name="board_no" id="board_no" value="${boardItem.board_no}"/>
   	
	<div class="menu-wrap">
		<div class="view-wrap work">
			<div class="view-header">
				<div class="view-title">
					<c:if test="${boardItem.del_yn == 'Y'}"><strong>[삭제]</strong></c:if>
					<strong>${boardItem.title}</strong>
					
					<span>사용여부 : ${boardItem.use_yn}</span>
				</div>
				<div class="view-info">
					<ul>
						<li>분류 : ${boardItem.board_classify_cd_nm}</li>
						<li>키워드 : ${boardItem.project_keyword}</li>
                        <li>프로젝트 기간 : ${boardItem.project_start_dt} ~ ${boardItem.project_end_dt}</li>
                        <li>작성일 : 
							<fmt:parseDate var="sys_reg_dttm" value="${boardItem.sys_reg_dttm}" pattern="yyyy-MM-dd"/>
							<fmt:formatDate var="re_sys_reg_dttm" value="${sys_reg_dttm}" pattern="yyyy-MM-dd"/>
                        	${re_sys_reg_dttm}
                        </li>
                        <li>대외비 : <c:if test="${boardItem.view_yn == 'N'}">Y</c:if><c:if test="${boardItem.view_yn != 'N'}">N</c:if></li>
                        <li>상단고정 : ${boardItem.top_yn}</li> <!-- 교체요망 -->
                        <li>목록형 : ${boardItem.list_type_yn}</li>
					</ul>
				</div>
			</div>
			<c:if test="${boardItem.view_yn != 'N'}">
				<div class="work_view contents">
					<div class="work_contents_wrap evt start" style="background:url(${visualFileList[0].file_path}/${visualFileList[0].re_file_nm})">
		                <div class="wrap">
		                    <div class="work_contents">
		                        <div class="tit">
		                            <span>${boardItem.board_classify_cd_nm }</span>
		                            <p>${boardItem.title }</p>
		                        </div>
		                        <ul class="info">
		                        <c:if test="${boardItem.list_type_yn != 'Y'}">
		                            <li>
		                                <strong>CLIENT</strong>
		                                <span>${boardItem.project_client }</span>
		                            </li>
		                            <li>
		                            	<fmt:parseDate var="project_start_dt" value="${boardItem.project_start_dt}" pattern="yyyy-MM-dd"/>
										<fmt:formatDate var="re_project_start_dt" value="${project_start_dt}" pattern="yyyy. MM"/>
										<fmt:parseDate var="project_end_dt" value="${boardItem.project_end_dt}" pattern="yyyy-MM-dd"/>
										<fmt:formatDate var="re_project_end_dt" value="${project_end_dt}" pattern="yyyy. MM"/>
		                                <strong>DATE</strong>
		                                <span>${re_project_start_dt } ~ ${re_project_end_dt }</span>
		                            </li>
		                        </c:if>
		                            <li>
		                                <strong>KEYWORD</strong>
		                                <span>${boardItem.project_keyword }</span>
		                            </li>
		                        </ul>
		                        <div class="txt">
		                            <p>${boardItem.contents }</p>
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <!-- //WORK VIEW - 템플릿 영역 -->
		
					${boardItem.de_contents }
					
				</div>
			</c:if>
			<div class="btn-area01">
				<div>
					<a href="javascript:fn_listWork();" class="btn02">목록</a>
					<a href="javascript:fn_deleteWorkOne();" class="btn02">삭제</a>
				</div>
				<div>
					<a href="javascript:fn_modifyWork(${boardItem.board_no});" class="btn01">수정</a>
				</div>
			</div>
		</div>
    </div>
    
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/admin/custom.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/admin/work/work.js"></script>
	<script>
        $(window).on('load scroll', function(){
            logoChange();
        })
        
        // 로고 컬러 변경 -----------------------------------------------------------
        function logoChange(){
            if ($(window).scrollTop() > $('.work_view .work_contents_wrap').next().offset().top - $('.header .wrap > *').outerHeight() / 2) {
                $('.header').addClass("change")
            } else {
                $('.header').removeClass("change")
            }
        }

        $(function(){
            monitor();
            function monitor(){
                // WORK VIEW 모니터 -----------------------------------------------------------
                var i = 0,
                    monitorImgBox = $('.work_monitor .img_box'),
                    monitorImg = monitorImgBox.find('img');
                var monitorSlideInt = setInterval(monitorEvt, 5);
                
                function monitorEvt(){
                    monitorImg.css({
                        'top' : -i + 'px',
                    });
                    if(i > monitorImg.outerHeight() - monitorImgBox.outerHeight()){
                        setTimeout(function(){
                            i = 0;
                        }, 500)
                    }else{
                        i++;
                    }
                }
                monitorImg.on({
                    'mouseenter' : function(){
                        clearInterval(monitorSlideInt);
                    },
                    'mouseleave' : function(){
                        monitorSlideInt = setInterval(monitorEvt, 5);
                    }
                })
            }
        })
    </script>
    
    <%@ include file="../inc/footer.jsp" %>