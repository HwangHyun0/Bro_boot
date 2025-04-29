<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="wrapper">
	<%@ include file="../inc/header.jsp" %>
	
	<div class="contents details">

		<div class="content_wrap">
		    <div class="wrap">
		    	<div class="top">
		    		<p>채용공고</p>
		    		<h2>${boardItem.title}</h2>
		    		<ul>
		    			<li>등록일</li>
		    			<li>
		    				<fmt:parseDate var="sys_reg_dttm" value="${boardItem.sys_reg_dttm}" pattern="yyyy-MM-dd"/>
							<fmt:formatDate var="re_sys_reg_dttm" value="${sys_reg_dttm}" pattern="yyyy-MM-dd"/>
                        	${re_sys_reg_dttm}
		    			</li>
		    		</ul>
		    	</div>
		    	<div class="detail_cont">
		    		${boardItem.de_contents}
		    	</div>
		    	<c:if test="${boardItem.visual_file_group_no != null}">
		    	<dl class="attach_file">
		    		<dt>첨부파일</dt>
		    		<dd><a href="${visualFileList[0].file_path}/${visualFileList[0].re_file_nm}" download="${visualFileList[0].org_file_nm}">${visualFileList[0].org_file_nm}</a></dd>
		    	</dl>
		    	</c:if>
		    	<div class="list_btn">
		    		<a href="javascript:fn_listNotice();">목록</a>
		    	</div>
		    </div>
		</div>
		
	<script>
	$(document).ready(function(){
		var de_contents = $('#de_contents');
		if(de_contents.length){
			var oEditors = [];
			nhn.husky.EZCreator.createInIFrame({
			    oAppRef: oEditors,
			    elPlaceHolder: "de_contents",
			    sSkinURI: "/texteditor/se2/SmartEditor2Skin2.html",
			    fCreator: "createSEditor2"
			});
		}
		
		function pasteHTML(filepath){
		    var sHTML = '<img src="/upload/texteditor/'+filepath+'">';
		    oEditors.getById["de_contents"].exec("PASTE_HTML", [sHTML]);
		}
	});
	
	//list 페이지 이동 (목록)
	function fn_listNotice() {
		var url = '';
		location.href = '/media/notice.do?action=list'+url;
	}
	</script>
	
	</div>
	<%@ include file="../inc/footer.jsp" %>
</div>