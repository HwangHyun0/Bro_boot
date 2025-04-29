$(document).ready(function(){
	$('#notice_tab').addClass('active');
	
	/*체크박스 전체 체크*/
	$('#all_chk').click(function(){
		if($('#all_chk').is(':checked') == true){
			$('input[name="checkbox"]').prop('checked',true);
		}else{
			$('input[name="checkbox"]').prop('checked',false);
		}
	});
	
	/*정렬 selected*/
	var sort_val = getParam('sort');
	if(sort_val != null && sort_val != ''){
		$("#sort").val(sort_val);
	}
});

/*smart editor 적용*/
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

//페이징
function fn_paging(curPage){
	var url = '';
	
	var sort = getParam('sort');
	var start_date = getParam('start_date');
	var end_date = getParam('end_date');
	
	if(sort != ''){
		url += '&sort='+sort;
	}
	if(start_date != ''){
		url += '&start_date='+start_date;
	}
	if(end_date != ''){
		url += '&end_date='+end_date;
	}
	
	location.href = '/admin/notice/notice.do?action=list'+url+'&curPage='+curPage;
}

//검색 스크립트
function fn_search(){
	var url = '';

	var sort = getParam('sort');
	var start_date = $('#start_date').val();
	var end_date = $('#end_date').val();
	
	if(sort != ''){
		url += '&sort='+sort;
	}
	if(start_date != ''){
		url += '&start_date='+start_date;
	}
	if(end_date != ''){
		url += '&end_date='+end_date;
	}
	if(start_date == '' || end_date == ''){
		alert("시작일/종료일을 선택하세요.");
		return false;
	}
	location.href = '/admin/notice/notice.do?action=list'+url;
}

//정렬 스크립트
function fn_chgSort(obj){
	var url = '';
	
	var sort = $(obj).val();
	var start_date = getParam('start_date');
	var end_date = getParam('end_date');
	
	if(sort != ''){
		url += '&sort='+sort;
	}
	if(start_date != ''){
		url += '&start_date='+start_date;
	}
	if(end_date != ''){
		url += '&end_date='+end_date;
	}
	location.href = '/admin/notice/notice.do?action=list'+url;
}

//view 페이지 이동
function fn_viewNotice(board_no) {
	var url = '';
	
	var sort = getParam('sort');
	var start_date = getParam('start_date');
	var end_date = getParam('end_date');
	var curPage = getParam('curPage');
	
	if(sort != ''){
		url += '&sort='+sort;
	}
	if(start_date != ''){
		url += '&start_date='+start_date;
	}
	if(end_date != ''){
		url += '&end_date='+end_date;
	}
	if(curPage != ''){
		url += '&curPage='+curPage;
	}
	
	location.href = '/admin/notice/notice_view.do?board_no='+board_no+url;
}

//list 페이지 이동 (목록)
function fn_listNotice() {
	var url = '';
	
	var sort = getParam('sort');
	var start_date = getParam('start_date');
	var end_date = getParam('end_date');
	var curPage = getParam('curPage');
	
	if(sort != ''){
		url += '&sort='+sort;
	}
	if(start_date != ''){
		url += '&start_date='+start_date;
	}
	if(end_date != ''){
		url += '&end_date='+end_date;
	}
	if(curPage != ''){
		url += '&curPage='+curPage;
	}
	
	location.href = '/admin/notice/notice.do?action=list'+url;
	
}

//edit 페이지 이동
function fn_modifyNotice(board_no){
	var url = '';
	
	var sort = getParam('sort');
	var start_date = getParam('start_date');
	var end_date = getParam('end_date');
	var curPage = getParam('curPage');
	
	if(sort != ''){
		url += '&sort='+sort;
	}
	if(start_date != ''){
		url += '&start_date='+start_date;
	}
	if(end_date != ''){
		url += '&end_date='+end_date;
	}
	if(curPage != ''){
		url += '&curPage='+curPage;
	}
	
	location.href = '/admin/notice/notice_edit.do?board_no='+board_no+url;
}

//삭제
function fn_deleteNotice() {
	var chkArr = [];
	var chkLength = $('input[name="checkbox"]:checked').length;
	if(chkLength == 0){
		alert("삭제 할 항목을 선택해주세요.");
	}else{
		if(confirm("삭제하시겠습니까?")){
			$("input[name='checkbox']:checked").each(function() {
				chkArr.push($(this).val());
		    });
			$.ajax({
				url:"/admin/notice/handler/deletenotice.do",
				type:"GET",
				dataType : 'text',
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				data:{"chkArr":chkArr},
				success:function(data){
					alert(data);
					location.reload();
				},error:function(request,status,error){
					console.log("error" +error);
				}

			});
		}
	}
}

