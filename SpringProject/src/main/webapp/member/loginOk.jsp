<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h3>${ sessionScope.memName }님 로그인</h3>

<input type="button" value="회원정보수정" 
	onclick="location.href='/SpringProject/member/modifyForm'">
<input type="button" id="logoutBtn" value="로그아웃">

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$('#logoutBtn').click(function(){
	$.ajax({
		type: 'post',
		url: '/SpringProject/member/logout',
		success: function(){
			alert('로그아웃');
			location.href='/SpringProject/index.jsp';
		},
		error: function(err){
			alert(err);
		}
	});
});
</script>
















