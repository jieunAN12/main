<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2> 상품 목록 </h2>
<table border="1">

<tr>
	<th>상품ID 번호</th>
	<th>상품이미지</th>
	<th>상품명</th>
	<th>가격</th>
</tr>

<c:forEach var="row" items="${list }">

<tr>
	<td>${row.productId }</td>
	<td>
		<a href="${path}/product/detail/${row.productId }">
			<img src="${path }/images/${row.productUrl}" width="120px" height="110px">
		</a>
	</td>
	<td>
		<a href="${path }/product/detail/${row.productId}">${row.productName }</a>
	</td>
	<td>
		<fmt:formatNumber value="${row.productPrice }" pattern="###,###,###"/>
	</td>
</tr>

</c:forEach>

</table>

</body>
</html>