//개별 삭제
function fn_deleteNoticeOne() {
	if(confirm("삭제하시겠습니까?")){
		var chkArr = [];
		var board_no = $('#board_no').val();
		chkArr.push(board_no);
		$.ajax({
			url:"/admin/notice/handler/deletenotice.do",
			type:"GET",
			dataType : 'text',
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data:{"chkArr":chkArr},
			success:function(data){
				alert(data);
				fn_listNotice();
			},error:function(request,status,error){
				console.log("error" +error);
			}

		});
	}
}

//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
$('#btn_save').click(function(){
	var frm = $('#noticeFrm');
	// 에디터의 내용이 textarea에 적용된다.
    oEditors.getById["de_contents"].exec("UPDATE_CONTENTS_FIELD", [ ]);
 	var title = $('#title');
 	var de_contents = $('#de_contents');

 	//사용여부 체크박스
 	if($('#use_chk').is(":checked") == true){
 		$('#use_yn').val("Y");
 	}else{
 		$('#use_yn').val("N");
 	}

 	//고정여부 체크박스
 	if($('#top_chk').is(":checked") == true){
 		$('#top_yn').val("Y");
 	}else{
 		$('#top_yn').val("N");
 	}
 
 	if(title.val().trim() == '' || title.val() == null){
    	alert("제목을 입력해주세요.");
    	title.focus();
		return false;
    }else if(de_contents.val().trim() == '<br>' || de_contents.val().trim() == '' || de_contents.val() == null){
    	alert("상세내용을 입력해주세요.");
    	de_contents.focus();
		return false;
    }else{
    	if(confirm("저장하시겠습니까?")){
    		var url = "";		
	    	frm.attr('action', '/admin/notice/handler/insertnotice.do');
			frm.submit();
    	}else{
    		return false;
    	}
    }
});

//수정
$('#btn_modify').click(function(){
	var frm = $('#noticeFrm');
	// 에디터의 내용이 textarea에 적용된다.
	oEditors.getById["de_contents"].exec("UPDATE_CONTENTS_FIELD", [ ]);
	var title = $('#title');
	var de_contents = $('#de_contents');

	//사용여부 체크박스
	if($('#use_chk').is(":checked") == true){
		$('#use_yn').val("Y");
	}else{
		$('#use_yn').val("N");
	}
		
 	//고정여부 체크박스
 	if($('#top_chk').is(":checked") == true){
 		$('#top_yn').val("Y");
 	}else{
 		$('#top_yn').val("N");
 	}
 	

	
	if(title.val().trim() == '' || title.val() == null){
    	alert("프로젝트명을 입력해주세요.");
    	title.focus();
		return false;
    }else if(de_contents.val().trim() == '<br>' || de_contents.val().trim() == '' || de_contents.val() == null){
    	alert("상세내용을 입력해주세요.");
    	de_contents.focus();
		return false;
    }else{
	  	if(confirm("수정하시겠습니까?")){
	  		var url = "";
	  		var sort = getParam('sort');
	  		var start_date = getParam('start_date');
	  		var end_date = getParam('end_date');
	  		var curPage = getParam('curPage');
	  		
	  		if(sort != ''){
	  			url += '&sort='+sort;
	  		}
	  		if(start_date != ''){
	  			url += '&start_date='+start_date;
	  		}
	  		if(end_date != ''){
	  			url += '&end_date='+end_date;
	  		}
	  		if(curPage != ''){
	  			url += '&curPage='+curPage;
	  		}
	    	frm.attr('action', '/admin/notice/handler/updatenotice.do?action=update'+url);
			frm.submit();
	  	}else{
	  		return false;
	  	}
    }
});
 
// textArea에 이미지 첨부
function pasteHTML(filepath){
    var sHTML = '<img src="/upload/texteditor/'+filepath+'">';
    oEditors.getById["de_contents"].exec("PASTE_HTML", [sHTML]);
}

//파라미터 받기
function getParam(sname) {
	var params = location.search.substr(location.search.indexOf("?") + 1);
	var sval = "";
	params = params.split("&");
	for (var i = 0; i < params.length; i++) {
		temp = params[i].split("=");
		if (temp[0] == sname) { 
			sval = temp[1]; 
		}
	}
	return sval;
}

