<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<%@ include file="../body1.jsp" %>
<%@ include file="menu.jsp" %>
	<c:if test="${msg == 'success'}">
	<h2>${sessionScope.adminName}
	(${sessionScope.adminId})님 오셨슴까~~.</h2>
	</c:if>
	
	${result}
<%@ include file="../footer.jsp" %>