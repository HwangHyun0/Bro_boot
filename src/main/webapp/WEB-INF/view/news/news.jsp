<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   	
   	<%@ include file="../inc/header.jsp" %>
		<input type="hidden" id="moreIndex" name="moreIndex" value="${moreIndex }"/>
		<input type="hidden" id="pageCnt" name="pageCnt" value="${pageCnt }"/>
		<div class="contents">

            <!-- NEWS -->
            <div class="news_wrap evt">
                <div class="wrap">
                    <div class="tit_wrap">
                        <h2 class="tit02">NEWS</h2><span class="txt_top">${listCnt }</span>
                    </div>
                    <!-- news_list  -->
                    <div class="news_list evt">
                        <ul class="depth1 evt" id="news_list">
                        	<c:if test="${fn:length(newsList) != 0}">
	                			<c:forEach var="n" items="${newsList}" varStatus="st">
	                				<c:if test="${st.count == 1 }"><li class="active"></c:if>
		                            <c:if test="${st.count != 1 }"><li></c:if>
		                                <a class="tit03" href="javascript:;">${n.title }</a>
		                                <div class="news_box">
		                                    <div class="tit03">${n.title }</div>
		                                    <div class="day">
		                                    	<fmt:parseDate var="publish_dt" value="${n.publish_dt}" pattern="yyyy-MM-dd"/>
												<fmt:formatDate var="re_publish_dt" value="${publish_dt}" pattern="yyyy. MM"/>
		                                    	${re_publish_dt }
		                                    </div>
		                                    <div class="txt">
		                                    	${n.de_contents }
											</div>
		                                </div>
		                            </li>
		                        </c:forEach>
		                    </c:if>
                        </ul>
                    </div>
                    <!-- //news_list -->

                    <div class="btn_wrap">
                    <c:if test="${pageCnt != 0 && pageCnt != moreIndex}">
                        <button class="btn_more" onclick="fn_moreWork()"><span>MORE</span></button>
                    </c:if>
                    </div>
                </div>
            </div>
            <!-- // NEWS -->

        </div>
		
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/news/news.js"></script>
	<%@ include file="../inc/footer.jsp" %>
		