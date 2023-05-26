<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table style="width:700px">
	<c:forEach var="row" items="${rlist }">
		<tr>
			<td>
				${row.userName }(<fmt:formatDate value="${row.regdate }" pattern="yyyy-MM-dd HH:mm:ss"/>)
			<br>
				${row.replytext }
			</td>
		</tr>
	</c:forEach>
</table>

</body>
</html>