<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 페이지</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function() {
	$("#addBtn").click(function(){
		var productName = $("#productName").val();
		var productPrice = $("#productPrice").val();
		var productDesc = $("#productDesc").val();
		var productPhoto = $("#productPhoto").val();
		
		if(productName == ""){
			alert("상품명을 입력해주세요");
			//productName.focus();
		}else if(productPrice == ""){
			alert("상품 가격을 입력해주세요");
			//productPrice.focus();
		}else if(productDesc == ""){
			alert("상품 설명을 입력해주세요");
			//productDesc.focus();
		}else if(productPhoto == ""){
			alert("상품 사진을 입력해주세요");
			//productPhoto.focus();
		}
		//상품 정보 전송
		document.form1.action = "/main/pinsert.do";
		document.form1.submit();
	});
	//상품 목록 이동
	$("#listBtn").click(function(){
		location.href="/main/plist.do";
	});
	
	$.ajax({
		url: '/product/images',
		processData : false,
		contentType : false,
		data : formData,
		datatype : JSON,
		type : "POST",
		success : function(data){
			if(data == "f"){
				alert("파일 업로드 실패");
			}
			else{
				$("#formsub").submit();
			}
		}
	});
	
});

</script>
</head>
<body>
<%@ include file="body1.jsp"%>
<%@ include file="menu.jsp" %>
<h2>상품 등록</h2>
<form name="form1" enctype="multipart/form-data" method="post" action="/main/pinsert.do">
	<table border="1">
		<tr>
			<td>상품명</td>
			<td><input type="text" name="productName" id="productName"></td>
		</tr>
		<tr>
			<td>가격</td>
			<td><input type="text" name="productPrice" id="productPrice"></td>
		</tr>
		<tr>
			<td>상품설명</td>
			<td><textarea rows="5" cols="60" name="productDesc" id="productDesc"></textarea></td>
		</tr>
		<tr>
			<td>상품 이미지</td>
			<td><input type="file" name="productPhoto" id="productPhoto"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="등록" id="addBtn">
				<input type="button" value="목록" id="listBtn">
			</td>
		</tr>
	</table>
</form>

<%@ include file="../footer.jsp"%>