<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>${CINFO.cname}</title>
<meta charset="UTF-8">
<meta name="viewport"
      content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"
/>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link rel="stylesheet" type="text/css" href="/boa/css/w3.css">
<link rel="stylesheet" type="text/css" href="/boa/css/user.css">
<link rel="stylesheet" type="text/css" href="/boa/css/c/ez.css">
<link rel="stylesheet" type="text/css" href="/boa/css/k/soyeon.css">
<script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>
<script type="text/javascript" src="/boa/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/boa/js/c/board.js"></script>
<script type="text/javascript" src="/boa/js/k/main.js"></script>
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Lato", sans-serif}
.w3-bar,h1,button {font-family: "Montserrat", sans-serif}
.fa-anchor,.fa-coffee {font-size:200px}
</style>
</head>
<body>
	<%-- Navbar --%>
	<div class="w3-top fix">
		<div class="w3-bar w3-indigo w3-card w3-left-align w3-xlarge">
			<a class="w3-bar-item w3-button w3-hide-small w3-padding w3-hover-white " id="main">Main</a>
			<a class="w3-bar-item w3-button w3-hide-small w3-padding w3-hover-white" id="collection">Collection</a>
<c:if test="${not empty SID}">
			<a class="w3-bar-item w3-button w3-hide-small w3-padding w3-hover-white" id="mwrite">Write</a>
			<a class="w3-bar-item w3-button w3-hide-small w3-padding w3-hover-white" id="mcoll">New Collection</a>
</c:if>
			<div style="float: right; padding-right:30px;"> 
<c:if test="${empty SID}">
				<a class="w3-bar-item w3-button w3-hide-small w3-padding w3-hover-white " id="mjoin">Join</a>
				<a class="w3-bar-item w3-button w3-hide-small w3-padding w3-hover-white " id="mlogin">Login</a>
</c:if>
<c:if test="${not empty SID}">
				<a class="w3-bar-item w3-button w3-hide-small w3-hover-white" id="message">
				<img  src="/boa/resources/img/k/message.png" style=" width:55px; height:35px;">
				</a>
				<a class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" id="msid">${SID}</a>
				<a class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"id="mlogout">Logout</a>
</c:if>
			</div>
		</div>
	</div>
   
	<%-- Header --%>
	<header class="w3-container w3-indigo w3-center" style="padding:40px 16px; height: 200px;">
<c:if test="${empty CINFO}">
		<h1 class="pdt40 w3-xxxlarge dfn"><b>선택된 컬렉션이 없습니다.</b></h1>
</c:if>
<c:if test="${not empty CINFO}">
		<h1 class="pdt40 w3-xxxlarge dfn"><b>${CINFO.cname}</b></h1>
</c:if>
	</header>
   
	<%-- First Grid --%>
	<div class="w3-row-padding w3-padding-64 w3-container">
		<div class="w3-col w3-display-container w3-center">
			<div class="w3-border-bottom inline w900 w3-margin-bottom">
				<h3 class="mgl10">${CINFO.descr}</h3>
<c:if test="${not empty CINFO.genre}">
		<c:forEach var="gnr" items="${CINFO.genre}">
				<div class="genre w3-round w3-left w3-margin-bottom">${gnr}</div>
		</c:forEach>
</c:if>
		</div>
	
<c:if test="${empty PLIST}">
		<div class="w3-center w3-content">
			<p>불러올 게시글이 없습니다.</p>
		</div>
