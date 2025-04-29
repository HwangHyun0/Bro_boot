$(document).ready(function(){
	$('#work_tab').addClass('active');
	
	/*체크박스 전체 체크*/
	$('#all_chk').click(function(){
		if($('#all_chk').is(':checked') == true){
			$('input[name="checkbox"]').prop('checked',true);
		}else{
			$('input[name="checkbox"]').prop('checked',false);
		}
	});

	/*search enter키*/
	$("#search_word").keypress(function (e) {
		if(e.which == 13){
			fn_search();  // 실행할 이벤트
		}
	});
	
	/*연도 select 추가*/
	var now = new Date();
    var nyear = now.getFullYear();
    for (var i=nyear;i>2016;i--){
    	$('#year').append('<option value="'+i+'">'+i+'</option>');
    }
    
    /*연도 selected*/
    var year_val = getParam('year');
	if(year_val != null && year_val != ''){
		$("#year").val(year_val);
	}
	
	/*월 selected*/
    var month_val = getParam('month');
	if(month_val != null && month_val != ''){
		$("#month").val(month_val);
	}
	
    /*분류 selected*/
	var classify_val = getParam('classify');
	if(classify_val != null && classify_val != ''){
		$("#select_board_classify_cd").val(classify_val);
	}
	
	/*정렬 selected*/
	var sort_val = getParam('sort');
	if(sort_val != null && sort_val != ''){
		$("#sort").val(sort_val);
	}
	
	/*edit 분류 selected*/
	var board_classify_cd_val = $('#board_classify_cd_val').val();
	if(board_classify_cd_val != null && board_classify_cd_val != ''){
		$("#board_classify_cd").val(board_classify_cd_val);
	}
	
	/*대외비 체크박스 클릭*/
	$('#view_chk').click(function(){
		if($('#view_chk').is(":checked") == true){
			$('#visual_area').hide();
			$('#contents_area').hide();
			$('#de_contents_area').hide();
	 	}else{
	 		$('#visual_area').show();
			$('#contents_area').show();
			$('#de_contents_area').show();
			/*smart editor 적용*/
			/*var de_contents = $('#de_contents');
			if(de_contents.length){
				var oEditors = [];
				nhn.husky.EZCreator.createInIFrame({
				    oAppRef: oEditors,
				    elPlaceHolder: "de_contents",
				    sSkinURI: "/texteditor/se2/SmartEditor2Skin.html",
				    fCreator: "createSEditor2"
				});
			}*/
			/*editor 높이 가져옴*/
			var iframe = $('iframe');
			var smEditor = iframe[0];
			if(smEditor){
				smEditor.style.height = '549px';
			}
	 	}
	});
	if($('#view_chk').is(":checked") == true){
		$('#visual_area').hide();
		$('#contents_area').hide();
		$('#de_contents_area').hide();
 	}
	
	/*목록형 체크박스 클릭*/
	$('#list_type_chk').click(function(){
		if($('#list_type_chk').is(":checked") == true){
			$('.client_area').hide();
	 	}else{
	 		$('.client_area').show();
	 	}
	});
	if($('#list_type_chk').is(":checked") == true){
		$('.client_area').hide();
 	}
});

/*smart editor 적용*/
var de_contents = $('#de_contents');
if(de_contents.length){
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "de_contents",
	    sSkinURI: "/texteditor/se2/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	});
}

//페이징
function fn_paging(curPage){
	var url = '';
	
	var classify = getParam('classify');
	var sort = getParam('sort');
	var year = getParam('year');
	var month = getParam('month');
	var search_word = getParam('search_word');
	
	if(classify != ''){
		url += '&classify='+classify;
	}
	if(sort != ''){
		url += '&sort='+sort;
	}
	if(year != ''){
		url += '&year='+year;
	}
	if(month != ''){
		url += '&month='+month;
	}
	if(search_word != ''){
		url += '&search_word='+search_word;
	}
	
	location.href = '/admin/work/work.do?action=list'+url+'&curPage='+curPage;
}

