<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
#guestbookPagingDiv{
	padding: 10px 0;
}
#currentPaging {
	color: red;
	cursor: pointer;
}
</style>
<input type="hidden" id="pg" value="${param.pg}">
<div id="guestbookPagingDiv"></div>
<div id="guestbookListDiv"></div>
<!-- <table border="1" cellspacing="0" cellpadding="5" id="guestbookTable">
	
</table> -->

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		type: 'POST',
		url: '/SpringProject/guestbook/getGuestbookList',
		data: 'pg=' + $('#pg').val(),		// pg를 꼭 넘겨줘야 한다
		dataType: 'JSON',
		success: function(data){
			console.log(data);
			
			$.each(data.list, function(index, items){
				console.log(data.list.length);
				console.log(index);
				console.log(items);
				console.log(items.name);
				
				$('<table/>', {
					border: "1",
					cellspacing: "0",
					cellpadding: "5",
                }).append(
					$('<tr/>')
						.append($('<th/>', { 
							width: '100',
							align: 'center',
							text: '작성자'
						 })).append($('<td/>', {
							width: '100',
							text: items.name
						 })).append($('<th/>', { 
							width: '100',
							align: 'center',
							text: '작성일'
						 })).append($('<td/>', {
							width: '100',
							text: items.logtime
					}))
				).append(
					$('<tr/>')
						.append($('<th/>', { 
							width: '100',
							align: 'center',
							text: '이메일'
						 })).append($('<td/>', {
							colspan: '3',
							text: items.email
					}))
				).append(
					$('<tr/>')
						.append($('<th/>', { 
							width: '100',
							align: 'center',
							text: '홈페이지'
						 })).append($('<td/>', {
							colspan: '3',
							text: items.homepage
					}))
				).append(
					$('<tr/>')
						.append($('<th/>', { 
							width: '100',
							align: 'center',
							text: '제목'
						 })).append($('<td/>', {
							colspan: '3',
							text: items.subject
					}))
				).append(
					$('<tr/>')
						.append($('<td/>', {
							colspan: '4',
							text: items.content
					}))
				
				).appendTo($('#guestbookListDiv'));
				$('<br>').appendTo($('#guestbookListDiv'));

					
			});//end each
			// 페이징 처리
			$('#guestbookPagingDiv').html(data.paging.pagingHTML);
		},
		error: function(err){
			console.log(err);
		}
	});
});//end onload

function guestbookPaging(pg2){
	location.href = '/SpringProject/guestbook/guestbookList?pg='+pg2;
}
</script>