<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세/삭제</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>

$(document).ready(function(){
	//상품 수정 버튼 클릭이벤트
	$("#editBtn").click(function(){
		var productName = $("#productName").val();
		var productPrice = $("#productPrice").val();
		var productDesc = $("#productDesc").val();
		
		if(productName == ""){
			alert("상품명을 입력해주세요");
			productName.focus();
		}else if(productPrice == ""){
			alert("상품 가격을 입력해주세요");
			productPrice.focus();
		}else if(productDesc == ""){
			alert("상품 설명을 입력해주세요");
			productDesc.focus();
		}
		//상품 정보 전송
		document.form1.action = "/main/pupdate.do";
		document.form1.submit();
	});
	//상품 목록 이동
	$("#deleteBtn").click(function(){
		//상품 삭제 확인
		if(confirm("상품을 삭제하시겠습니까??")){
			document.form1.action = "/main/pdelete.do";
			document.form1.submit();
		}
	});
	
	//상품 목록 버튼 클릭이벤트
	$("#listBtn").click(function(){
		location.href = "/main/plist.do";
	});
});

</script>
</head>

<body>
<%@ include file="body1.jsp"%>
<%@ include file="menu.jsp" %>
<h2>상품 정보/삭제</h2>
<form id="form1" name="form1" enctype="multipart/form-data" method="post">
	<table border="1">
		<tr>
			<td>상품 이미지</td>
			<td>
				<img src="${pageContext.request.contextPath}/product/images/${vo.productUrl }" height="300px" width="310px">
				<br>
				<input type="file" id="productPhoto" name="productPhoto">
			</td>
		</tr>
		<tr>
			<td>상품명</td>
			<td><input type="text" name="productName" id="productName" value="${vo.productName }"></td>
		</tr>
		<tr>
			<td>가격</td>
			<td><input type="number" name="productPrice" id="productPrice" value="${vo.productPrice }"></td>
		</tr>
		<tr>
			<td>상품 소개</td>
			<td><textarea rows="5" cols="60" name="productDesc" id="productDesc">${vo.productDesc }</textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="hidden" name="productId" value="${vo.productId }">
				<input type="button" value="수정" id="editBtn">
				<input type="button" value="삭제" id="deleteBtn">
				<input type="button" value="상품목록" id="listBtn">
			</td>
		</tr>
	</table>
</form>

<%@ include file="../footer.jsp"%>