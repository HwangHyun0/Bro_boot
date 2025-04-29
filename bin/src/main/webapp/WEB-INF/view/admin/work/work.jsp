<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   	<%@ include file="../inc/header.jsp" %>
	
	<div class="menu-wrap">
        <div class="search-wrap">
            <div class="left-area">
	            <div class="sel_box">
	            	<select id="select_board_classify_cd" name="select_board_classify_cd" onchange="fn_chgClassify(this)">
						<option value="">All</option>
						<option value="01">금융기관</option>
						<option value="02">공공기관</option>
						<option value="03">의료</option>
						<option value="04">기업/포탈</option>
					</select>
	            </div>
				<div class="sel_box">
					<select id="sort" name="sort" onchange="fn_chgSort(this)">
					<option value="sort01">작성일</option>
					<option value="sort02">프로젝트 시작일</option>
					<option value="sort03">프로젝트명</option>
				</select>
				</div>
			</div>
			<div class="right-area">
				<div class="sel_box">
					<select id="year" name="year">
						<option value="">연도</option>
					</select>
				</div>
				<div class="sel_box">
					<select id="month" name="month">
						<option value="">월</option>
						<option value="01">1월</option>
						<option value="02">2월</option>
						<option value="03">3월</option>
						<option value="04">4월</option>
						<option value="05">5월</option>
						<option value="06">6월</option>
						<option value="07">7월</option>
						<option value="08">8월</option>
						<option value="09">9월</option>
						<option value="10">10월</option>
						<option value="11">11월</option>
						<option value="12">12월</option>
					</select>
				</div>
				<input type="search" id="search_word" name="search_word" placeholder="프로젝트명을 입력해주세요." value="${search_word }"/>
				<input type="submit" class="search btn01 btn-sm" onclick="fn_search()" id="btn_search" value="조회"/>
			</div>
        </div>
        <div class="table-wrap">
            <table>
            	<colgroup>
					<col style="width:5%">
					<col style="width:5%">
					<!-- <col style="width:5%"> -->
					<col style="width:5%">
					<col style="width:10%">
					<col style="">
					<col style="width:20%">
					<col style="width:10%">
					<!-- <col style="width:8%"> -->
				</colgroup>
                <thead>
                    <tr>
                    	<th><input type="checkbox" id="all_chk"/></th>
                        <th>No.</th>
                        <th>사용</th>
                        <!-- <th>상단</th> -->
                        <th>분류</th>
                        <th>프로젝트명</th>
                        <th>프로젝트 기간</th>
                        <th>작성일</th>
                        <!-- <th>수정</th> -->
                    </tr>
                </thead>
                <tbody>
                <c:if test="${fn:length(workList) != 0}">
                	<c:forEach var="w" items="${workList}" varStatus="st">
                	<c:if test="${w.top_yn != 'Y'}">
                    	<tr>
                    </c:if>
                    <c:if test="${w.top_yn == 'Y'}">
                    	<tr class="top_notice">
                    </c:if>
                    	<td><input type="checkbox" name="checkbox" value="${w.board_no}"/></td>
                    	<c:if test="${w.top_yn == 'Y'}">
                        	<td class="pin"><img src="${pageContext.request.contextPath }/images/ico_pin.png"/></td>
                        </c:if>
                        <c:if test="${w.top_yn != 'Y'}">
                        	<td>${pagination.listCnt - (st.count) - ((pagination.curPage-1) * pagination.pageSize) + 1}</td>
                        </c:if>
                        <%-- <td>${pagination.listCnt - (st.count) - ((pagination.curPage-1) * pagination.pageSize) + 1}</td> --%>
                        <c:if test="${w.use_yn == 'Y'}">
                        	<td class="yes">${w.use_yn}</td>
                        </c:if>
                        <c:if test="${w.use_yn != 'Y'}">
                        	<td class="no">${w.use_yn}</td>
                        </c:if>
                        
						<%-- <c:if test="${w.top_yn == 'Y'}">
                        	<td class="yes">${w.top_yn}</td>
                        </c:if>
                        <c:if test="${w.top_yn != 'Y'}">
                        	<td class="no">${w.top_yn}</td>
                        </c:if> --%>
                        
                        <td>${w.board_classify_cd_nm}</td>
                        <td class="title"><a href="javascript:fn_viewWork(${w.board_no});">${w.title}</a></td>
                        <td>${w.project_start_dt} ~ ${w.project_end_dt}</td>
                        <td>
                        	<fmt:parseDate var="sys_reg_dttm" value="${w.sys_reg_dttm}" pattern="yyyy-MM-dd"/>
							<fmt:formatDate var="re_sys_reg_dttm" value="${sys_reg_dttm}" pattern="yyyy-MM-dd"/>
                        	${re_sys_reg_dttm}
                        </td>
                        <!-- <td class="modify"><a href="/admin/work/work_edit.do?board_no=${w.board_no}">수정</a></td> -->
                    </tr>
                    </c:forEach>
                </c:if>
                <c:if test="${fn:length(workList) == 0}">
                	<tr class="no-result">
                   		<td colspan="7">등록된 게시글이 없습니다.</td>
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
        	<!-- <input class="pop-open" type="button" id="btn_create" value="글쓰기"/> -->
        	<a href="javascript:fn_deleteWork();" class="btn02">삭제</a>
        	<a href="/admin/work/work_write.do" class="btn01">글쓰기</a>
        </div>        
    </div>
    
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/admin/custom.js"></script>
	<!-- Smart Editor -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/texteditor/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/admin/work/work.js"></script>
    
    <%@ include file="../inc/footer.jsp" %>