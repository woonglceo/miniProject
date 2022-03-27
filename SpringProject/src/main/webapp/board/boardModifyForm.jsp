<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form id="boardModifyForm" name="boardModifyForm">
<input type="text" name="seq" id="seq" value="${seq}">
<input type="text" name="pg" id="pg" value="${pg}">

<table border="1" cellspacing="0" cellpadding="5">
		<tr>
			<td width="100" align="center">제목</td>
			<td>
				<input type="text" size="45" name="subject" id="subject">
				<div id="subjectDiv"></div>
			</td>	
		</tr>
		
		<tr>
			<td width="100" align="center">내용</td>
			<td>
				<textarea rows="15" cols="50" name="content" id="content"></textarea>
				<div id="contentDiv"></div>
			</td>	
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="button" id="boardModifyBtn" value="글작성">
				<input type="reset" id="resetBtn" value="다시작성">
			</td>
		</tr>
	</table>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		type: 'post',
		url: '/SpringProject/board/getBoardView',
		data: 'seq=' + $('#seq').val(),
		dataType: 'JSON',
		success: function(data){
			console.log(data);
			
			$('#content').val(data.boardDTO.content);
			$('#subject').val(data.boardDTO.subject);
		},
		error: function(err){
			alert('오류났습니다 선생님');
		}
		
	});
	
});

// 수정버튼
$('#boardModifyBtn').click(function(){
	$('#subjectDiv').empty();
	$('#contentDiv').empty();
	
	if($('#subject').val() == ''){
		$('#subjectDiv').text('제목을 입력하세요');
	} else if ($('#content').val() == ''){
		$('#contentDiv').text('내용을 입력하세요');
	} else {
		$.ajax({
			type: 'POST',
			url: '/SpringProject/board/boardModify',
			data: $('#boardModifyForm').serialize(),
			success: function(){
				alert('수정 되었습니다.');
				location.href='/SpringProject/board/boardList?pg=' + ${pg};
			},
			error: function(err){
				alert('오류났습니다 선생님');
				console.log(err);
			}
		});
	}
});
</script>