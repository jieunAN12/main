<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../header.jsp"%>
<title>관리자 목록</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>

</script>

<body>

<%@ include file="../body1.jsp" %>
<!-- 본문 시작 bbsForm.jsp-->
<h2>관리자 목록</h2>
<input type="button" value="회원등록" onclick="location.href='/main/adminMemberForm.do'">
<c:if test="${sessionScope.adminId != null }">
<table border="1" width="700px">
	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>이메일</th>
		<th>회원가입일자</th>
	</tr>
	<c:forEach var="row" items="${mlist }">
	<tr>
		<td>${row.userId }</td>
		<td><a href="/main/adminUpMmemberForm.do?userId=${row.userId }">${row.userName }</a></td>
		<td>${row.userEmail }</td>
		<td><fmt:formatDate value="${row.userRegdate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	</tr>
	</c:forEach>
</table>
</c:if>

<%@ include file="../footer.jsp" %>