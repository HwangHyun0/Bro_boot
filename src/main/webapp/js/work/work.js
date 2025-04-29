window.onload  = function() {
	/*스크롤 이동*/
	var selector = getParam('selector');
	if(selector != ''){
		var offset = $("#boardItem_"+selector).offset();
		$('html, body').animate({scrollTop : offset.top}, 400);
	}
}
$(document).ready(function(){
	/*left 메뉴 active*/
	var classify = getParam('classify');
	
	var val = $('#m_depth2 option');//셀렉트박스 옵션
	if(classify != ''){
		$('#depth2_'+classify).addClass('active');
		$('#m_depth2_'+classify).prop('selected','selected');
	}else{
		$('#depth2_all').addClass('active');
		$('#m_depth2_all').prop('selected','selected');
	}
	
	/*스크롤 이동*/
	/*var selector = getParam('selector');
	if(selector != ''){
		var offset = $("#boardItem_"+selector).offset();
		$('html, body').animate({scrollTop : offset.top}, 400);
	}*/
	
});

var moreIndex = $('#moreIndex').val();
var pageCnt = $('#pageCnt').val();
//페이징
function fn_moreWork(){
	moreIndex++;
	
	var url = '';
	var classify = getParam('classify');
	var copyright1 = '';
	var copyright2 = '';
	
	if(classify != ''){
		url += '?classify='+classify;
	}
	
	if(moreIndex%5 == 1){
		copyright1 = '고객<br>중심의<br>기술서비스';
		copyright2 = '철저한<br>분석을 통한<br>UI설계';
	}else if(moreIndex%5 == 2){
		copyright1 = '좋은<br>디자인과<br>편리한<br>서비스';
		copyright2 = '더 나은<br>서비스,<br>경험';
	}else if(moreIndex%5 == 3){
		copyright1 = '경험을<br>통한<br>편한 UI';
		copyright2 = '새로운<br>가치<br>전달';
	}else if(moreIndex%5 == 4){
		copyright1 = '인간중심의<br>기술<br>가치';
		copyright2 = '소통과<br>몰입의<br>방법론';
	}else if(moreIndex%5 == 0){
		copyright1 = '고객과<br>사용자의<br>소통';
		copyright2 = '전문적인<br>기술<br>서비스';
	}
	
	$.ajax({
		url:'/work/handler/work.do'+url,
		type:'GET',
		data:{'moreIndex':moreIndex},
		dataType:'json',
		success:function(data){
			if(data.length == 0){
				alert('마지막 게시글입니다.');
			}else{
				$('#moreIndex').val(moreIndex);
				$('.contents.up').removeClass('up');
				var html = '';
				for(var i=0;i<data.length;i++){
					var date = [];
					if(data[i].project_start_dt != '' && data[i].project_start_dt != null){
						date = data[i].project_start_dt.split('-');
					}
					if(i == 4){
						html += '<div class="work_item copyright">';
						html +=    '<div class="item">';
						html +=        '<div class="txt left">';
						html +=            '<p>'+copyright1+'</p>';
						html +=        '</div>';
						html +=    '</div>';
						html += '</div>';
					}
					if(i == 10){
						html += '<div class="work_item copyright">';
						html +=    '<div class="item">';
						html +=        '<div class="txt right">';
						html +=            '<p>'+copyright2+'</p>';
						html +=        '</div>';
						html +=    '</div>';
						html += '</div>';
					}
					html += '<div class="work_item">';
					html += '	<a href="javascript:fn_viewWork('+data[i].board_no+','+'\''+data[i].view_yn+'\''+');" class="item">';
					html += '		<div class="img_box">'
					html += '    		<figure class="bg"><img src="'+(data[i].thumb_file_list[0]!=null?data[i].thumb_file_list[0].file_path:'')+'/'+(data[i].thumb_file_list[0]!=null?data[i].thumb_file_list[0].re_file_nm:'')+'"></figure>';
					html += '    		<div class="logo">';
					html += '    			<img src="'+(data[i].logo_file_list[0]!=null?data[i].logo_file_list[0].file_path:'')+'/'+(data[i].logo_file_list[0]!=null?data[i].logo_file_list[0].re_file_nm:'')+'">';
					html += '    		</div>';
					html += '    	</div>';
					if(data[i].view_yn=='N'){
						html += '    <div class="info confidential">';
					}else{
						html += '    <div class="info">';
					}
					html += '    		<div class="date">';
					html += '    			<span class="year">'+(date[0]!=null?date[0]:'')+'</span>';
					html += '    			<span class="month">'+(date[1]!=null?date[1]:'')+'</span>';
					html += '    		</div>';
					html += '    		<div class="txt">';
					html += '    			<span class="hashtag">';
					if(data[i].project_keyword_list!=null){
						for(var j=0; j<data[i].project_keyword_list.length;j++){
							html += '    				<span>'+data[i].project_keyword_list[j]+'</span>';
						}
					}else{
							html += '    				';
					}
					html += '    			</span>';
					html += '    			<strong class="tit">'+data[i].title+'</strong>';
					html += '    		</div>';
					if(data[i].view_yn=='N'){
						html += '		<span class="confi_txt">대외비 프로젝트로 상세를 지원하지 않습니다.</span>';
					}
					html += '    	</div>';
					html += '    </a>';
					html += '</div>';
				}
				$('#work_list').append(html);
				
				//ui
				if($('.work_list').length){
		            
		            // fontsize addClass
		            var windowW = $(window).outerWidth();
		            var item_nth = ['17n+1','17n+4','17n+13'];

		            function mainAddClass(e){
		                $('.work_list').children().removeClass('font01');
		                for(var i = 0; i < item_nth.length; i ++){
		                    $('.work_list').children(':nth-child(' + item_nth[i] +')').addClass('font01')
		                }
		            }

		            if(windowW > 1720){ // 한 열에 최대 4개 (1720~1920)
		                var item_nth = ['17n+1','17n+4','17n+13'];
		                mainAddClass();
		            }else if(windowW <= 1720 && windowW > 768){ // 한 열에 최대 3개 (1400 ~ 1719)
		                var item_nth = ['17n+1','17n+4','17n+11','17n+13'];
		                mainAddClass();                
		            }else if(windowW <= 768){ // 모바일 (~ 768)
		                $('.work_list').children().removeClass('font01');
		            }
		        }
				
				//현재 주소를 가져온다.
				var renewURL = location.href;
				renewURL = renewURL.replace(/\?classify=([0-9]+)/ig,'');
				renewURL = renewURL.replace(/\&classify=([0-9]+)/ig,'');
				renewURL = renewURL.replace('?action=list','');
				renewURL = renewURL.replace(/\&moreIndex=([0-9]+)/ig,'');
				renewURL = renewURL.replace(/\&selector=([0-9]+)/ig,'');
				var classify = getParam('classify');
				if(classify != ''){
					renewURL += '?action=list&classify='+classify+'&moreIndex='+moreIndex;
				}else{
					renewURL += '?action=list&moreIndex='+moreIndex;
				}
				history.pushState(null, null, renewURL);
				
				if(moreIndex == pageCnt){
					$('.btn_more').hide();
				}
			}
			
		},error:function(error){
			console.log("error" +error);
		}

	});
}

