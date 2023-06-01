<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
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
<%@ include file="../body1.jsp" %>

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

<%@ include file="../footer.jsp" %>