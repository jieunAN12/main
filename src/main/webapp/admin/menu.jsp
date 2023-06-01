<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp"%>

<a href="/main/memberList.do">회원관리</a> |
<a href="/main/plist.do">상품목록</a> |
<c:if test="${sessionScope.adminId != null }">
	<a href="/main/pwrite.do">상품등록</a> |
</c:if>

<c:choose>
	<c:when test="${sessionScope.userId == null }">
		<a href="/main/login.do">[로그인]</a> |
	</c:when>
	<c:when test="${sessionScope.adminId == null }">
		<a href="/main/alogin.do">[관리자로 로그인]</a> |	
	</c:when>
	<c:otherwise>
		${sessionScope.userName }님이 로그인 중 입니다. |
		<a href="/main/logout.do">로그아웃</a>
	</c:otherwise>
</c:choose>
<hr>
