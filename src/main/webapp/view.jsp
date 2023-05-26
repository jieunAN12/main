<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<meta charset="UTF-8">
<title>게시글 작성</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function() {
	
	 listReply();// 댓글 목록 불러오기 방식
	 //listReply2();//json 리턴 방식
	
/* 	
//댓글 쓰기 버튼 클릭 이벤트
	 $("#btnReply").click(function(){
		 var replytext = $("#replytext").val();
		 console.log(replytext);
		 var bno = "${dto.bno}";
		 console.log(bno);
		 var param = "replytext =" + replytext + "&bno=" + bno;
		 console.log(param);
		 $.ajax({
			 type : "post",
	 		 url : "${path}/main/rinsert.do",
	 		 dataType : "json",
	 		 date : param,
	 		 success : function(){
				 alert("댓글이 등록되었습니다.");
				 listReply();
			 },
	 		 error : function(){
	 			 alert("오류남!!!!");
	 		 }
		 });
	 }); 
*/
	
	
	$("#btnList").click(function(){
		location.href="/main/list.do?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}";
	});
	
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까??")){
			document.form1.action = "/main/delete.do";
			document.form1.submit();
		}
	});
	
	$("#btnUpdate").click(function(){
		var title = $("#title").val();
		var bcontent = $("#bcontent").val();
		//var writer = $("#writer").val();
		if(title == ""){
			alert("제목을 입력하세요.");
			document.form1.title.focus();
			return;
		}
		if(bcontent == ""){
			alert("내용을 입력하세요.");
			document.form1.bcontent.focus();
			return;
		}
/* 		if(writer == ""){
			alert("이름을 입력하세요.");
			document.form1.writer.focus();
			document.form1.submit();
		} */
		document.form1.action = "/main/update.do"
		document.form1.submit();
	});
	
	$("#btnWrite").click(function() {
		//페이지 주소 변경(이동)
		document.form1.action = "/main/write.do";
		document.form1.submit();
	});
	
	$("#btnlist").click(function(){
		//페이지 주소 변경(이동)
		document.form1.action = "/main/list.do";
		document.form1.submit();
	});
	
 function listReply(){
		$.ajax({
			type : "get",
			url : "${path}/main/rlist.do?bno=${dto.bno}",
			success : function(result){
				$("#listReply").html(result);
			}
		});
	}
	
	/*
	function listReply2(){
		$.ajax({
			type : "get",
			url : "/main/listJson.do?bno=${dto.bno}",
			dataType : "json",
			success : function(result){
				console.log(result);
				var output = "<table>";
				for(var i in result){
					output += "<tr>";
					output += "<td>"+result[i].userName;
					output += "("+changeDate(result[i].regdate)+")<br>";
					output += result[i].replytext+"</td>";
					output += "</tr>";
				}
				output += "</table>";
				$("#listReply2").html(output);
			}
		});
	} 
	*/
	
	function changeDate(date){
		date = new Date(perseInt(date));
		year = date.getFullYear();
		month = date.getMonth();
		day = date.getDate();
		hour = date.getHours();
		minute = date.getMinutes();
		second = date.getSeconds();
		strDate = year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
		return strDate;
	} 
	
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

<h2>게시글 보기</h2>

<form name="form1" method="post">
<div>
작성일자 : <fmt:formatDate value="${dto.regdate }" pattern="yyyy-MM-dd a HH:mm:ss"/>
</div>
<div>
조회수 : ${dto.viewcnt }
</div>
<div>
제목
<input name="title" id="title" size="80" value="${dto.title }" placeholder="제목을 입력하세요.">
</div>
<div>
내용
<textarea name="bcontent" id="bcontent" rows="4" cols="80" placeholder="내용을 입력하세요.">${dto.bcontent }</textarea>
</div>
<div>
이름 ${dto.userName }
</div>
	<div style="width: 650px; text-align: center;">
		<input type="hidden" name="bno" value="${dto.bno }">
			<button type="button" id="btnWrite">글쓰기</button>
			<c:if test="${sessionScope.userId == dto.writer }">
			<button type="button" id="btnUpdate">수정</button>
			<button type="button" id="btnDelete">삭제</button>
			</c:if>
			<button type="button" id="btnlist">목록</button>
	</div>
</form>

 <!--  댓글 목록 -->
<br>
<form action="/main/rinsert.do" method="post">
	<input type="hidden" name="bno" value="${dto.bno }">
		<table width="500" border="1">
			<tr>
				<td>
				<textarea rows="3" cols="55" placeholder="내용을 작성하세요" name="replytext" required="required"></textarea>
				</td>
				<td>
					<button>등록하기</button>
				</td>
			</tr>

		</table>
<div id="listReply"></div>
</form> 

<%-- <div style="width:650px; text-align:center;">
<br>
<c:if test="${sessionScope.userId != null }">
<textarea rows="5" cols="80" id="replytext" placeholder="댓글을 작성해 주세요"></textarea>
<br>
<button type="button" id="btnReply">댓글 작성</button>
</c:if>
</div>
<div id="listReply"></div> --%>

<%@ include file="footer.jsp" %>