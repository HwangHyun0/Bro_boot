<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   	<%@ include file="../inc/header.jsp" %>
	
	<div class="menu-wrap">
		<div class="write-wrap">
			<c:if test="${boardItem.board_no eq null}">
				<p class="write-title">채용공고 등록</p>
			</c:if>
			<c:if test="${boardItem.board_no ne null}">
				<p class="write-title">채용공고 수정</p>
			</c:if>
			<div class="table-wrap2">
			<form id="recruitFrm" method="post" enctype="multipart/form-data" action="">
				<input type="hidden" id="use_yn" name="use_yn"/>
				<input type="hidden" id="board_no" name="board_no" value="${boardItem.board_no }"/>
				<input type="hidden" id="board_classify_cd_val" value="${boardItem.board_classify_cd }"/>
				<table>
					<colgroup>
						<col style="width:150px">
						<col style="width:auto">
					</colgroup>
					<tbody>
						<tr>
							<th>제목 *</th>
							<td><input type="text" id="title" name="title" value="${boardItem.title }"></td>
						</tr>
						<tr>
							<th>공고 기간 *</th>
							<td>
					            <span class="cal-wrap1">                
					                <input type="text" class="cal-input" id="project_start_dt" name="project_start_dt" value="${boardItem.project_start_dt }" placeholder="시작일" readonly>
					            </span>
					            <span class="from-to">~</span>
					            <span class="cal-wrap2">                
					                <input type="text" class="cal-input" id="project_end_dt" name="project_end_dt" value="${boardItem.project_end_dt }" placeholder="종료일" readonly>
					            </span>
					            <span class="all_txt">상시</span><input type="checkbox" id="allday" <c:if test ="${boardItem.title ne null && boardItem.project_start_dt eq null}">checked</c:if>>
							</td>

						</tr>
						<tr>
							<th>유형 *</th>
							<td >
								<label for="junior">신입</label>
							    <input type="radio" id="junior" name="experience" value="N" <c:if test="${boardItem.view_yn == 'N' }">checked</c:if>>
							    <label for="senior">경력</label>
							    <input type="radio" id="senior" name="experience" value="Y" <c:if test="${boardItem.view_yn == 'Y' }">checked</c:if>>
	                        </td>
						</tr>
						<tr>
							<th>내용 *</th>
							<td ><textarea class="editer" id="de_contents" name="de_contents">${boardItem.de_contents }</textarea></td>
						</tr>
						<tr>
							<th>첨부파일 </th>
							<td class="file">
								<input type="text" id="file_name" class="upload-name" disabled="disabled" value="${visualFileList[0].org_file_nm }">
                                <label class="file-search">파일찾기
                                <input type="file" id="file1" name="file1" class="upload-hidden" accept=".pdf, .doc, .docx, .xls, .xlsx, .ppt, .pptx, .txt">
								</label>
							</td>
						</tr>
						<tr>
						
							<th>사용여부</th>
							<td>
								<c:if test="${boardItem.use_yn == 'Y' }">
									<input type="checkbox" id="use_chk" checked>
								</c:if>
								<c:if test="${boardItem.use_yn != 'Y'}">
									<input type="checkbox" id="use_chk">
								</c:if>
	                        </td>
	                        </tr>
					</tbody>
				</table>
			</form>
			</div>
			<div class="btn-area01">
				<a href="javascript:history.back();" class="btn02">취소</a>
				<c:if test="${boardItem.board_no eq null}">
					<a href="javascript:;" id="btn_save" class="btn01">저장</a>
				</c:if>
				<c:if test="${boardItem.board_no ne null}">
					<a href="javascript:;" id="btn_modify" class="btn01">수정</a>
				</c:if>
	            <!-- <button class="cancel" type="button" id="btn_cancel">취소</button>
	            <button class="save" type="button" id="btn_save">저장</button>
	            <button class="save" type="button" id="btn_modify" style="display:none">수정</button> -->
			</div>
		</div>
	
	
	</div>
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/admin/custom.js"></script>
	<!-- Smart Editor -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/texteditor/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/admin/recruit/recruit.js"></script>
     
    <%@ include file="../inc/footer.jsp" %>