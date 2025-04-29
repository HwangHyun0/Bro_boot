$(document).ready(function(){
	$('#careers_tab').addClass('active');
	
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
    $('#year').append('<option value="'+nyear+'">'+nyear+'</option>');
    $('#year').append('<option value="'+(nyear-1)+'">'+nyear+' 이전</option>');
    
    /*연도 selected*/
    var year_val = getParam('year');
	if(year_val != null && year_val != ''){
		$("#year").val(year_val);
	}
	
	/*분류 selected*/
	var classify_val = getParam('classify');
	if(classify_val != null && classify_val != ''){
		$("#select_applicant_classify_cd02").val(classify_val);
	}
});

//페이징
function fn_paging(curPage){
	var url = '';
	var year = getParam('year');
	var search_word = getParam('search_word');
	var classify = getParam('classify');
	if(year != ''){
		url += '&year='+year;
	}
	if(search_word != ''){
		url += '&search_word='+search_word;
	}
	if(classify != ''){
		url += '&classify='+classify;
	}
	
	location.href = "?curPage="+curPage+url;
}

//검색 스크립트
function fn_search(){
	var url = '';
	var search_word = $('#search_word').val();
	var year = getParam('year');
	var classify = getParam('classify');
	if(year != ''){
		url += '&year='+year;
	}
	if(classify != ''){
		url += '&classify='+classify;
	}
	if(search_word.trim() == '' || search_word == null){
		alert("이름을 입력해주세요.");
		return false;
	}else{
		location.href='/admin/careers/careers.do?search_word='+search_word+url;
	}
}

//연도 스크립트
function fn_chgYear(obj){
	var url = '';
	var year = $(obj).val();
	var classify = getParam('classify');
	var search_word = getParam('search_word');
	if(classify != ''){
		url += '&classify='+classify;
	}
	if(search_word != ''){
		url += '&search_word='+search_word;
	}
	location.href = '/admin/careers/careers.do?year='+year+url;
}

//분류 스크립트
function fn_chgClassify(obj){
	var url = '';
	var classify = $(obj).val();
	var year = getParam('year');
	var search_word = getParam('search_word');
	if(year != ''){
		url += '&year='+year;
	}
	if(search_word != ''){
		url += '&search_word='+search_word;
	}
	location.href = '/admin/careers/careers.do?classify='+classify+url;
}

//view 페이지 이동
function fn_viewCareers(applicant_no) {
	var url = '';
	var curPage = getParam('curPage');
	var year = getParam('year');
	var search_word = getParam('search_word');
	var classify = getParam('classify');
	if(curPage != ''){
		url += '&curPage='+curPage;
	}
	if(year != ''){
		url += '&year='+year;
	}
	if(search_word != ''){
		url += '&search_word='+search_word;
	}
	if(classify != ''){
		url += '&classify='+classify;
	}
	location.href = '/admin/careers/careers_view.do?applicant_no='+applicant_no+url;
}

//list 페이지 이동 (목록)
function fn_listCareers() {
	var url = '';
	var curPage = getParam('curPage');
	var year = getParam('year');
	var search_word = getParam('search_word');
	var classify = getParam('classify');
	if(curPage != ''){
		url += '?curPage='+curPage;
	}else{
		url += '?curPage=1';
	}
	if(year != ''){
		url += '&year='+year;
	}
	if(search_word != ''){
		url += '&search_word='+search_word;
	}
	if(classify != ''){
		url += '&classify='+classify;
	}
	location.href = '/admin/careers/careers.do'+url;
	
}

//삭제
function fn_deleteCareers() {
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
				url:"/admin/careers/handler/deletecareers.do",
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
function fn_deleteCareersOne() {
	if(confirm("삭제하시겠습니까?")){
		var chkArr = [];
		var applicant_no = $('#applicant_no').val();
		chkArr.push(applicant_no);
		$.ajax({
			url:"/admin/careers/handler/deletecareers.do",
			type:"GET",
			dataType : 'text',
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data:{"chkArr":chkArr},
			success:function(data){
				alert(data);
				fn_listCareers();
			},error:function(request,status,error){
				console.log("error" +error);
			}

		});
	}
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