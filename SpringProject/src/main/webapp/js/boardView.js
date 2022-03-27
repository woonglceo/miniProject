$(function(){
	$.ajax({
		type: 'post',
		url: '/miniProject/board/getBoardView.do',
		data: 'seq=' + $('#seq').val(),	// 요청시에 함께 보낼 파라미터
		dataType: 'json',
		success: function(data){
			console.log(JSON.stringify(data));
			
			$('#subjectSpan').text(data.subject);
			$('#seqSpan').text(data.seq);
			$('#idSpan').text(data.id);
			$('#hitSpan').text(data.hit);
			$('#contentSpan').text(data.content);
			
			if(data.memId == data.id){
				//console.log("memId == id? " + (data.memId == data.id));
				$('#boardViewSpan').show();
			} else {
				$('#boardViewSpan').hide();
			}
		},
		error: function(err){
			console.log(err);
		}
		
		
	});
});//end onload