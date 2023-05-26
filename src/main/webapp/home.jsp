<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<c:choose>
<c:when test="${sessionScope.userId == null }">
<a href = "/main/login.do">로그인</a>
</c:when>
<c:otherwise>
	${sessionScope.userName }님이 로그인 중 입니다.
	<a href = "/main/logout.do">로그아웃</a>
</c:otherwise>
</c:choose>

<c:if test="${msg = 'success' }">
<h2>${sessionScope.userName }(${sessionScope.userId })님 환영합니다.</h2>
</c:if>