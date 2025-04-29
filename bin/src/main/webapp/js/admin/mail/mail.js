
$("#save_btn").click(function(){
	
	//바뀌면 수정 할 부분
	var frm= $("#mailFrm");
	var mail = $("#mail");

	
	var mailval = mail.val();	
	
	//mail 체크
	if(mail.val().trim() == '' || mail.val() == null ){
		alert("메일을 입력해주세요");
	}
	//mail 형식체크
	if(! email_check(mailval) ) {
		alert("올바른 이메일 형식이 아닙니다.")
		$(this).focus();
		return false;
	}


	//id값 바뀌면 수정 부분
	//개인정보동의 
	if($("#private_chk").is(":checked") == true){
		$("#private_yn").val("Y");
	}else {
		
		alert("개인정보보호정책에 동의해주세요.");
		
		return false;
	}
	
	if(confirm("신청하시겠습니까?")){
		frm.attr("action","/mail/handler/insertmail.do");
		frm.submit();
	}
	
});

//email 형식 체크 메소드
function email_check( email ) {    
    var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    return (email != '' && email != 'undefined' && regex.test(email)); 
}



