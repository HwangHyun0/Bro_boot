$(document).ready(function(){
});
var moreIndex = $('#moreIndex').val();
var pageCnt = $('#pageCnt').val();
//페이징
function fn_moreWork(){
	moreIndex++;
	
	$.ajax({
		url:'/news/handler/news.do',
		type:'GET',
		data:{'moreIndex':moreIndex},
		dataType:'json',
		success:function(data){
			if(data.length == 0){
				alert('마지막 게시글입니다.');
			}else{
				console.log(data[0]);
				$('#moreIndex').val(moreIndex);
				var html = '';
				for(var i=0;i<data.length;i++){
					var date = [];
					if(data[i].publish_dt != '' && data[i].publish_dt != null){
						date = data[i].publish_dt.split('-');
					}
					html += '<li>';
					html += '	<a class="tit03" href="javascript:;">'+data[i].title+'</a>';
					html += '	<div class="news_box">';
					html += '		<div class="tit03">'+data[i].title+'</div>';
					html += '		<div class="day">'+(date[0]!=null?date[0]:'')+'. '+(date[1]!=null?date[1]:'')+'</div>';
					html += '		<div class="txt">'+data[i].de_contents+'</div>';
					html += '	</div>';
					html += '</li>';
					
				}
				$('#news_list').append(html);
				
				//ui
				$('.news_box').hide();
			    $('.news_list > ul > li.active').children('.tit03').hide();
			    $('.news_list > ul > li.active').children('.news_box').show();
			    $(".news_list > ul > li > a").off("click");
			    $('.news_list > ul > li > a').on('click', function(){
			        $('.news_box').stop().slideUp(500);
			        if(!$(this).parent().hasClass('active')){
			            $('.news_list .depth1 > li > .tit03').show();
			            $(this).parent().siblings().removeClass('active');
			            
			            $(this).hide();
			            $(this).parent().addClass('active');
			            $(this).siblings('.news_box').stop().slideDown(500);
			        }
			    });
			    
				//현재 주소를 가져온다.
				var renewURL = location.href;
				renewURL = renewURL.replace(/\?moreIndex=([0-9]+)/ig,'');
				renewURL += '?moreIndex='+moreIndex;
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
