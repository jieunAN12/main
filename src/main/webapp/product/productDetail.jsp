<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 상세 정보</title>
</head>

<body>
<%@ include file="body1.jsp"%>
<%@ include file="menu.jsp" %>
<h2>상품 상세정보</h2>

<table border="1">

<tr>
	<td>
		<img src="${pageContext.request.contextPath}/product/images/${vo.productUrl }" width="340px" height="300px">
	</td>
	<td>
		<table border="1" style="height:300px; width:400px;">
			<tr align = "center">
				<td>상품명</td>
				<td>${vo.productName }</td>
			</tr>
			<tr align = "center">
				<td>가격</td>
				<td><fmt:formatNumber value="${vo.productPrice }" pattern="###,###,###"/></td>
			</tr>
			<tr align = "center">
				<td>상품소개</td>
				<td>${vo.productDesc }</td>
			</tr>
			<tr align = "center">
				<td colspan="2">
			<form name="form1" method="post" action="/main/cinsert.do">
				<input type="hidden" name="productId" value="${vo.productId }">
					<select name="amount">
						<c:forEach begin="1" end="10" var="i">
							<option value="${i }">${i}</option>
						</c:forEach>
					</select>&nbsp;개
				<input type="submit" value="장바구니에 담기">
			</form>
			<a href="/main/plist.do">상품목록</a>
			</td>
			</tr>
		</table>
	</td>
</tr>

</table>
<%@ include file="../footer.jsp"%>