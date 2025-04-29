<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ page import="com.bro.web.model.*"%>
<%
    MemberVo vo = (MemberVo)session.getAttribute("loginInfo");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>BRO-ADMIN</title>    
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/common.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
	<script src="${pageContext.request.contextPath }/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
   	<!-- S : HEADER-->
	<header>
		<div class="header-container">
			<p><strong><%=vo.getMember_nm()%></strong>님, 로그인되었습니다.&nbsp;&nbsp;&nbsp;&nbsp;사용 후 꼭! 로그아웃을 해주세요.</p>
			<a href="/login/handler/logout.do" class="btn-logout">로그아웃</a>
		</div>
	</header>
	<!-- E : HEADER-->
	<div class="admin-tab">
		<ul class="tab-button">
           	<li id="baby_tab"><a href="/admin/bro/baby.do">Baby</a></li>
           	<li id="young_tab"><a href="/admin/bro/young.do">young</a></li>
           	<li id="now_tab"><a href="/admin/bro/now.do">now</a></li>
<!--            	<li id="recruit_tab"><a href="/admin/recruit/recruit.do">채용공고</a></li> -->
<!--            	<li id="careers_tab"><a href="/admin/careers/careers.do">CAREERS</a></li> -->
		</ul>
	</div>