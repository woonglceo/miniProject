<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%! String name = "홍길동"; %> <!-- 전역변수 -->

<% int age = 25; %>  		 <!-- 지역변수 --> --%>
    
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보 수정</title>
	<style type="text/css">
		#modifyForm div {
			color: red;
			font-size: 8px;
			font-weight: bold;
		}
	</style>
	
</head>
<body>
<form name="modifyForm" id="modifyForm" method="post" action="/SpringProject/member/modify">
	<table border="1" cellspacing="0" cellpadding="5">
		<tr>
			<td width="100" align="center">이름</td>
			<td>
				<input type="text" name="name" id="name" placeholder="이름 입력">
				<div id="nameDiv"></div>
			</td>	
		</tr>
		
		<tr>
			<td width="100" align="center">아이디</td>
			<td>
				<input type="text" name="id" id="id" readonly>
			</td>	
		</tr>
		
		<tr>
			<td width="100" align="center">비밀번호</td>
			<td>
				<input type="password" name="pwd" id="pwd" size="30" placeholder="비밀번호 입력">
				<div id="pwdDiv"></div>
			</td>	
		</tr>
		
		<tr>
			<td width="100" align="center">재확인</td>
			<td>
				<input type="password" name="repwd" id="repwd" size="30" placeholder="비밀번호 입력">
				<div id="repwdDiv"></div>
			</td>	
		</tr>
		
		<tr>
			<td width="100" align="center" >성별</td>
			<td>
				<input type="radio" name="gender" value="0">남
				<input type="radio" name="gender" value="1">여
			</td>
		</tr>
		
		<tr>
			<td width="100" align="center">이메일</td>
			<td>
				<input type="text" name="email1" id="email1">
				@
				<input type="text" name="email2"  id="email2" list="email2" placeholder="직접입력">
				<datalist id="email2">
					<option value="naver.com">naver.com
					<option value="daum.net">daum.net
					<option value="gmail.com">gmail.com
				</datalist>
			</td>
		</tr>
		
		<tr>
			<td width="100" align="center">핸드폰</td>
			<td>
				<select name="tel1">
					<option value="010" selected>010</option>
					<option value="011" >011</option>
					<option value="019" >019</option>
				</select>
				-
				<input type="text" name="tel2" size="6" maxlength="4"  id="tel2">
				-
				<input type="text" name="tel3" size="6" maxlength="4" id="tel3">
			</td>
		</tr>
		
		<tr>
			<td width="100" align="center">주소</td>
			<td>
				<input type="text" name="zipcode" id="zipcode" readonly>
				<input type="button" value="우편번호 검색" onclick="checkPost()"><br>
				<input type="text" name="addr1" id="addr1" size="60" placeholder="주소" readonly><br>
				<input type="text" name="addr2" id="addr2" size="60" placeholder="상세주소">
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="button" id="modifyBtn" value="정보 수정">
				<!-- <input type="reset" value="다시작성"> -->
			</td>
		</tr>
	</table>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
//$(document).ready(function(){
$(function(){ 
	
	console.log('${memberDTO}'); 
	$('#name').val('${memberDTO.name}'); 
	$('#id').val("${memberDTO.id}");
	document.modifyForm.gender['${memberDTO.gender}'].checked = true;
	$('#email1').val("${memberDTO.email1}");
	$('#email2').val("${memberDTO.email2}");
	$('#tel1').val("${memberDTO.tel1}");
	$('#tel2').val("${memberDTO.tel2}");
	$('#tel3').val("${memberDTO.tel3}");
	$('#zipcode').val("${memberDTO.zipcode}");
	$('#addr1').val("${memberDTO.addr1}");
	$('#addr2').val("${memberDTO.addr2}");
	
	
	
});//end onload

$('#modifyBtn').click(function(){
	$('#nameDiv').empty();
	$('#idDiv').empty();
	$('#pwdDiv').empty();
	$('#repwdDiv').empty();
	
	let a = $('#idDiv').val();
	console.log("text: " + a);
	
	if($('#name').val() == '') {$('#nameDiv').text('이름 입력');}
	else if($('#id').val() == '') {$('#idDiv').text('아이디 입력');}
	else if($('#pwd').val() == '') {$('#pwdDiv').text('비밀번호 입력');}
	else if($('#pwd').val() != $('#repwd').val()) {$('#repwdDiv').text('비밀번호가 맞지 않습니다.');}
	else {
		$.ajax(function(){
			type: 'POST',
			url: '/SpringProject/member/modify',
			data: $('#modifyForm').serialize(),
			success: function(){
				alert('수정완료');
				location.href='/SpringProject/index.jsp';
			},
			error: function(err){
				alert('에러뜸');
			}
		});//end ajax
	}
});//end click

function checkPost() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            //var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                //if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    //extraAddr += data.bname;
                //}
                // 건물명이 있고, 공동주택일 경우 추가한다.
                //if(data.buildingName !== '' && data.apartment === 'Y'){
                    //extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                //}
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                //if(extraAddr !== ''){
                    //extraAddr = ' (' + extraAddr + ')';
                //}
                // 조합된 참고항목을 해당 필드에 넣는다.
                //document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                //document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("addr1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addr2").focus();
        }
    }).open();
}//end checkPost
</script>
</body>
</html>