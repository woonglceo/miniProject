<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
#boardListTable th {
	font-size: 20px;
	text-shadow: -1px 0 #000, 0 1px #000, 1px 0 #000, 0 -1px #000;
	
}

#boardListTable td{
	font-size: 14px;
	color: snow;
	text-shadow: -1px 0 #808080, 0 1px #808080, 1px 0 #808080, 0 -1px #808080;
}

#boardListTable{
	border-color: gray;
}

.subjectA:link{color: snow; text-decoration: none;}
.subjectA:visited{color: snow; text-decoration: none;}
.subjectA:hover{color: cyan; text-decoration: underline;}
.subjectA:active{color: snow; text-decoration: none;}

#boardPagingDiv span {
	margin: 0 5px;
	padding: 10px;
	border: 1px white solid;
} 

#currentPaging {
	color: red;
	cursor: pointer;
}

#paging {
	color: white;
	cursor: pointer;
}
</style>

<input type="hidden" id="pg" value="${param.pg}">
<table id="boardListTable" border="1" cellspacing="0" cellpadding="5" frame="hsides" rules="rows">
	<tr>
		<th width="100">글번호</th>
		<th width="300">제목</th>
		<th width="100">작성자</th>
		<th width="100">작성일</th>
		<th width="100">조회수</th>
	</tr>
</table>
<div id="boardPagingDiv" style="margin:20px 0;"></div>

<div id="searchDiv" style="text-align: center;" >
<form id="boardSearchForm" >
   <input type="hidden" id="searchPg" name="pg" value="1">
   <select id="searchOption" name="searchOption" >
      <option value="subject">제목</option>
      <option value="id">작성자</option>
   </select>
   <input type="text" id="keyword" name="keyword" >
   <input type="button" id="boardSearchBtn" value="검색">
</form>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/SpringProject/js/boardList.js"></script> 
<script type="text/javascript">
function boardPaging(pg2){
	var keyword = $('#keyword').val();
	
	if(keyword == '') {
		location.href = '/SpringProject/board/boardList?pg=' + pg2;
	} else {
		$('#searchPg').val(pg2);
		$('#boardSearchBtn').trigger('click'); //강제 이벤트 발생
		$('#searchPg').val(1);
	}
}
</script>
	