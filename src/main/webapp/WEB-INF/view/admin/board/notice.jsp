<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   	<%@ include file="../inc/header.jsp" %>
	
   	<div class="menu-wrap">
        <div class="search-wrap">
            <div class="left-area">
	            <div class="sel_box">
	            	<select id="sort" name="sort" class="news_sel" onchange="fn_chgSort(this)">
						<option value="sort01">작성일</option>
<!-- 						<option value="sort03">제목</option> -->
					</select>
	            </div>
			</div>
			<div class="right-area">
	            <span class="cal-wrap1">                
	                <input type="text" class="cal-input" id="start_date" name="start_date" value="${start_date }" placeholder="시작일" readonly>
	            </span>
	            <span class="from-to">~</span>
	            <span class="cal-wrap2">                
	                <input type="text" class="cal-input" id="end_date" name="end_date" value="${end_date }" placeholder="종료일" readonly>
	            </span>
	            <input type="submit" class="search btn01 btn-sm" onclick="fn_search()" id="btn_search" value="조회"/>
			</div>
        </div>
        <div class="table-wrap">
            <table>
            	<colgroup>
					<col style="width:5%">
					<col style="width:5%">
					<col style="width:5%">
					<col style="width:5%">
					<col style="">
					<col style="width:10%">
				</colgroup>
                <thead>
                    <tr>
                        <th><input type="checkbox" id="all_chk"/></th>
                        <th>No.</th>
                        <th>사용</th>
                        <th>고정</th>
                        <th>제목</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                 <tbody>
                     <c:if test="${fn:length(noticeList) != 0}">
                	<c:forEach var="n" items="${noticeList}" varStatus="st">
                    <tr>
                    	<td><input type="checkbox" name="checkbox" value="${n.board_no}"/></td>
                        <td>${pagination.listCnt - (st.count) - ((pagination.curPage-1) * pagination.pageSize) + 1}</td>
                        <c:if test="${n.use_yn == 'Y'}">
                        	<td class="yes">${n.use_yn}</td>
                        </c:if>
                        <c:if test="${n.use_yn != 'Y'}">
                        	<td class="no">${n.use_yn}</td>
                        </c:if>
                        <c:if test="${n.top_yn == 'Y'}">
                        	<td class="yes">${n.top_yn}</td>
                        </c:if>
                        <c:if test="${n.top_yn != 'Y'}">
                        	<td class="no">${n.top_yn}</td>
                        </c:if>
                        <td class="title"><a href="javascript:fn_viewNotice(${n.board_no});">${n.title}</a></td>
                        <td>
                        	<fmt:parseDate var="sys_reg_dttm" value="${n.sys_reg_dttm}" pattern="yyyy-MM-dd"/>
							<fmt:formatDate var="re_sys_reg_dttm" value="${sys_reg_dttm}" pattern="yyyy-MM-dd"/>
                        	${re_sys_reg_dttm}
                        </td>
                    </tr>
                    </c:forEach>
                </c:if>
                <c:if test="${fn:length(noticeList) == 0}">
                	<tr class="no-result">
                   		<td colspan="5">등록된 게시글이 없습니다.</td>
                   	</tr>
                </c:if>
                 </tbody>
            </table>
        </div>
        
        <div class="paging-wrap">
			<ul class="pagination">
		        <c:if test="${pagination.curRange ne 1 }">
		            <li class="first page"><a href="#" onClick="fn_paging(1)"></a></li>
		        </c:if>
		        <c:if test="${pagination.curPage ne 1}">
		            <li class="prev page"><a href="#" onClick="fn_paging('${pagination.prevPage }')"></a></li> 
		        </c:if>
		        <c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
		            <c:choose>
		                <c:when test="${pageNum eq  pagination.curPage}">
		                    <li class="on"><a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a></li>
		                </c:when>
		                <c:otherwise>
		                    <li><a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a></li>
		                </c:otherwise>
		            </c:choose>
		        </c:forEach>
		        <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
		            <li class="next page"><a href="#" onClick="fn_paging('${pagination.nextPage }')"></a></li>
		        </c:if>
		        <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
		            <li class="last page"><a href="#" onClick="fn_paging('${pagination.pageCnt }')"></a></li>
		        </c:if>
			</ul>
	    </div>
	    
	    <div class="btn-area01">
        	<a href="javascript:fn_deleteNotice();" class="btn02">삭제</a>
        	<a href="/admin/notice/notice_write.do" class="btn01">글쓰기</a>
        </div>
    </div>
    
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/admin/custom.js"></script>
	<!-- Smart Editor -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/texteditor/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/admin/notice/notice.js"></script>
	
	<%@ include file="../inc/footer.jsp" %>