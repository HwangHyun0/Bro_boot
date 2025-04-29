<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Baby Bro</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="/assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">

		<!-- Page Wrapper -->
			<div id="page-wrapper">

				<!-- Header -->
					<header id="header">
						<h1><a href="/main/main.do">baby bro</a></h1>
						<nav>
							<a href="#menu">Menu</a>
						</nav>
					</header>

				<!-- Menu -->
					<nav id="menu">
						<div class="inner">
							<h2>Menu</h2>
							<ul class="links">
								<li><a href="index.html">Home</a></li>
								<li><a href="generic.html">baby</a></li>
								<li><a href="elements.html">young</a></li>
								<li><a href="#">Log In</a></li>
								<li><a href="#">Sign Up</a></li>
							</ul>
							<a href="#" class="close">Close</a>
						</div>
					</nav>

				<!-- Wrapper -->
					<section id="wrapper">
					
						<!-- Content -->
							<div class="wrapper">
								<div class="inner">

									<h3 class="major">아기때의 브로모습</h3>
									<p>2017.04.14 ~ </p>

									<section class="features">
										<c:if test="${fn:length(babyList) != 0}">
					        		 	 	<c:forEach var="n" items="${babyList}" varStatus="st">
							        			<article>
							        				<c:if test="${n.visual_file_group_no != null}">
														<a href="#" class="image"><img src="${n.thumb_file_list[0].file_path}/${n.thumb_file_list[0].re_file_nm}" alt="" /></a>
							        				</c:if>
													<h3 class="major">${n.title}</h3>
													<p>${n.de_contents}</p>
												</article>
					        		 	 	</c:forEach>
										</c:if>
									</section>

								</div>
							</div>

					</section>
			
			</div>

		<!-- Scripts -->
			<script src="/assets/js/jquery.min.js"></script>
			<script src="/assets/js/jquery.scrollex.min.js"></script>
			<script src="/assets/js/browser.min.js"></script>
			<script src="/assets/js/breakpoints.min.js"></script>
			<script src="/assets/js/util.js"></script>
			<script src="/assets/js/main.js"></script>

	</body>
</html>