<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %> 
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>

$(document).ready(function(){
	$("#btnAdd").click(function(){
		location.href="/main/pwrite.do";
	});
	$("#btnlist").click(function(){
		location.href="/main/clist.do";
	});
});

</script>
</head>
<body>
<%@ include file="body1.jsp"%>
<%@ include file="menu.jsp" %>
<h2> 상품 목록 </h2>

<c:if test="${sessionScope.adminId != null }">
	<button type="button" id="btnAdd">상품등록</button>
	<button type="button" id="btnlist">장바구니보기</button>
</c:if>
<br>
<table border="1">

<tr>
	<th>상품ID</th>
	<th>상품이미지</th>
	<th>상품명</th>
	<th>가격</th>
</tr>

<c:forEach var="row" items="${plist }">

<tr>
	<td>${row.productId }</td>
	<td>
		<a href="/main/detail/${row.productId }">
		<%-- <img src="${pageContext.request.contextPath}/resources/img/nike.jpg"> --%>
			<img src="${pageContext.request.contextPath}/product/images/${row.productUrl}" width="120px" height="110px">
		</a>
	</td>
	<td>
		<a href="/main/detail/${row.productId}">${row.productName }</a><br>
		<c:if test="${sessionScope.adminId != null }">
			<a href="/main/edit/${row.productId }">[상품편집]</a>
		</c:if>
	</td>
	<td>
		<fmt:formatNumber value="${row.productPrice }" pattern="###,###,###"/>
	</td>
</tr>

</c:forEach>

</table>

<%@ include file="../footer.jsp"%>