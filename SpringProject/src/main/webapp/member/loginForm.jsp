<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<style type="text/css">
		#loginForm div {
			color: red;
			font-size: 8px;
			font-weight: bold;
			
		}
	</style>
	<form id="loginForm">
		<input type="text" name="id" id="id" placeholder="아이디">
		<div id="idDiv"></div>
		<input type="password" name="pwd" id="pwd" placeholder="비밀번호">
		<div id="pwdDiv"></div>
		
		<input type="button" id="loginBtn" value="로그인">
		<div id="loginResult"></div>
	</form>
	
	
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	$('#loginBtn').click(function(){
		$('#loginForm #idDiv').empty();
		$('#loginForm #pwdDiv').empty();
		
		if ($('#loginForm #id').val() == '') {
			$('#loginForm #idDiv').text('아이디를 입력하세요');
		}	
		else if ($('#loginForm #pwd').val() == '') {
			$('#loginForm #pwdDiv').text('패스워드를 입력하세요');
		} else {
			$.ajax({
				type: 'POST',
				url: '/SpringProject/member/login',
				data: {
					'id': $('#loginForm #id').val(),
					'pwd': $('#loginForm #pwd').val()
				},
				success: function(data){
					data = data.trim();
					
					if (data == 'ok'){
						location.href="/SpringProject/index.jsp";						
					} else if (data == 'fail'){
						$('#loginResult').css('font-size', '15pt');
						$('#loginResult').css('font-weight', 'bold');
						$('#loginResult').css('color', 'yellow');
						$('#loginResult').text('로그인 실패');
					}
				},
				error: function(err){
					alert('오류남');
					console.log('err', err);
				}
			});//end ajax
		}
	});//end click
	</script>
	