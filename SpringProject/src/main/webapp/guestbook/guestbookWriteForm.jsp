<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<h3>방명록 작성</h3>
<form id="guestbookWriteForm" type="POST">
<table border="1" cellspacing="0" cellpadding="5">
	<tr>
		<td width="100" align="center">작성자</td>
		<td><input type="text" id="name" name="name" size="50"
			placeholder="작성자 입력"></td>
	</tr>
	<tr>
		<td width="100" align="center">이메일</td>
		<td><input type="email" id="email" name="email" size="50"
			placeholder="이메일 입력"></td>
	</tr>
	<tr>
		<td width="100" align="center">홈페이지</td>
		<td><input type="text" id="homepage" name="homepage" size="50"
			value="http://"></td>
	</tr>
	<tr>
		<td width="100" align="center">제목</td>
		<td><input type="text" id="subject" name="subject" size="50"
			placeholder="제목 입력">
			<div id="subjectDiv"></div></td>
	</tr>
	<tr>
		<td width="100" align="center">내용</td>
		<td><textarea rows="15" cols="50" id="content" name="content"
				placeholder="내용 입력"></textarea>
			<div id="contentDiv"></div></td>
	</tr>

	<tr>
		<td colspan="2" align="center">
			<input type="button" id="guestbookWriteBtn" value="방명록작성"> 
			<input type="reset"	value="다시작성"> 
			<input type="button" value="방명록목록" onclick="location.href='/SpringProject/guestbook/guestbookList?pg=1'">
		</td>
	</tr>
</table>
</form>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$('#guestbookWriteBtn').click(function() {
		$('#subjectDiv').empty();
		$('#contentDiv').empty();

		if ($('#subject').val() == '')
			$('#subjectDiv').text('제목을 입력하세요');
		else if ($('#content').val() == '')
			$('#contentDiv').text('내용을 입력하세요');
		else {
			$.ajax({
				type : 'POST',
				url : '/SpringProject/guestbook/guestbookWrite',
				data : {
					'name' : $('#name').val(),
					'email' : $('#email').val(),
					'homepage' : $('#homepage').val(),
					'subject' : $('#subject').val(),
					'content' : $('#content').val() 
				},
				success : function() {
					alert("방명록 쓰기 성공");
					location.href = '/SpringProject/guestbook/guestbookList?pg=1';
				},
				error : function(err) {
					alert(err);
				}
			});//end ajax
		}//end if
	});//end click
</script>