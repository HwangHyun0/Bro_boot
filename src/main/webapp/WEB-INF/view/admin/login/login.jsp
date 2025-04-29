<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ANDW ADMIN - LOGIN</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin/style.css">
</head>
<body>
<div class="wrap login-page">
	<div class="contents">
        <div class="logo-area">
			<p class="login-tit">Admin Login</p>
		</div>
        <form id="loginFrm" method="post" action="">
        <div class="login_con">
			<div class="well">
				<fieldset>
					<div class="form-group">
						<input id="member_id" name="member_id" placeholder="ID">
					</div>
					<div class="form-group">
						<input id="member_pwd" name="member_pwd" type="password" placeholder="password" class="bt-n">
					</div>
					<button type="submit" id="login">Login</button>
				</fieldset>
			</div><!-- // -->
        </div>
	    </form>
	    <div class="login_txt">
	    	<p>brocorgi 관리자페이지입니다.</p>
	    	<p>로그인 후 이용하실 수 있습니다.</p>
	    	<span></span>
	    </div>
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath }/js/jquery-3.4.1.min.js"></script>
<script>
	var msg = '${msg}';
	var url = '${url}';

	$('#login').on('click',function(){
		var frm = $('#loginFrm');
		if($('#member_id').val().trim() == ''){
			alert("아이디를 입력해주세요");
			$('#member_id').val("");
			$('#member_id').focus();
			return false;
		}else if($('#member_pwd').val().trim() == '' ){
			alert("비밀번호를 입력해주세요");
			$('#member_pwd').val("");
			$('#member_pwd').focus();
			return false;
		}else{
			frm.attr('action', '/login/handler/login.do');
			frm.submit();
		}
		
	});
</script>
</html>