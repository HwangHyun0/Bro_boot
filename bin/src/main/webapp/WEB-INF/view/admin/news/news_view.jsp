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
                        <li>작성일 : 
							<fmt:parseDate var="sys_reg_dttm" value="${boardItem.sys_reg_dttm}" pattern="yyyy-MM-dd"/>
							<fmt:formatDate var="re_sys_reg_dttm" value="${sys_reg_dttm}" pattern="yyyy-MM-dd"/>
                        	${re_sys_reg_dttm}
                        </li>
                        <li>신문사명 :  ${boardItem.project_client}</li>
					</ul>
				</div>
			</div>
			<div class="view-bottom">
					<ul>
						<li>주소 : 
							<a href="${boardItem.project_keyword}" target="_blank" rel="noopener noreferrer" >${boardItem.project_keyword}</a>
						</li>
					</ul>
			</div>
			<div class="btn-area01">
				<div>
					<a href="javascript:fn_listNews();" class="btn02">목록</a>
					<a href="javascript:fn_deleteNewsOne();" class="btn02">삭제</a>
				</div>
				<div>
					<a href="javascript:fn_modifyNews(${boardItem.board_no});" class="btn01">수정</a>
				</div>
			</div>
		</div>
    </div>
    
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/admin/custom.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/admin/news/news.js"></script>
    
    <%@ include file="../inc/footer.jsp" %>