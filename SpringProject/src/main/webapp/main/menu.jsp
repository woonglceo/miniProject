<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.mainNav {
    background-color: #34568B;
    list-style: none;
}

.mainNav li {
	  display: inline-block; /* 글자들이 옆으로 정렬된다 */
}
.mainNav li a:hover{
	color: #f0ffff;
	background-color: #98B4D4;
}
.mainNav li a {
	  padding: 0 13px; /* 상하, 좌우 */
	  color: #ffffff;
	  text-decoration: none;
	  /*   폰트굵기 크기/line-height  나눔고딕 없으면 sans-serif로 대체해라 */
	  font: bold 16px/40px 'Nanum Gothic', sans-serif; 
	  text-shadow: -1px 0 #000, 0 1px #000, 1px 0 #000, 0 -1px #000;
	  
}
</style>

<ul class="mainNav">
  <c:if test="${sessionScope.memId == null}">
    <li><a href="/SpringProject/member/write" id="register">회원가입</a>
  </c:if>
  
    <li><a href="/SpringProject/board/boardList?pg=1">글목록</a>
    <li><a href="/SpringProject/imageboard/imageboardList">이미지목록</a>
    <li><a href="/SpringProject/guestbook/guestbookList?pg=1">방명록목록</a>
    <li><a href="/SpringProject/guestbook/guestbookWriteForm" id="guestbookWriteA">방명록쓰기</a>
  
  <c:if test="${sessionScope.memId != null}">
    <li><a href="/SpringProject/board/boardWriteForm">글쓰기</a>
    <li><a href="/SpringProject/imageboard/imageboardWriteForm">이미지등록</a>
  </c:if> 
</ul>

