<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   	<%@ include file="../inc/header.jsp" %>
	
	<div class="menu-wrap">
		<div class="write-wrap">
			<c:if test="${boardItem.board_no eq null}">
				<p class="write-title">NEWS 작성</p>
			</c:if>
			<c:if test="${boardItem.board_no ne null}">
				<p class="write-title">NEWS 수정</p>
			</c:if>
			<div class="table-wrap2">
			<form id="newsFrm" method="post" enctype="multipart/form-data" action="">
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
							<td ><input type="text" id="title" name="title" value="${boardItem.title }"></td>
							
						</tr>
						<%-- <tr>
							<th>썸네일</th>
							<td Colspan="6" class="file">
								<input type="text" id="file_name" class="upload-name" disabled="disabled" value="${thumbFileList[0].org_file_nm }">
                                <label class="file-search">파일찾기
                                <input type="file" id="file1" name="file1" class="upload-hidden" accept=".gif, .jpg, .png">
								</label>
							</td>
						</tr> --%>
					<%-- 	<tr>
							<th>내용 *</th>
							<td Colspan="6"><textarea class="editer" id="de_contents" name="de_contents">${boardItem.de_contents }</textarea></td>
						</tr> --%>
						<tr>
							<th>신문사명 *</th>
							<td ><input type="text" id="project_client" name="project_client" value="${boardItem.project_client }"></td>
						</tr>
						<tr>
							<th>주소 *</th>
							<td><input type="text" id="project_keyword" name="project_keyword" value="${boardItem.project_keyword }"></td>
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
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/admin/news/news.js"></script>
     
    <%@ include file="../inc/footer.jsp" %>