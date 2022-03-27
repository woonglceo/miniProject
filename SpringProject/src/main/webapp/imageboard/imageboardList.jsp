<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
#imageboardListTable th{
	font-size: 16px;
}

#imageboardListTable td{
	font-size: 13px;
}

#imageboardListTable{
	border-color:yellow;
	margin-left: 10pt;
}

#imageboardPagingDiv{
	text-align: center;
	margin: 10px 0;
}

#currentPaging {
	color: red;
	text-decoration: underline;
	cursor: pointer;
}

#paging {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
/* a태그 활성화순간 */
.imageNameA:link{
      color: white;
      text-decoration:none;
}
/* 클릭당한경험 유 */
.imageNameA:visited{
      color: white;
      text-decoration:none;
}
/* 마우스올라왔을때 */
.imageNameA:hover{
      color: green;
      text-decoration:underline;
}
/* 마우스클릭동안 */
.imageNameA:active{
      color: cyan;
      text-decoration:none;
}
</style>

<form name="" action="/SpringProject/imageboard/imageboardDelete">
<input type="text" id="pg" value="${pg}">
<table border="1" cellspacing="0" cellpadding="5" id="imageboardListTable" frame="hsides" rules="rows">
	<tr>
		<th width="100">
			<input type="checkbox" id="all">글번호</th>
		<th width="100">이미지</th>
		<th width="150">상품명</th>
		<th width="150">단가</th>
		<th width="100">개수</th>
		<th width="150">합계</th>
	</tr>
</table>
<div id="imageboardPagingDiv"></div>

<input type="Button" id="imageboardDeleteBtn" value="선택삭제" style="float: left; margin: 5px 10px;">
<div style="text-align: center; width:750px; font-size: 15pt;"></div>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		type: 'POST',
		url: '/SpringProject/imageboard/getImageboardList',
		data: 'pg=' + $('#pg').val(),
		dataType: 'JSON',
		success: function(data){
			console.log('data', data);
			
			$.each(data.list, function(index, dto){
				$('<tr/>').append($('<td/>', {
					align: 'center',
					text: dto.seq
					}).prepend($('<input/>', {
						type: 'checkbox',
						name: 'check',
						value: dto.seq
					}))
				).append($('<td/>', {
					align: 'center',
					}).append($('<img/>', {
						src: '/SpringProject/storage/' + dto.image1,
						style: 'width: 70px; height: 70px; cursor: pointer;',
//						class: 'img_' + dto.seq //이미지 클릭 했을 때 - 첫번째 방법
						class: 'img' //이미지 클릭 했을 때 - 두번째 방법
					}))
				).append($('<td/>', {
					align: 'center',
					text: dto.imageName
				})).append($('<td/>', {
					align: 'center',
					text: dto.imagePrice.toLocaleString()
				})).append($('<td/>', {
					align: 'center',
					text: dto.imageQty.toLocaleString()
				})).append($('<td/>', {
					align: 'center',
					text: (dto.imagePrice * dto.imageQty).toLocaleString()
				})).appendTo($('#imageboardListTable'));
				

				//이미지 클릭 했을 때 - 첫번째 방법
				$('.img_' + dto.seq).click(function(){
					alert('번호 = ' + dto.seq);
					location.href = '/SpringProject/imageboard/imageboardView?seq='+dto.seq+'&pg='+$('#pg').val()
				});
			});//end each
			
			//이미지 클릭 했을 때 - 두번째 방법
			$('.img').click(function(){
				//alert($(this).parent().prev().text());
				var seq = $(this).parent().prev().text();
				location.href = '/SpringProject/imageboard/imageboardView?seq='+seq+'&pg='+$('#pg').val();
			}); 
			
			//페이징 처리
			$('#imageboardPagingDiv').html(data.imageboardPaging.pagingHTML);
		},
		error: function(err){
			alert('오류떳다요~~~~~');
			console.log('err', err);
		}
	});//end ajax
});//end onload

//전체 선택 또는 해제
$('#all').click(function(){
	if($('#all').prop('checked')) {
		$('input[name=check]').prop('checked', true);
	} else {
		$('input[name=check]').prop('checked', false);
	}
});//end click
</script>

<script type="text/javascript">
function imageboardPaging(pg2){
	location.href="/SpringProject/imageboard/imageboardList?pg="+pg2;
}
</script>























