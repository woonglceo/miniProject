$(function(){
	$.ajax({
		type: 'POST',
		url: '/SpringProject/board/getBoardList',
		data: 'pg=' + $('#pg').val(),		
		dataType: 'JSON',
		success: function(data){
			//console.log(JSON.stringify(data));
			console.log('data', data);
			
			$('#boardListTable tr:gt(0)').remove(); //gt(0)는 0보다 큰 애를 뜻한다(Greater Than)
			
			$.each(data.list, function(index, items){
				$('<tr/>')			
					.append($('<td/>', {    // 글번호
						align: 'center',
						text: items.seq
					})).append($('<td/>', { // 제목
						align: 'left',
						}).append($('<a/>',{
							href: '#',
							text: items.subject,
							class: 'subjectA   subjectA_' + items.seq 
						}))
					).append($('<td/>', {	// 작성자
						align: 'center',
						text: items.id
					})).append($('<td/>', {	// 작성일
						align: 'center',
						text: items.logtime
					})).append($('<td/>', {	// 조회수
						align: 'center',
						text: items.hit
					})).appendTo($('#boardListTable'));	
					
					//답글
					for(i = 0; i < items.lev; i++){
						$('.subjectA_' + items.seq).before('&emsp;');
					}
					if(items.pseq != 0){
						$('.subjectA_' + items.seq).before($('<img/>',{
							src: '/SpringProject/image/reply.gif'
						}));
					}
			
			});//end each
			
			// 로그인 여부
			$('.subjectA').click(function(){
				var seq = $(this).parent().prev().text();
				
				if(data.memId == null){
					alert('먼저 로그인하세요');
				} else {
					location.href='/SpringProject/board/boardView?seq='+seq+'&pg='+$('#pg').val();
				}
			});//end click
			
			// 페이징 처리
			$('#boardPagingDiv').html(data.boardPaging.pagingHTML);
		},
		error: function(err){
			alert('오류떳다~');
		}
	});
});//end onload


//검색
$('#boardSearchBtn').click(function(){
	if($('#keyword').val() == '') {
		alert('검색어를 입력하세요')
	} else {
		$.ajax({
			type: 'POST',
			url: '/SpringProject/board/getBoardSearchList',
			data: $('#boardSearchForm').serialize(), //searchOption, keyword, searchPg
			dataType: 'JSON',
			success: function(data){
				$('#boardListTable tr:gt(0)').remove(); //gt(0)는 0보다 큰 애를 뜻한다(Greater Than)
			
			$.each(data.list, function(index, items){
				$('<tr/>')			
					.append($('<td/>', {    // 글번호
						align: 'center',
						text: items.seq
					})).append($('<td/>', { // 제목
						align: 'left',
						}).append($('<a/>',{
							href: '#',
							text: items.subject,
							class: 'subjectA   subjectA_' + items.seq 
						}))
					).append($('<td/>', {	// 작성자
						align: 'center',
						text: items.id
					})).append($('<td/>', {	// 작성일
						align: 'center',
						text: items.logtime
					})).append($('<td/>', {	// 조회수
						align: 'center',
						text: items.hit
					})).appendTo($('#boardListTable'));	
					
					//답글
					for(i = 0; i < items.lev; i++) {
						$('.subjectA_' + items.seq).before('&emsp;');
					}
					if(items.pseq != 0) {
						$('.subjectA_' + items.seq).before($('<img/>', {
							src: '/SpringProject/image/reply.gif'
						}));
					}
			
			});//end each
			
			// 페이징 처리
			$('#boardPagingDiv').html(data.boardPaging.pagingHTML);
			
			},
			error: function(err){
				alert('오류떳다아아ㅏ~~');
				console.log('err', err);
			}
		});//end ajax
	}
	
	
	
});//end click
