<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ include file="sessionCheck.jsp" %>
<meta charset="UTF-8">
<title>게시글 작성</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready(function() {
		$("#btnSave").click(function() {
			var title = $("#title").val();
			var bcontent = $("#bcontent").val();
			//var writer = $("#writer").val();
			if (title == "") {
				alert("제목을 입력하세요");
				document.form1.title.focus();
				return;
			}
			if (bcontent == "") {
				alert("내용을 입력하세요");
				document.form1.bcontent.focus();
				return;
			}
/* 			if (writer == "") {
				alert("이름을 입력하세요");
				document.form1.writer.focus();
				return;
			} */
			document.form1.submit();
		});
	});
</script>
</head>
<body>
<%@ include file="home.jsp" %>
	<div class="header">
		<table width="100%" border="0">
			<tr>
				<td><a href="index.jsp">HOME</a></td>
				<td height="25"></td>
			</tr>
			<tr bgcolor="#99ccff">
				<td colspan="2" height="1"></td>
			</tr>
			<tr>
				<td colspan='2' height='50' bgcolor='#f0f0f0'>
					<!-- 메인카테고리 -->
				</td>
			</tr>
			<tr bgcolor="#99ccff">
				<td colspan="2" height="1"></td>
			</tr>
		</table>
	</div>

	<div class="row">
		<c:if test="${sessionScope.userId != null}">
			<div class="col-3 col-m-3 menu">
				<!-- 왼쪽 카테고리 -->
				<ul>
					<li><a href="./member.jsp">회원추가</a></li>
					<li><a href="/main/list.do">게시판</a></li>
					<li><a href="notice/noticeList.jsp">공지사항</a></li>
					<li><a href="pds/pdsList.jsp">첨부형 게시판</a></li>
					<li><a href="#">front</a></li>
				</ul>
			</div>
		</c:if>
		<c:if test="${sessionScope.userId == null}">
			<div class="col-3 col-m-3 menu">
				<!-- 왼쪽 카테고리 -->
				<ul>
					<li><a href="/main/login.do">로그인</a></li>
					<li><a href="./member.jsp">회원가입</a></li>
				</ul>
			</div>
		</c:if>

	<div class="col-6 col-m-9">

	<h2>게시글 작성</h2>
	<form name="form1" method="post" action="${path}/main/insert.do">
		<div>
			제목 <input name="title" id="title" size="80" placeholder="제목을 입력바랍니다.">
		</div>
		<div>
			내용 <input name="bcontent" id="bcontent" rows="4" cols="80"
				placeholder="내용 입력바랍니다.">
		</div>
<!-- 		<div>
			이름 <input name="writer" id="writer" placeholder="이름을 입력바랍니다.">
		</div> -->
		<div style="width: 650px; text-align: center;">
			<button type="button" id="btnSave">확인</button>
			<button type="reset">취소</button>

		</div>
	</form>

<%@ include file="footer.jsp" %>