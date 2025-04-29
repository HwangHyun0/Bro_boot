<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   	<%@ include file="../inc/header.jsp" %>
   	
   	<input type="hidden" name="applicant_no" id="applicant_no" value="${careers.applicant_no}"/>
   	
	<div class="menu-wrap">
		<div class="view-wrap careers">
			<div class="view-header">
				<div class="view-title">
					<strong>${careers.applicant_nm}</strong>
					<span>${careers.applicant_classify_cd02_nm} | ${careers.applicant_classify_cd01_nm}</span>
				</div>
				<div class="view-info">
					<ul>
						<li>접수일 : 
							<fmt:parseDate var="sys_reg_dttm" value="${careers.sys_reg_dttm}" pattern="yyyy-MM-dd"/>
							<fmt:formatDate var="re_sys_reg_dttm" value="${sys_reg_dttm}" pattern="yyyy-MM-dd"/>
                        	${re_sys_reg_dttm}
                        </li>
						<li>개인정보보호정책 동의여부 : ${careers.agree_yn}</li>
					</ul>
				</div>
			</div>
			<div class="view-content">
				<p class="view-content-title">[지원자 정보]</p>
				<table>
					<colgroup>
						<col style="width:120px">
						<col style="">
					</colgroup>
					<tbody>
						<tr>
							<th>이름</th>
							<td>${careers.applicant_nm}</td>
						</tr>
						<tr>
							<th>지원분야</th>
							<td>${careers.applicant_classify_cd02_nm} / ${careers.applicant_classify_cd01_nm}</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>${careers.applicant_email}</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>${careers.applicant_tel}</td>
						</tr>
						<tr>
							<th>포트폴리오</th>
							<td><a href="${careers.applicant_link}" target="_blank">${careers.applicant_link}</a></td>
						</tr>
					</tbody>
				</table>
				<p class="view-content-title">[지원 내용]</p>
				<pre>${careers.applicant_content}</pre>
			</div>
			<div class="view-bottom">
				<ul>
					<li>첨부파일 : 
						<a href="${careers.file_path}/${careers.re_file_nm}" download="${careers.org_file_nm}">${careers.org_file_nm}</a>
					</li>
				</ul>
			</div>
			<div class="btn-area01">
				<div>
					<a href="javascript:fn_listCareers();" class="btn02">목록</a>
					<a href="javascript:fn_deleteCareersOne();" class="btn02">삭제</a>
				</div>
			</div>
		</div>
    </div>
    
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/admin/custom.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/admin/careers/careers.js"></script>
    
    <%@ include file="../inc/footer.jsp" %>