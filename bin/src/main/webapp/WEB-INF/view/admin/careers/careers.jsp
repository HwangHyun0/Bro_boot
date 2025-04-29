<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   	<%@ include file="../inc/header.jsp" %>
   	
	<div class="menu-wrap careers">
        <div class="search-wrap">
			<div class="left-area">
				<div class="sel_box">
					<select id="year" name="year" onchange="fn_chgYear(this)">
						<option value="">연도</option>
					</select>
				</div>
				<div class="sel_box">
					<select id="select_applicant_classify_cd02" name="select_applicant_classify_cd02" onchange="fn_chgClassify(this)">
						<option value="">All</option>
						<option value="01">사업관리</option>
						<option value="02">기획</option>
						<option value="03">디자인</option>
						<option value="04">퍼블리셔</option>
						<option value="05">개발</option>
					</select>
				</div>
			</div>
			<div class="right-area">
				<input type="search" id="search_word" name="search_word" placeholder="이름을 입력해주세요." value="${search_word }"/>
				<input type="submit" class="search btn01 btn-sm" onclick="fn_search()" id="btn_search" value="조회"/>
			</div>
        </div>
        <div class="table-wrap">
            <table>
            	<colgroup>
					<col style="width:5%">
					<col style="width:5%">
					<col style="width:8%">
					<col style="width:8%">
					<col style="">
					<col style="width:20%">
				</colgroup>
                <thead>
                    <tr>
                    	<th><input type="checkbox" id="all_chk"/></th>
                        <th>No.</th>
                        <th>지원분야</th>
                        <th>경력</th>
                        <th>이름</th>
                        <th>날짜</th>
                    </tr>
                </thead>
                <tbody>
                <c:if test="${fn:length(careersList) != 0}">
                	<c:forEach var="c" items="${careersList}" varStatus="st">
                    <tr>
                    	<td><input type="checkbox" name="checkbox" value="${c.applicant_no}"/></td>
                        <td>${pagination.listCnt - (st.count) - ((pagination.curPage-1) * pagination.pageSize) + 1}</td>
                        <td>${c.applicant_classify_cd02_nm}</td>
                        <td>${c.applicant_classify_cd01_nm}</td>
                        <td class="title"><a href="javascript:fn_viewCareers(${c.applicant_no});">${c.applicant_nm}</a></td>
                        <td>
                        	<fmt:parseDate var="sys_reg_dttm" value="${c.sys_reg_dttm}" pattern="yyyy-MM-dd"/>
							<fmt:formatDate var="re_sys_reg_dttm" value="${sys_reg_dttm}" pattern="yyyy-MM-dd"/>
                        	${re_sys_reg_dttm}
                        </td>
                    </tr>
                    </c:forEach>
                </c:if>
                <c:if test="${fn:length(careersList) == 0}">
                	<tr class="no-result">
                   		<td colspan="6">등록된 게시글이 없습니다.</td>
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
        	<a href="javascript:fn_deleteCareers();" class="btn02">삭제</a>
        </div>
    </div>
    
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/admin/custom.js"></script>
	<!-- Smart Editor -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/texteditor/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/admin/careers/careers.js"></script>
    
    <%@ include file="../inc/footer.jsp" %>