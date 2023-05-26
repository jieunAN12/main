<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="header.jsp"%>

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
<form method="post" action="member" name="memberForm">
	<table width="450" border="1" align="center" cellspacing="0" cellpadding="5">
		<tr>
			<td colspan="2" align="center">회원가입</td>
		</tr>
		<tr>
			<td width="150">아이디</td>
			<td><input type="text" name="userId" size=30></td>
		</tr>
		<tr>
			<td width="150">비밀번호</td>
			<td><input type="password" name="userPw" size=30></td>
		</tr>
		<tr>
			<td width="150">이름</td>
			<td><input type="text" name="userName" size=30></td>
		</tr>
		<tr>
			<td width="150">Email</td>
			<td><input type="email" name="userEmail" size=30></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="submit" name="Submit" value="회원가입"></td>
		</tr>
	</table>
</form>
<!-- 본문 끝 -->

<%@ include file="footer.jsp"%>