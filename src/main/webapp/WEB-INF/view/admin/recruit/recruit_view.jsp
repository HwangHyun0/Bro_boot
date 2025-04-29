<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   	<%@ include file="../inc/header.jsp" %>
   	
   	<input type="hidden" name="board_no" id="board_no" value="${boardItem.board_no}"/>
   	
	<div class="menu-wrap">
		<div class="view-wrap news">
			<div class="view-header">
				<div class="view-title">
					<c:if test="${boardItem.del_yn == 'Y'}"><strong>[삭제]</strong></c:if>
					<strong>${boardItem.title}</strong>
					<span>사용여부 : ${boardItem.use_yn}</span>
				</div>
				<div class="view-info">
					<ul>
                      	<li>유형 :
						    <c:choose>
						        <c:when test="${boardItem.view_yn eq 'Y'}">경력채용</c:when>
						        <c:when test="${boardItem.view_yn eq 'N'}">신입채용</c:when>
						        <c:otherwise></c:otherwise>
						    </c:choose>
						</li>
                        <li>공고기간 :
                        	<c:choose>
						        <c:when test="${boardItem.project_start_dt eq null }">상시채용</c:when>
						        <c:when test="${boardItem.project_start_dt ne null}">
						        	 ${boardItem.project_start_dt} ~ ${boardItem.project_end_dt} 
								</c:when>
						        <c:otherwise>..</c:otherwise>
						    </c:choose>
                        <li>작성일 : 
							<fmt:parseDate var="sys_reg_dttm" value="${boardItem.sys_reg_dttm}" pattern="yyyy-MM-dd"/>
							<fmt:formatDate var="re_sys_reg_dttm" value="${sys_reg_dttm}" pattern="yyyy-MM-dd"/>
                        	${re_sys_reg_dttm}
                        </li>
					</ul>
				</div>
			</div>
			<div class="view-content">
				<div>
					${boardItem.de_contents}
				</div>			
			</div>
			<c:if test="${boardItem.visual_file_group_no != null}">
				<div class="view-bottom">
					<ul>
						<li>첨부파일 : 
							<a href="${visualFileList[0].file_path}/${visualFileList[0].re_file_nm}" download="${visualFileList[0].org_file_nm}">${visualFileList[0].org_file_nm}</a>
						</li>
					</ul>
				</div>
			</c:if>
			<div class="btn-area01">
				<div>
					<a href="javascript:fn_listRecruit();" class="btn02">목록</a>
					<a href="javascript:fn_deleteRecruitOne();" class="btn02">삭제</a>
				</div>
				<div>
					<a href="javascript:fn_modifyRecruit(${boardItem.board_no});" class="btn01">수정</a>
				</div>
			</div>
		</div>
    </div>
    
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/admin/custom.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/admin/recruit/recruit.js"></script>
    
    <%@ include file="../inc/footer.jsp" %>