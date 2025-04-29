<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

   	<%@ include file="../inc/header.jsp" %>
	
	<c:forEach var="mailVo" items="${mailList}">
		<li><span>넘버: ${mailVo.mail_no} 메일 : ${mailVo.mail} 등록날짜: ${mailVo.date} 개인정보동의:${mailVo.private_yn}</span></li>
	</c:forEach>
	
	<div>
	<p>메일 입력</p>
		<form id="mailFrm">
				<input type="hidden" id="private_yn" name="private_yn" value=""/>
		
				<input type="email" id="mail" name="mail" value="andw@naver.com" />
				<br>
				개인정보동의 : 
				<input style= "width:20px; height:20px; border:1px solid black;" type="checkbox" id="private_chk" name="private_chk" value=""/>
		</form>
				
				<a href="javascript:;" id="save_btn">등록</a>
	</div>
	<a class="privacy_policy">메일 추출</a>
	
	<p></p>
	
</body>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/admin/mail/mail.js"></script>

</html>