//검색 스크립트
function fn_search(){
	var url = '';

	var classify = getParam('classify');
	var sort = getParam('sort');
	var year = $('#year').val();
	var month = $('#month').val();
	var search_word = $('#search_word').val();
	
	if(classify != ''){
		url += '&classify='+classify;
	}
	if(sort != ''){
		url += '&sort='+sort;
	}
	if(year != ''){
		url += '&year='+year;
	}
	if(month != ''){
		url += '&month='+month;
	}
	if(search_word != ''){
		url += '&search_word='+search_word;
	}
	if((search_word.trim() == '' || search_word == null) && year == '' && month == ''){
		alert("조회 할 항목을 선택/입력해주세요.");
		return false;
	}
	location.href = '/admin/work/work.do?action=list'+url;
}

//분류 스크립트
function fn_chgClassify(obj){
	var url = '';
	
	var classify = $(obj).val();
	var sort = getParam('sort');
	var year = getParam('year');
	var month = getParam('month');
	var search_word = getParam('search_word');
	
	if(classify != ''){
		url += '&classify='+classify;
	}
	if(sort != ''){
		url += '&sort='+sort;
	}
	if(year != ''){
		url += '&year='+year;
	}
	if(month != ''){
		url += '&month='+month;
	}
	if(search_word != ''){
		url += '&search_word='+search_word;
	}
	location.href = '/admin/work/work.do?action=list'+url;
}

//정렬 스크립트
function fn_chgSort(obj){
	var url = '';
	
	var classify = getParam('classify');
	var sort = $(obj).val();
	var year = getParam('year');
	var month = getParam('month');
	var search_word = getParam('search_word');
	if(classify != ''){
		url += '&classify='+classify;
	}
	if(sort != ''){
		url += '&sort='+sort;
	}
	if(year != ''){
		url += '&year='+year;
	}
	if(month != ''){
		url += '&month='+month;
	}
	if(search_word != ''){
		url += '&search_word='+search_word;
	}
	location.href = '/admin/work/work.do?action=list'+url;
}

//view 페이지 이동
function fn_viewWork(board_no) {
	var url = '';
	
	var classify = getParam('classify');
	var sort = getParam('sort');
	var year = getParam('year');
	var month = getParam('month');
	var search_word = getParam('search_word');
	var curPage = getParam('curPage');
	
	if(classify != ''){
		url += '&classify='+classify;
	}
	if(sort != ''){
		url += '&sort='+sort;
	}
	if(year != ''){
		url += '&year='+year;
	}
	if(month != ''){
		url += '&month='+month;
	}
	if(search_word != ''){
		url += '&search_word='+search_word;
	}
	if(curPage != ''){
		url += '&curPage='+curPage;
	}
	
	location.href = '/admin/work/work_view.do?board_no='+board_no+url;
}

//list 페이지 이동 (목록)
function fn_listWork() {
	var url = '';
	
	var classify = getParam('classify');
	var sort = getParam('sort');
	var year = getParam('year');
	var month = getParam('month');
	var search_word = getParam('search_word');
	var curPage = getParam('curPage');
	
	if(classify != ''){
		url += '&classify='+classify;
	}
	if(sort != ''){
		url += '&sort='+sort;
	}
	if(year != ''){
		url += '&year='+year;
	}
	if(month != ''){
		url += '&month='+month;
	}
	if(search_word != ''){
		url += '&search_word='+search_word;
	}
	if(curPage != ''){
		url += '&curPage='+curPage;
	}
	location.href = '/admin/work/work.do?action=list'+url;
	
}

//edit 페이지 이동
function fn_modifyWork(board_no){
	var url = '';
	
	var classify = getParam('classify');
	var sort = getParam('sort');
	var year = getParam('year');
	var month = getParam('month');
	var search_word = getParam('search_word');
	var curPage = getParam('curPage');
	
	if(classify != ''){
		url += '&classify='+classify;
	}
	if(sort != ''){
		url += '&sort='+sort;
	}
	if(year != ''){
		url += '&year='+year;
	}
	if(month != ''){
		url += '&month='+month;
	}
	if(search_word != ''){
		url += '&search_word='+search_word;
	}
	if(curPage != ''){
		url += '&curPage='+curPage;
	}
	location.href = '/admin/work/work_edit.do?board_no='+board_no+url;
}

