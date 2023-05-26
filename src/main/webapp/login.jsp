<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>

<meta charset="UTF-8">
<title>로그인페이지</title>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function() {
	$("#btnLogin").click(function(){
		var userId = $("#userId").val();
		var userPw = $("#userPw").val();
		if(userId == ""){
			alert("아이디를 입력하세요.");
			$("#userId").focus();
			return;
		}
		if(userPw == ""){
			alert("비밀번호를 입력하세요.");
			$("#userPw").focus();
			return;
		}
		document.form1.action = "/main/loginCheck.do"
		document.form1.submit();
	});
});
</script>
</head>

<body>
<%@ include file="home.jsp" %>
	<div class="header">
		<table width="100%" border="0">
			<tr>
				<td><a href="index.jsp">HOME</a></td>
				<td height="25"></td>
			</tr>
			<tr bgcolor="#99ccff">
				<td colspan="2" height="1"></td>
			</tr>
			<tr>
				<td colspan='2' height='50' bgcolor='#f0f0f0'>
					<!-- 메인카테고리 -->
				</td>
			</tr>
			<tr bgcolor="#99ccff">
				<td colspan="2" height="1"></td>
			</tr>
		</table>
	</div>

	<div class="row">
		<c:if test="${sessionScope.userId != null}">
			<div class="col-3 col-m-3 menu">
				<!-- 왼쪽 카테고리 -->
				<ul>
					<li><a href="./member.jsp">회원추가</a></li>
					<li><a href="/main/list.do">게시판</a></li>
					<li><a href="notice/noticeList.jsp">공지사항</a></li>
					<li><a href="pds/pdsList.jsp">첨부형 게시판</a></li>
					<li><a href="#">front</a></li>
				</ul>
			</div>
		</c:if>
		<c:if test="${sessionScope.userId == null}">
			<div class="col-3 col-m-3 menu">
				<!-- 왼쪽 카테고리 -->
				<ul>
					<li><a href="/main/login.do">로그인</a></li>
					<li><a href="./member.jsp">회원가입</a></li>
				</ul>
			</div>
		</c:if>

	<div class="col-6 col-m-9">

	<!-- 본문 시작 bbsForm.jsp-->
	<h2>로그인</h2>
	<form name="form1" method="post">
		<table board="1" width="400px">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="userId" id="userId"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="userPw" id="userPw"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="button" id="btnLogin">로그인</button>
					<c:if test="${msg == 'failure'}">
						<div style="color : red">
						아이디 또는 비밀번호가 일치하지 않습니다.
						</div>
					</c:if>
					<c:if test="${msg == 'logout'}">
						<div style="color : red">
						로그아웃 되었습니다.
						</div>
					</c:if>
				</td>
			</tr>
		</table>
	</form>
	<!-- 본문 끝 -->

<%@ include file="footer.jsp"%>