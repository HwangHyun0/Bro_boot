<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html> 
<head>
	<meta charset="UTF-8">
</head>
	<body> 
		<script type="text/javascript"> 
			var message = '${msg}'; 
			var returnUrl = '${url}'; 
			alert(message); 
			document.location.href = returnUrl; 
		</script>
	</body>
</html> 