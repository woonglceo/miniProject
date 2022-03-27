<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form id="">
<table border="1" cellspacing="0" cellpadding="5">
		<tr>
			<td width="100" align="center">제목</td>
			<td>
				<input type="text" size="45" name="subject" id="subject" placeholder="제목 입력">
				<!-- <div id="nameDiv" style="border: 1px solid red; font-size: 8pt; color: red;"></div> -->
			<div id="subjectDiv"></div>
		</td>	
	</tr>
	
	<tr>
		<td width="100" align="center">내용</td>
		<td>
			<textarea rows="15" cols="50" name="content" id="content" placeholder="내용 입력"></textarea>
			<div id="contentDiv"></div>
		</td>	
	</tr>
	
	<tr>
		<td colspan="2" align="center">
			<input type="button" id="boardWriteBtn" value="글작성">
			<input type="reset" id="resetBtn" value="다시작성">
		</td>
	</tr>
</table>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$('#boardWriteBtn').click(function() {
		$('#subjectDiv').empty();
		$('#contentDiv').empty();
		
		if ($('#subject').val() == '') {
			$('#subjectDiv').text('제목을 입력하세요');
		} else if ($('#content').val() == '') {
			$('#contentDiv').text('글내용을 입력하세요');
		} else {
			$.ajax({
				type: 'POST',
				url: '/SpringProject/board/boardWrite',
				data: {
					'subject': $('#subject').val(),
					'content': $('#content').val()
				},
				success: function(){
					alert("글쓰기 성공");
					//location.href = '/SpringProject/board/boardList?pg=1';
				},
				error: function(err){
					alert(err);
				}
			});//end ajax
		}//end if
	});//end click

	$('#resetBtn').click(function(){
		$('#subject').val('');
		$('#content').val('');
	});//end click
	
</script>