//삭제
function fn_deleteWork() {
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
				url:"/admin/work/handler/deletework.do",
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
function fn_deleteWorkOne() {
	if(confirm("삭제하시겠습니까?")){
		var chkArr = [];
		var board_no = $('#board_no').val();
		chkArr.push(board_no);
		$.ajax({
			url:"/admin/work/handler/deletework.do",
			type:"GET",
			dataType : 'text',
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data:{"chkArr":chkArr},
			success:function(data){
				alert(data);
				fn_listWork();
			},error:function(request,status,error){
				console.log("error" +error);
			}

		});
	}
}

//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
$('#btn_save').click(function(){
	var frm = $('#workFrm');
	// 에디터의 내용이 textarea에 적용된다.
    oEditors.getById["de_contents"].exec("UPDATE_CONTENTS_FIELD", [ ]);
 	var title = $('#title');
 	var board_classify_cd = $('#board_classify_cd');
 	var project_start_dt = $('#project_start_dt');
 	var project_end_dt = $('#project_end_dt');
 	var project_client = $('#project_client');
 	var project_keyword = $('#project_keyword');
 	var file1 = $('#file1');
 	var file2 = $('#file2');
 	var file3 = $('#file3');
 	var contents = $('#contents');
 	var de_contents = $('#de_contents');
 	
 	//상단고정 by영훈
    if($("#top_chk").is(":checked") == true){
        $("#top_yn").val("Y");
    }else{
    	$("#top_yn").val("N");
    }

 	//사용여부 체크박스
 	if($('#use_chk').is(":checked") == true){
 		$('#use_yn').val("Y");
 	}else{
 		$('#use_yn').val("N");
 	}
 	//대외비 체크박스
 	if($('#view_chk').is(":checked") == true){
 		$('#view_yn').val("N");
 	}else{
 		$('#view_yn').val("Y");
 	}
 	//목록형 체크박스
 	if($('#list_type_chk').is(":checked") == true){
 		$('#list_type_yn').val("Y");
 	}else{
 		$('#list_type_yn').val("N");
 	}
 	

	
    if(title.val().trim() == '' || title.val() == null){
    	alert("프로젝트명을 입력해주세요.");
    	title.focus();
		return false;
    }else if(board_classify_cd.val().trim() == '' || board_classify_cd.val() == null){
    	alert("프로젝트 분류를 선택해주세요.");
    	board_classify_cd.focus();
		return false;
    }else if(project_start_dt.val().trim() == '' || project_start_dt.val() == null){
    	alert("프로젝트 시작일을 입력해주세요.");
    	project_start_dt.focus();
		return false;
    }else if(project_end_dt.val().trim() == '' || project_end_dt.val() == null){
    	alert("프로젝트 종료일을 입력해주세요.");
    	project_end_dt.focus();
		return false;
    }else if((project_client.val().trim() == '' || project_client.val() == null) && $('#list_type_yn').val() != 'Y'){
    	alert("고객사를 입력해주세요.");
    	project_client.focus();
		return false;
    }else if(project_keyword.val().trim() == '' || project_keyword.val() == null){
    	alert("키워드를 입력해주세요.");
    	project_keyword.focus();
		return false;
    }else if(file1.val().trim() == '' || file1.val() == null){
    	alert("썸네일용 로고 이미지를 첨부해주세요.");
    	file1.focus();
		return false;
    }else if(file2.val().trim() == '' || file2.val() == null){
    	alert("썸네일 이미지를 첨부해주세요.");
    	file2.focus();
		return false;
    }else if((file3.val().trim() == '' || file3.val() == null) && $('#view_yn').val() != 'N'){
    	alert("상세 상단 비주얼 이미지를 첨부해주세요.");
    	file3.focus();
		return false;
    }else if((contents.val().trim() == '' || contents.val() == null) && $('#view_yn').val() != 'N'){
    	alert("프로젝트 소개글을 입력해주세요.");
    	contents.focus();
		return false;
    }else if((de_contents.val().trim() == '<br>' || de_contents.val().trim() == '' || de_contents.val() == null) && $('#view_yn').val() != 'N'){
    	alert("상세내용을 입력해주세요.");
    	de_contents.focus();
		return false;
    }else{
    	if(confirm("저장하시겠습니까?")){
    		var url = "";
	    	frm.attr('action', '/admin/work/handler/insertwork.do');
			frm.submit();
    	}else{
    		return false;
    	}
    }
});

//수정
$('#btn_modify').click(function(){
	var frm = $('#workFrm');
	// 에디터의 내용이 textarea에 적용된다.
    oEditors.getById["de_contents"].exec("UPDATE_CONTENTS_FIELD", [ ]);
 	var title = $('#title');
 	var board_classify_cd = $('#board_classify_cd');
 	var project_start_dt = $('#project_start_dt');
 	var project_end_dt = $('#project_end_dt');
 	var project_client = $('#project_client');
 	var project_keyword = $('#project_keyword');
 	var contents = $('#contents');
 	var de_contents = $('#de_contents');
 	console.log(de_contents.val());
 	//상단고정 by영훈
    if($("#top_chk").is(":checked") == true){
        $("#top_yn").val("Y");
    }else{
    	$("#top_yn").val("N");
    }
    
 	//사용여부 체크박스
 	if($('#use_chk').is(":checked") == true){
 		$('#use_yn').val("Y");
 	}else{
 		$('#use_yn').val("N");
 	}
 	//대외비 체크박스
 	if($('#view_chk').is(":checked") == true){
 		$('#view_yn').val("N");
 	}else{
 		$('#view_yn').val("Y");
 	}
 	//목록형 체크박스
 	if($('#list_type_chk').is(":checked") == true){
 		$('#list_type_yn').val("Y");
 	}else{
 		$('#list_type_yn').val("N");
 	}
 	
	
	
    if(title.val().trim() == '' || title.val() == null){
    	alert("프로젝트명을 입력해주세요.");
    	title.focus();
		return false;
    }else if(board_classify_cd.val().trim() == '' || board_classify_cd.val() == null){
    	alert("프로젝트 분류를 선택해주세요.");
    	board_classify_cd.focus();
		return false;
    }else if(project_start_dt.val().trim() == '' || project_start_dt.val() == null){
    	alert("프로젝트 시작일을 입력해주세요.");
    	project_start_dt.focus();
		return false;
    }else if(project_end_dt.val().trim() == '' || project_end_dt.val() == null){
    	alert("프로젝트 종료일을 입력해주세요.");
    	project_end_dt.focus();
		return false;
    }else if((project_client.val().trim() == '' || project_client.val() == null) && $('#list_type_yn').val() != 'Y'){
    	alert("고객사를 입력해주세요.");
    	project_client.focus();
		return false;
    }else if(project_keyword.val().trim() == '' || project_keyword.val() == null){
    	alert("키워드를 입력해주세요.");
    	project_keyword.focus();
		return false;
    }else if((contents.val().trim() == '' || contents.val() == null) && $('#view_yn').val() != 'N'){
    	alert("프로젝트 소개글을 입력해주세요.");
    	contents.focus();
		return false;
    }else if((de_contents.val().trim() == '<br>' || de_contents.val().trim() == '' || de_contents.val() == null) && $('#view_yn').val() != 'N'){
    	alert("상세내용을 입력해주세요.");
    	de_contents.focus();
		return false;
    }else{
    	if(confirm("수정하시겠습니까?")){
    		var url = "";
    		var classify = getParam('classify');
    		var sort = getParam('sort');
    		var year = getParam('year');
    		var month = getParam('month');
    		var search_word = getParam('search_word');
    		var curPage = getParam('curPage');
    		
    		if(classify != ''){
    			url += '&classify='+classify;
    		}
    		if(sort != ''){
    			url += '&sort='+sort;
    		}
    		if(year != ''){
    			url += '&year='+year;
    		}
    		if(month != ''){
    			url += '&month='+month;
    		}
    		if(search_word != ''){
    			url += '&search_word='+search_word;
    		}
    		if(curPage != ''){
    			url += '&curPage='+curPage;
    		}
	    	frm.attr('action', '/admin/work/handler/updatework.do?action=update'+url);
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