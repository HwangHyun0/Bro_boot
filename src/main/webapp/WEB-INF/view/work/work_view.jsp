<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   	
   	<%@ include file="../inc/header.jsp" %>
		
		<div class="contents work_view">
            <!-- WORK LNB -->
            <div class="aside_menu_wrap">
                <div class="wrap">
                    <div class="aside_menu">
                        <ul class="depth1">
                            <li class="active">
                                <a href="/work/work.do">WORK</a>
                                <ul class="depth2">
                                    <li id="depth2_all"><a href="/work/work.do">ALL</a></li>
		                            <li id="depth2_01"><a href="/work/work.do?classify=01">금융</a></li>
		                            <li id="depth2_02"><a href="/work/work.do?classify=02">공공기관</a></li>
		                            <li id="depth2_03"><a href="/work/work.do?classify=03">의료</a></li>
		                            <li id="depth2_04"><a href="/work/work.do?classify=04">포탈·기업</a></li>
                                </ul>
                            </li>
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

            <!-- WORK VIEW - 템플릿 영역 -->
            <div class="work_contents_wrap" style="background:url(${visualFileList[0].file_path}/${visualFileList[0].re_file_nm})">
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

            <!-- WORK VIEW - ARROW -->
            <c:choose>
				<c:when test="${prevBoardItem.board_no == null}">
					<div class="page_skip prev_no">
				</c:when>
				<c:when test="${nextBoardItem.board_no == null}">
					<div class="page_skip next_no">
				</c:when>
				<c:otherwise>
					<div class="page_skip">
				</c:otherwise>
			</c:choose>
                <div class="wrap">
                	<c:choose>
						<c:when test="${prevBoardItem.board_no != null}">
							<a href="javascript:fn_viewPrevWork(${prevBoardItem.board_no}, ${prevMoreIndex });" class="prev_box">
		                		<div class="bg_box" style="background:url(${prevThumbFileList[0].file_path}/${prevThumbFileList[0].re_file_nm})"></div>
		                		<div class="box">
		                            <span>Prev</span>
		                            <strong>${prevBoardItem.title }</strong>
		                        </div>
		                    </a>
						</c:when>
						<c:otherwise>
							<a href="javascript:alert('이전글이 없습니다.');" class="prev_box">
	                			<div class="bg_box" style="background:url()"></div>
	                			<div class="box">
		                            <span>Prev</span>
		                            <strong>이전글이 없습니다.</strong>
		                        </div>
	                		</a>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${nextBoardItem.board_no != null}">
							<a href="javascript:fn_viewNextWork(${nextBoardItem.board_no}, ${nextMoreIndex });" class="next_box">
		                		<div class="bg_box" style="background:url(${nextThumbFileList[0].file_path}/${nextThumbFileList[0].re_file_nm})"></div>
		                		<div class="box">
		                            <span>Next</span>
		                            <strong>${nextBoardItem.title }</strong>
		                        </div>
		                    </a>
						</c:when>
						<c:otherwise>
							<a href="javascript:alert('다음글이 없습니다.');" class="next_box">
	                			<div class="bg_box" style="background:url()"></div>
	                			<div class="box">
		                            <span>Next</span>
		                            <strong>다음글이 없습니다.</strong>
		                        </div>
	                		</a>
						</c:otherwise>
					</c:choose>
                </div>
                <a href="javascript:fn_listWork();" class="btn_list"><span class="blind">목록으로가기</span></a>
            </div>
            <!-- WORK VIEW - ARROW -->
            
        </div>
		
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/work/work.js"></script>
	<%@ include file="../inc/footer.jsp" %>
		