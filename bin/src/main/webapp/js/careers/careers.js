$(document).ready(function(){
});

//파일 업로드 커스텀
var fileTarget = $('.file_box .upload-hidden');
fileTarget.on('change', function(){
	var files = $(this)[0].files;
	var filename = '';
	var filesize = 0;
	var maxsize = 30 * 1024 * 1024;
	
    if(window.FileReader){
		for(var i= 0; i<files.length; i++){
			filesize += files[i].size;
			if (i == 0){
				filename += files[i].name;
			}else{
				filename += '/'+files[i].name;
			}
        }
    } else { 
    }
    
    //max size 체크
    if(filesize > maxsize){
    	alert('30MB이하의 파일만 등록할 수 있습니다.');
    	$(this).val("");
    	$(this).siblings('.upload-name').html('이력서, 포트폴리오 등 1개로 압축하여 올려주세요. 포트폴리오는 PDF로 올려주세요. (최대 30MB)');
    }else{
    	//추출한 파일명 삽입
    	$(this).siblings('.upload-name').html(filename);
    }
});

//mob 지원분야
function fn_selectApplicantCd02Mob(){
	var applicant_cd02 = '';
	applicant_cd02 = $('#applicant_classify_cd02_mob').val();
	$('#applicant_classify_cd02').val(applicant_cd02);
}
//pc 지원분야
function fn_selectApplicantCd02Pc(applicant_cd02){
	$('#applicant_classify_cd02').val(applicant_cd02);
}

//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
$('#btn_save').click(function(){
	var frm = $('#careersFrm');
	
	var applicant_classify_cd02 = $('#applicant_classify_cd02');
	var applicant_nm = $('#applicant_nm');
	var applicant_email = $('#applicant_email');
	var applicant_tel = $('#applicant_tel');
	var applicant_content = $('#applicant_content');
 	var file = $('#file');
 	
    if(!$('input:radio[name=applicant_classify_cd01]').is(':checked')){
    	alert("신입/경력을 선택해주세요.");
		return false;
    }else if(applicant_classify_cd02.val() == '' || applicant_classify_cd02.val() == null){
    	alert("지원분야를 선택해주세요.");
		return false;
    }else if(applicant_nm.val().trim() == '' || applicant_nm.val() == null){
    	alert("이름을 입력해주세요.");
    	applicant_nm.focus();
		return false;
    }else if(applicant_email.val().trim() == '' || applicant_email.val() == null){
    	alert("이메일을 입력해주세요.");
    	applicant_email.focus();
		return false;
    }else if(applicant_tel.val().trim() == '' || applicant_tel.val() == null){
    	alert("전화번호를 입력해주세요.");
    	applicant_tel.focus();
		return false;
    }else if(applicant_content.val().trim() == '<br>' || applicant_content.val().trim() == ''){
    	alert("지원 내용을 입력해주세요.");
    	applicant_content.focus();
		return false;
    }else if(file.val().trim() == '' || file.val() == null){
    	alert("파일을 첨부해주세요.");
		return false;
    }else if($('#agree_chk').is(":checked") != true){
 		alert("개인정보보호정책에 동의해주세요.");
		return false;
 	}else{
 		$('#agree_yn').val("Y");
 		
    	if(confirm("제출하시겠습니까?")){
	    	frm.attr('action', '/careers/handler/insertcareers.do');
			frm.submit();
    	}else{
    		return false;
    	}
    }
});
