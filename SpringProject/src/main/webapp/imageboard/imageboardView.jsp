<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#imageContentSpan pre{
	text-align: left;
}
#imageboardViewTable td{
	text-align: center;
}

</style>
<input type="text" name="seq" id="seq" value="${seq}">
<input type="text" name="pg" value="${pg}">
<table border="1" id="imageboardViewTable">
	<tr>
		<td rowspan="4">
		  <img id="image1" width="150" height="auto">
		</td>
		<th >상품명</th>
		<td><span id="imageNameSpan"></span></td>
	</tr>

	<tr>
		<th>단가</th>
		<td><span id="imagePriceSpan"></span></td>
	</tr>
	
	<tr>
		<th>개수</th>
		<td><span id="imageQtySpan"></span></td>
	</tr>
	
	<tr>
		<th>합계</th>
		<td><span id="imageTotalSpan"></span></td>
	</tr>
	
	<tr>
		<td colspan="3" width="150" height="150">
		  <pre style="white-space: pre-line; word-break:break-all;">
		    <span id="imageContentSpan"></span>
		  </pre>
		</td>
	</tr>
</table>
<input type="button" value="목록" 
onclick="location.href='/SpringProject/imageboard/imageboardList?pg=${pg}'">


<script type="text/javascript">
$(function(){
	$.ajax({
		type: 'POST',
		url: '/SpringProject/imageboard/getImageboardView',
		data: 'seq=' + $('#seq').val(),
		success: function(dto){
			console.log(dto);
			$('#image1').attr('src', '/SpringProject/storage/' + dto.image1);
			$('#imageNameSpan').text(dto.seq);
			$('#imagePriceSpan').text(dto.imagePrice.toLocaleString());
			$('#imageQtySpan').text(dto.imageQty.toLocaleString());
			$('#imageTotalSpan').text((dto.imagePrice*dto.imageQty).toLocaleString());
			$('#imageContentSpan').text(dto.imageContent);
		},
		error: function(err){
			alert('에러떳다잉~~');
			console.log(err);
		}
	});//end ajax
});
</script>
