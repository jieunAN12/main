<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../header.jsp"%>
<title>관리자 회원가입</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>

$(document).ready(function() {
	$("#btnUpdate").click(function(){
		if(confirm("수정하시겠습니까?")){
			document.form1.action = "/main/upmember.do";
			document.form1.submit();
		}
	});
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			document.form1.action = "/main/deletemember.do";
			document.form1.submit();
		}
	});
});

</script>
<body>
<%@ include file="../body1.jsp" %>
<!-- 본문 시작 bbsForm.jsp-->
<form name="form1" method="post">
	<table width="450" border="1" align="center" cellspacing="0" cellpadding="5">
		<tr>
			<td colspan="2" align="center">관리자 회원가입</td>
		</tr>
		<tr>
			<th width="150">아이디</th>
			<td><input name="userId" size="30" value="${vo.userId }" readonly="readonly"></td>
		</tr>
		<tr>
			<th width="150">비밀번호</th>
			<td><input type="password" name="userPw" size="30" value="${vo.userPw }"></td>
		</tr>
		<tr>
			<th width="150">이름</th>
			<td><input type="text" name="userName" size="30" value="${vo.userName }"></td>
		</tr>
		<tr>
			<th width="150">Email</th>
			<td><input type="email" name="userEmail" size="30" value="${vo.userEmail }" pattern=".+@gmail\.com" placeholder="example@gmail.com" required></td>
		</tr>
		<tr>
			<td>회원가입일자</td>
			<td>
				<fmt:formatDate value="${vo.userRegdate }" pattern="yyyy-MM-dd HH:mm:ss"/>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="button" name="btnUpdate" id="btnUpdate" value="수정">
			<input type="button" name="btnDelete" id="btnDelete" value="삭제">
			<div style="color:red">${message }</div>
			</td>
		</tr>
	</table>
</form>
<!-- 본문 끝 -->

<%@ include file="../footer.jsp"%>