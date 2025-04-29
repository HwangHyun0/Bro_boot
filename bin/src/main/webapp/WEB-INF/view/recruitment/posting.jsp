<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="wrapper">
	<%@ include file="../inc/header.jsp" %>
	
	<div class="contents media">

		<!-- 채용공고 BG -->
		<div class="bg_wrap">
		    <div class="wrap">
		        <div class="tit_wrap">
		            <h2 class="tit">채용공고</h2>
		            <span class="sub_tit">GiDATA는 여러분의 지원을 기다리고 있습니다.</span>
		        </div>
		    </div>
		</div>
		<!-- //채용공고 BG -->
		<div class="content_wrap">
		    <div class="wrap">
		        <p class="tbl_total">전체 <span class="num">${pagination.listCnt}</span>건</p>
		        <div class="tbl_wrap tbl_posting">
		        	<table>
		        		<caption>채용공고 표 - 번호, 제목, 등록일로 구성</caption>
		        		<colgroup>
		        			<col style="width:100px">
		        			<col>
		        			<col style="width:200px">
		        		</colgroup>
		        		<thead>
		        			<tr>
		        				<th>번호</th>
		        				<th>제목</th>
		        				<th>등록일</th>
		        			</tr>
		        		</thead>
		        		<tbody>
		        		 <!-- notice_list  -->
			        		 <tr>
			        		 	<td class="num">12</td>
		        				<td class="tit"><a href="javascript:;">공고 제목이 들어갑니다.</a><span class="date">상시채용</span></td>
		        				<td class="division">경력</td>
			        		 </tr>
			        		 <tr>
			        		 	<td class="num">12</td>
		        				<td class="tit"><a href="javascript:;">공고 제목이 들어갑니다.</a><span class="date">2025.01.01 ~ 2025.03.01</span></td>
		        				<td class="division">신입</td>
			        		 </tr>
		        		 	 <%-- <c:if test="${fn:length(noticeList) != 0}">
		        		 	 	<c:forEach var="n" items="${noticeList}" varStatus="st">
		        		 	 		<tr class="${n.top_yn eq 'Y' ? 'top' : ''}">
				        				<td class="num">${pagination.listCnt - (st.count) - ((pagination.curPage-1) * pagination.pageSize) + 1}</td>
				        				<td class="tit"><a href="javascript:fn_viewNotice(${n.board_no});">${n.title}</a></td>
				        				<td class="name">신문사명</td>
				        				<td class="date">
				        					<fmt:parseDate var="sys_reg_dttm" value="${n.sys_reg_dttm}" pattern="yyyy-MM-dd"/>
											<fmt:formatDate var="re_sys_reg_dttm" value="${sys_reg_dttm}" pattern="yyyy-MM-dd"/>
				                        	${re_sys_reg_dttm}
				        				</td>
				        			</tr>
		        		 	 	</c:forEach>
		        		 	 </c:if> --%>
		        		 	 <%-- <c:if test="${fn:length(noticeList) == 0}">
			                	<tr>
			                   		<td colspan="4">등록된 게시글이 없습니다.</td>
			                   	</tr>
			                </c:if> --%>
		        		 <!-- //notice_list -->
		        		</tbody>
		        	</table>
		        </div>
		        <div class="pagination">
		        		 <c:if test="${pagination.curRange ne 1 }">
				            <p class="prev_first">
				            <button onClick="fn_paging(1)"><span class="blind">처음</span></button>
				            </p>
				        </c:if>
				        <c:if test="${pagination.curPage ne 1}">
				     	   	<p class="prev_first">
				            <button onClick="fn_paging(1)"><span class="blind">처음</span></button>
				            </p>
				        	<p class="prev">
				        	<button onClick="fn_paging('${pagination.prevPage }')"><span class="blind">이전</span></button>
				        	</p> 
				        </c:if>
				        <ol>
				        <c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
				            <c:choose>
				                <c:when test="${pageNum eq  pagination.curPage}">
				                    <li><a href="#" class="on" onClick="fn_paging('${pageNum }')">${pageNum }</a></li>
				                </c:when>
				                <c:otherwise>
				                    <li><a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a></li>
				                </c:otherwise>
				            </c:choose>
				        </c:forEach>
				        </ol>
				        <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
				        	<p class="next">
				        	<button onClick="fn_paging('${pagination.nextPage }')"><span class="blind">다음</span></button>
				        	</p>
				        </c:if>
				        <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
				        	<p class="next_last">
				        	<button onClick="fn_paging('${pagination.pageCnt }')"><span class="blind">마지막</span></button>
				        	</p>
				        </c:if>
		        </div>
		    </div>
		</div>
	<script>
		//페이징
		function fn_paging(curPage){
			var url = '';
			location.href = '/media/notice.do?curPage='+curPage;
		}
		
		//view 페이지 이동
		function fn_viewNotice(board_no) {
			var url = '';
			location.href = '/media/notice_view.do?board_no='+board_no+url;
		}

	</script>	
	
	</div>
	<%@ include file="../inc/footer.jsp" %>
	</div>