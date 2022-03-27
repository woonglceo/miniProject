<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h3>이미지 등록</h3>

<!-- 1. 단순 submit -->
<form id="imageboardWriteForm" method="post" enctype="multipart/form-data"
 action="/SpringProject/imageboard/imageboardWrite">
	<table border="1" cellspacing="0" cellpadding="5">
		<tr>
			<td width="100" align="center">상품코드</td>
			<td>
				<input type="text" name="imageId" size="50">
				</td>
		</tr>
		<tr>
			<td width="100" align="center">상품명</td>
			<td>
				<input type="text" name="imageName" size="50">
				</td>
		</tr>
		<tr>
			<td width="100" align="center">단가</td>
			<td>
				<input type="text" name="imagePrice" size="50">
				</td>
		</tr>
		<tr>
			<td width="100" align="center">개수</td>
			<td>
				<input type="text" name="imageQty" size="50">
				</td>
		</tr>
		<tr>
			<td width="100" align="center">내용</td>
			<td><textarea rows="15" cols="50" name="imageContent"></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="file" name="img">
			</td>
		</tr>
		
		<tr>
			<td colspan="2">
				<input type="file" name="img">	<!-- 파일 두개 올릴땐 name을 같게 해야 controller가 배열로 받는다. -->
			</td>
		</tr>
		
		<tr>
			<td colspan="2">
				<input type="file" name="img[]" multiple> <!-- 파일을 한번에 여러개 선택(드래그) -->
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="button" id="imageboardWriteBtn" value="이미지등록">
				<input type="reset" value="다시작성">
			</td>
		</tr>
	</table>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$('#imageboardWriteBtn').click(function(){
	//1. 단순 submit
	$('#imageboardWriteForm').submit();
	
	//2. AJAX 통신
	/* 
	$.ajax({
		type:
		url:
		data:
		success:
		error:
		
	});//end ajax
	 */
});//end click 
</script>
