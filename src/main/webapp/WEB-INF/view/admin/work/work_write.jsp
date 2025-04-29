<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   	<%@ include file="../inc/header.jsp" %>
	
	<div class="menu-wrap">
		<div class="write-wrap">
			<c:if test="${boardItem.board_no eq null}">
				<p class="write-title">WORK 작성</p>
			</c:if>
			<c:if test="${boardItem.board_no ne null}">
				<p class="write-title">WORK 수정</p>
			</c:if>
			<div class="table-wrap2">
			<form id="workFrm" method="post" enctype="multipart/form-data" action="">
				<input type="hidden" id="use_yn" name="use_yn" value="N"/>
				<input type="hidden" id="view_yn" name="view_yn" value="N"/>
				<input type="hidden" id="top_yn" name="top_yn" value="N"/>
				<input type="hidden" id="list_type_yn" name="list_type_yn" value="N"/>
				<input type="hidden" id="board_no" name="board_no" value="${boardItem.board_no }"/>
				<input type="hidden" id="board_classify_cd_val" value="${boardItem.board_classify_cd }"/>
				<ul class="chk_list">
					<li>
						<label for="use_chk">사용여부</label>
						<span>
							<c:if test="${boardItem.use_yn == 'Y' }">
								<input type="checkbox" id="use_chk" checked>
							</c:if>
							<c:if test="${boardItem.use_yn != 'Y'}">
								<input type="checkbox" id="use_chk">
							</c:if>
						</span>
					</li>
					<li>
						<label for="top_chk">상단고정</label>
						<span>
							<c:if test="${boardItem.top_yn == 'Y' }">
								<input type="checkbox" id="top_chk" checked>
							</c:if>
							<c:if test="${boardItem.top_yn != 'Y'}">
								<input type="checkbox" id="top_chk">
							</c:if>
						</span>
					</li>
					<li>
						<label for="view_chk">대외비</label>
						<span>
							<c:if test="${boardItem.view_yn == 'N' }">
								<input type="checkbox" id="view_chk" checked>
							</c:if>
							<c:if test="${boardItem.view_yn != 'N'}">
								<input type="checkbox" id="view_chk">
							</c:if>
						</span>
					</li>
					<li>
						<label for="list_type_chk">목록형</label>
						<span>
							<c:if test="${boardItem.list_type_yn == 'Y' }">
								<input type="checkbox" id="list_type_chk" checked>
							</c:if>
							<c:if test="${boardItem.list_type_yn != 'Y'}">
								<input type="checkbox" id="list_type_chk">
							</c:if>
						</span>
					</li>
				</ul>
				<table >
					<colgroup>
						<col style="width:150px"><!-- 프로젝트명 -->
						<col style="width:500px">
						<col style="width:150px">
						<col><!-- 프로젝트분류 -->
						<!-- <col style="width:150px">
						<col>사용여부
						<col style="width:150px">
						<col> -->
					</colgroup>
					<tbody>
						<tr>
							<th>프로젝트명 *</th>
							<td Colspan="1"><input type="text" id="title" name="title" value="${boardItem.title }"></td>
							<th>프로젝트 분류 *</th>
							<td colspan="1">
								<select id="board_classify_cd" name="board_classify_cd">
									<option value="01">금융기관</option>
									<option value="02">공공기관</option>
									<option value="03">의료</option>
									<option value="04">기업/포탈</option>
								</select>
							</td>
							<%-- <th>사용여부</th>
							<td>
								<c:if test="${boardItem.use_yn == 'Y' }">
									<input type="checkbox" id="use_chk" checked>
								</c:if>
								<c:if test="${boardItem.use_yn != 'Y'}">
									<input type="checkbox" id="use_chk">
								</c:if>
	                        </td> --%>
						</tr>
						<tr>
							<th>프로젝트 기간 *</th>
							<td Colspan="1">
					            <span class="cal-wrap1">                
					                <input type="text" class="cal-input" id="project_start_dt" name="project_start_dt" value="${boardItem.project_start_dt }" placeholder="시작일" readonly>
					            </span>
					            <span class="from-to">~</span>
					            <span class="cal-wrap2">                
					                <input type="text" class="cal-input" id="project_end_dt" name="project_end_dt" value="${boardItem.project_end_dt }" placeholder="종료일" readonly>
					            </span>
							</td>
							<th class="client_area">고객사(CLIENT) *</th>
							<td class="client_area" Colspan="1"><input type="text" id="project_client" name="project_client" value="${boardItem.project_client }"></td>
							<%-- <th>상단고정</th>
							<td>
								<c:if test="${boardItem.top_yn == 'Y' }">
									<input type="checkbox" id="top_chk" checked>
								</c:if>
								<c:if test="${boardItem.top_yn != 'Y'}">
									<input type="checkbox" id="top_chk">
								</c:if>
	                        </td> --%>
	                        
						</tr>
						<tr>
							<th>키워드(#) *</th>
							<td Colspan="3"><input type="text" id="project_keyword" name="project_keyword" placeholder="콤마(,)로 구분하여 적어주세요. ex) 반응형,브런치" value="${boardItem.project_keyword }"></td>
							<%-- <th>대외비</th>
							<td>
								<c:if test="${boardItem.view_yn == 'N' }">
									<input type="checkbox" id="view_chk" checked>
								</c:if>
								<c:if test="${boardItem.view_yn != 'N'}">
									<input type="checkbox" id="view_chk">
								</c:if>
	                        </td> --%>
						</tr>
						<tr>
							<th>썸네일용 로고 *</th>
							<td Colspan="3" class="file">
								<input type="text" id="file_name" class="upload-name" disabled="disabled" value="${logoFileList[0].org_file_nm }">
                                <label class="file-search">파일찾기
                                <input type="file" id="file1" name="file1" class="upload-hidden" accept=".gif, .jpg, .png">
								</label>
							</td>
						</tr>
						<tr>
							<th>썸네일 *</th>
							<td Colspan="3" class="file">
								<input type="text" id="file_name" class="upload-name" disabled="disabled" value="${thumbFileList[0].org_file_nm }">
                                <label class="file-search">파일찾기
                                <input type="file" id="file2" name="file2" class="upload-hidden" accept=".gif, .jpg, .png">
								</label>
							</td>
						</tr>
						<tr id="visual_area">
							<th>상세 상단 비주얼 *</th>
							<td Colspan="3" class="file">
								<input type="text" id="file_name" class="upload-name" disabled="disabled" value="${visualFileList[0].org_file_nm }">
                                <label class="file-search">파일찾기
                                <input type="file" id="file3" name="file3" class="upload-hidden" accept=".gif, .jpg, .png">
								</label>
							</td>
						</tr>
						<tr id="contents_area">
							<th>프로젝트 소개글 *</th>
							<td Colspan="3"><textarea id="contents" name="contents "placeholder="프로젝트 소개글을 문단을 나누어 간략히 적어주세요. 타이틀 하단에 표시됩니다. (4줄권장)">${boardItem.contents }</textarea></td>
						</tr>
						<tr id="de_contents_area">
							<th>상세내용 *</th>
							<td Colspan="3"><textarea class="editer" id="de_contents" name="de_contents">${boardItem.de_contents }</textarea></td>
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
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/admin/work/work.js"></script>
     
    <%@ include file="../inc/footer.jsp" %>