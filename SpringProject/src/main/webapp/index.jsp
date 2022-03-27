<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>미니 프로젝트</title>
	<style>
	  body {
	  	margin: 0;
	  	padding: 0;
	  	height: 100%;
	  	width: auto;
	  }
	  
	  #header {
	  	margin: auto;
	  	width: 100%;
	  	height: 10%;
	  	text-align: center;
	  	text-shadow: -1px 0 #000, 0 1px #000, 1px 0 #000, 0 -1px #000;
	  }
	  
	  #container {
	  	margin: auto;
	  	width: 100%;
	  	height: 700px;
	  	border: 1px red solid;
	  }
	  
	  #container:after {	/* 컨테이너가 끝나는 지점 */
	  	content: '';
	  	display: block;
	  	clear: both;
	  	float: none;
	  }
	  
	  #nav {
	  	margin-left: 10px;
	  	width: 25%;
	  	height: 100%;
	  	float: left;
	  }
	  
	  #section {
	  	width: 73%;
	  	height: 100%;
	  	float: left;
	  }
	  
	  #footer {	
	  	width: 100%;
	  	height: 10%;
	  	border: 1px blue solid;
	  }
	</style>
</head>
<body style="background: linear-gradient(0deg,#FFFAF0 , #6495ED); color: white;">
	<!-- div는 반응형이라서 header, footer 태그대신 사용한다. -->
	<div id="header" style="border: 1px red solid">
		<h1>
		  <img alt="logo" src="/SpringProject/image/images.png" width="70" height="70"
		  onclick="location.href='/SpringProject/index.jsp'" style="cursor: pointer;"> MVC 기반의 스프링 프로젝트
		</h1>
		<br>
		<jsp:include page="/main/menu.jsp" /> <!-- 01/07 1702 --> 
	</div>
	
	<div id="container">
		<div id="nav" style="border: 1px green solid;">
			<jsp:include page="/main/nav.jsp" />
		</div>	
		
		<div id="section" style="border: 1px green solid;">
			<c:if test="${empty display}">
				<h1 style="text-shadow: -1px 0 #000, 0 1px #000, 1px 0 #000, 0 -1px #000">
					홈페이지를 방문해주셔서 감사합니다<br>
					Have a wonderful day!<br>
					<img src="/SpringProject/image/Landscape-Color.jpg" alt="배경 사진" width="400" height="300" >
				</h1>	
			</c:if>
			<c:if test="${not empty display}">
				<jsp:include page="${display}" />
			</c:if>
		</div>
	</div>
	
	<div id="footer">
		<p>비트캠프</p>
	</div>
	
</body>
</html>