//view 페이지 이동
function fn_viewWork(board_no, view_yn){
	if(view_yn != 'N'){
		var url = '';
		
		var classify = getParam('classify');
		var moreIndex = $('#moreIndex').val();
		
		if(classify != ''){
			url += '&classify='+classify;
		}
		if(moreIndex != ''){
			url += '&moreIndex='+moreIndex;
		}else{
			url += '&moreIndex=1'
		}
		
		location.href='/work/work_view.do?board_no='+board_no+url;
	}else{
		alert("대외비 프로젝트로 상세를 지원하지 않습니다.");
	}
}

function fn_viewPrevWork(board_no, prevMoreIndex) {
	var url = '';
	
	var classify = getParam('classify');
	var moreIndex = prevMoreIndex;
	
	if(classify != ''){
		url += '&classify='+classify;
	}
	if(moreIndex != ''){
		url += '&moreIndex='+moreIndex;
	}else{
		url += '&moreIndex=1'
	}
	if(board_no != null && board_no != ''){
		location.href='/work/work_view.do?board_no='+board_no+url;
	}else{
		alert("이전글이 없습니다.")
	}
}

function fn_viewNextWork(board_no, nextMoreIndex) {
	var url = '';
	
	var classify = getParam('classify');
	var moreIndex = nextMoreIndex;
	
	if(classify != ''){
		url += '&classify='+classify;
	}
	if(moreIndex != ''){
		url += '&moreIndex='+moreIndex;
	}else{
		url += '&moreIndex=1'
	}
	if(board_no != null && board_no != ''){
		location.href='/work/work_view.do?board_no='+board_no+url;
	}else{
		alert("다음글이 없습니다.")
	}
}

//list 페이지 이동 (목록)
function fn_listWork(){
	var url = '';
	
	var classify = getParam('classify');
	var moreIndex = getParam('moreIndex');
	var selector = getParam('board_no');
	
	if(classify != ''){
		url += '&classify='+classify;
	}
	if(moreIndex != ''){
		url += '&moreIndex='+moreIndex;
	}else{
		url += '&moreIndex=1'
	}
	if(selector != ''){
		url += '&selector='+selector;
	}
	
	location.href='/work/work.do?action=list'+url;
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
