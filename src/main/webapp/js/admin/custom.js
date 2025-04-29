$(document).ready(function(){
	var minDate = new Date();
	var maxDate = new Date();
	maxDate = $('.cal-wrap2 input').val();
	minDate = $('.cal-wrap1 input').val();
	//달력(인풋)
	$('.cal-wrap1 input').datepicker({
        language: "kr",
        dayNames:['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
        dayNamesMin:['일','월','화','수','목','금','토'],
        monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        changeMonth:true,
        changeYear:true,
        daysOfWeekHighlighted: "0",
        showOn:'button',
        dateFormat:'yy-mm-dd',
        todayBtn: 'linked',
        autoclose:true,
        maxDate : maxDate,
        onClose: function( selectedDate ) {    
            $(".cal-wrap2 input").datepicker( "option", "minDate", selectedDate );
        }           
    });
	
	$('.cal-wrap2 input').datepicker({
        language: "kr",
        dayNames:['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
        dayNamesMin:['일','월','화','수','목','금','토'],
        monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        changeMonth:true,
        changeYear:true,
        daysOfWeekHighlighted: "0",
        dateFormat:'yy-mm-dd',
        showOn:'button',
        todayBtn: 'linked',
        autoclose:true,
        minDate : minDate,
        onClose: function( selectedDate ) {    
            $(".cal-wrap1 input").datepicker( "option", "maxDate", selectedDate );
        }   
    });
	
    $('.cal-wrap3 input').datepicker({
        language: "kr",
        daysOfWeekHighlighted: "0",
        dateFormat:'yy-mm-dd',
        showOn:'button',
        //todayHighlight: true,
        todayBtn: 'linked',
        autoclose:true
    });

    //popup 열기
    $('.pop-open').click(function(){
        $('.pop-up').show();
    });

    //popup 닫기
    /*$('.pop-btn .cancel').click(function(){
        $('.pop-up').hide();
    });*/

    //popup 썸네일업로드
    var fileTarget = $('.file .upload-hidden');
    fileTarget.on('change', function(){ // 값이 변경되면
    	var files = $(this)[0].files;
		var filename = '';
		var filesize = 0;
		var maxsize = 30 * 1024 * 1024;
        if(window.FileReader){ // modern browser
			for(var i= 0; i<files.length; i++){
				filesize += files[i].size;
				if (i == 0){
					filename += files[i].name;
				}else{
					filename += '/'+files[i].name;
				}
            }
        } else { // old IE
            //var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
        }
        //max size 체크
        if(filesize > maxsize){
        	alert('30MB이하의 파일만 등록할 수 있습니다.');
        	$(this).val("");
        	$(this).parent().siblings('.upload-name').val('');
        }else{
        	//추출한 파일명 삽입
        	$(this).parent().siblings('.upload-name').val(filename);
        }
    });
});