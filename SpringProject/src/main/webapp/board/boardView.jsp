<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form id="boardViewForm">
	<input type="text" id="seq" name="seq" value="${param.seq}">
	<input type="text" id="pg" name="pg" value="${param.pg}">
	
	<table id="boardViewTable" border="1" cellspacing="0" cellpadding="5" frame="hsides" rules="rows">
		<tr>
			<td colspan="3"> <!-- colspan으로 3칸을 병합시킨다 -->
				<h3><span id="subjectSpan"></span></h3> <!-- span 태그는 크기를 내용 만큼만 잡는다 -->
			</td> 
		</tr>
		<tr>		
			<td width="150">글번호: <span id="seqSpan"></span></td>
			<td width="150">작성자: <span id="idSpan"></span></td>
			<td width="150">조회수: <span id="hitSpan"></span></td>
		</tr>
		<tr>
			<!-- valign - https://developer.mozilla.org/ko/docs/Web/CSS/vertical-align -->
			<td colspan="3" height="200" valign="top">
				<pre style="white-space: pre-line; word-break:break-all;">
					<span id="contentSpan"></span>
				</pre>
			</td>
		</tr>
	</table>
</form>

<input type="button" value="목록" onclick="location.href='/SpringProject/board/boardList?pg=${param.pg}'">

<span id="boardViewSpan">
	<input type="button" value="글수정" onclick="mode(1)"> <!-- seq, pg -->
	<input type="button" value="글삭제" onclick="mode(2)"> <!-- seq -->
</span>

<input type="button" value="답글" onclick="mode(3)"> <!-- seq(원글번호), pg(원글이 있는 페이지 번호) -->

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <script type="text/javascript" src="/miniProject/js/boardView.js"></script> -->
<script>
$(function(){
	$.ajax({
		type: 'POST',
		url: '/SpringProject/board/getBoardView',
		data: 'seq=' + $('#seq').val(),	
		dataType: 'JSON',
		success: function(data){
			console.log(data);
			
			$('#subjectSpan').text(data.boardDTO.subject);
			$('#seqSpan').text(data.boardDTO.seq);
			$('#idSpan').text(data.boardDTO.id);
			$('#hitSpan').text(data.boardDTO.hit);
			$('#contentSpan').text(data.boardDTO.content);	
			
			console.log('memId', data.memId);
			console.log('id', data.boardDTO.id);
			
			if(data.memId == data.boardDTO.id){
				$('#boardViewSpan').show();
			} else {
				$('#boardViewSpan').hide();
			}
		},
		error: function(err){
			alert('오류가 떠버렸삼');
		}
	});
});//end onload

function mode(num){
	if (num == 1){	 //글 수정
		document.getElementById("boardViewForm").method = 'POST';
		document.getElementById("boardViewForm").action = '/SpringProject/board/boardModifyForm';
		document.getElementById("boardViewForm").submit();
		
	} else if (num == 2){	//글 삭제
		document.getElementById("boardViewForm").method = 'POST';
		document.getElementById("boardViewForm").action = '/SpringProject/board/boardDelete';
		document.getElementById("boardViewForm").submit();
		
	} else if (num == 3){  //답글, seq(원글번호), pg(원글이 있는 페이지 번호)
		document.getElementById("boardViewForm").method = 'POST';
		document.getElementById("boardViewForm").action = '/SpringProject/board/boardReplyForm';
		document.getElementById("boardViewForm").submit();
	}
}//end mode function

</script>