</c:if>
<c:if test="${not empty PLIST}">
	<c:forEach var="data" items="${PLIST}">
		<%-- 게시글 하나 박스 --%>
			<div class="w3-col w3-display-container w3-center">
				<div class="w3-border-bottom collbox w3-center w3-margin-bottom">
					<div class="thumbbox w3-border-right w3-col m2 pbox" id="${data.bno}">
					
					<%-- 이미지 작업 --%>
						<div class="thbox">
		<c:if test="${not empty  data.savename}">
							<img class="thumb" src="/boa/upload/${data.savename}">
		</c:if>
		<c:if test="${empty data.savename}">
							<img class="thumb" src="/boa/resources/img/noimage.jpg">
		</c:if>
						</div>
				
					
					
		<c:if test="${data.price ne 0}">
						<h4 class="inline nomg">${data.price}P</h4>
		</c:if>
					</div>
					<div class="colldetail w3-margin-left w3-col m7 pbox" id="${data.bno}">
						<div class="w3-padding w3-left w3-col h100" id="${data.bno}">
	<c:if test="${data.isshow eq 'A'}">
							<div class="noti w3-round w3-left">공지</div>
	</c:if>
	<c:if test="${data.forwho eq 'A'}">
							<div class="adult w3-round w3-left">성인</div>
	</c:if>
	<c:if test="${fn:length(data.title) > 15}">
			 				<h1 class="w3-left inline">${fn:substring(data.title, 0, 15)}...</h1>
	</c:if>
	<c:if test="${fn:length(data.title) <= 15}">
			 				<h1 class="w3-left inline">${data.title}</h1>
	</c:if>
						</div>
	<c:if test="${not empty data.genre}">
		<c:forEach var="gnr" items="${data.genre}">
						<div class="genre w3-round w3-left">${gnr}</div>
		</c:forEach>
	</c:if>
		<c:if test="${fn:length(data.body) > 20 }">
						<h4 class="w3-left-align c-left pdt20">${fn:substring(data.body, 0, 20)}...</h4>
		</c:if>
		<c:if test="${fn:length(data.body) <= 20 }">
						<h4 class="w3-left-align c-left pdt20">${data.body}</h4>
		</c:if>
					</div>
				
					<div class="w3-col m2" id="${data.bno}">
						<h6 class="w3-col w3-right-align pdt20 w3-text-gray">조회수 : ${data.click}</h6>
	<c:if test="${CINFO.id eq SID}">
						<div class="noti w3-right ebtn w3-round ebtn">수정</div>
						<div class="noti w3-right dbtn w3-round dbtn">삭제</div>
	</c:if>
					</div>
				
				</div>
			</div>
	</c:forEach>
</c:if>
		</div>


	</div>
	
	<%-- 페이지 처리 --%>
   <div class="w3-center">
			<div class="w3-bar w3-border w3-round-medium w3-card w3-margin-top w3-margin-bottom">
	<c:if test="${PAGE.startPage eq 1}">
				<div class="w3-bar-item w3-light-grey">&laquo;</div>
	</c:if>
	<c:if test="${PAGE.startPage ne 1}">
				<div class="w3-bar-item w3-button w3-hover-blue cpbtn" id="${PAGE.startPage - 1}">&laquo;</div>
	</c:if>
	<c:forEach var="page" begin="${PAGE.startPage}" end="${PAGE.endPage}">
			<c:if test="${page eq PAGE.nowPage}">
				<div class="w3-bar-item w3-orange">${page}</div>
			</c:if>
			<c:if test="${page ne PAGE.nowPage}">
				<div class="w3-bar-item w3-button w3-hover-blue cpbtn" id="${page}">${page}</div>
			</c:if>
	</c:forEach>
			<c:if test="${PAGE.endPage eq PAGE.totalPage}">
				<div class="w3-bar-item w3-light-grey">&raquo;</div>
			</c:if>
			<c:if test="${PAGE.endPage ne PAGE.totalPage}">
				<div class="w3-bar-item w3-button w3-hover-blue cpbtn" id="${PAGE.endPage + 1}">&raquo;</div>
			</c:if>
			</div>
		</div>
   
	<%-- Footer --%>
	<footer class="w3-container w3-padding-64 w3-center w3-opacity w3-border-top">
		<p>(주)보아라</p>
	</footer>

	<%-- 메세지창 --%>
	<c:if test="${not empty MSG}">
		<div id="modal" class="w3-modal" style="display: block;">
			<div class="w3-modal-content mxw650 w3-animate-top w3-card-4">
				<header class="boablue w3-container">
					<span onclick="document.getElementById('modal').style.display='none'"
						class="w3-button w3-display-topright">&times;</span>
						<h2>실행 결과</h2>
				</header>
				<div class="w3-container w3-center">
					<h4>${MSG}</h4>
				</div>
			</div>
		</div>
	</c:if>

	<%-- 데이터 폼 태그 --%>
	<form method="POST" name="frm" id="frm">
		<input type="hidden" name="nowPage" id="nowPage" value="${PAGE.nowPage}">
		<input type="hidden" name="cno" id="cno" value="${param.cno}">
		<input type="hidden" name="bno" id="bno">
		<input type="hidden" name="vw" id="vw" value="/boa/board/boardList.boa">
<c:if test="${not empty SID}">
		<input type="hidden" name="id" id="id" value="${SID}">
</c:if>
	</form>
<script>
// Used to toggle the menu on small screens when clicking on the menu button
function myFunction() {
  var x = document.getElementById("navDemo");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else { 
    x.className = x.className.replace(" w3-show", "");
  }
}
</script>

</body>
</html>