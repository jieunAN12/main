<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="home.jsp" %>
	<div class="header">
		<table width="100%" border="0">
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
					<c:if test="${sessionScope.adminId != null}">
						<li><a href="/main/memberList.do">회원관리</a></li>
					</c:if>
					<c:if test="${sessionScope.adminId == null}">
						<li><a href="/main/alogin.do">관리자로그인</a></li>
					</c:if>
					<li><a href="/main/list.do">게시판</a></li>
					<li><a href="/main/plist.do">쇼핑</a></li>
				</ul>
			</div>
		</c:if>
		<c:if test="${sessionScope.userId == null}">
			<div class="col-3 col-m-3 menu">
				<!-- 왼쪽 카테고리 -->
				<ul>
					<li><a href="/main/login.do">로그인</a> / <a href="/main/alogin.do">관리자로그인</a></li>
					<li><a href="/main/memberForm.do">회원가입</a></li>
				</ul>
			</div>
		</c:if>

	<div class="col-6 col-m-9">