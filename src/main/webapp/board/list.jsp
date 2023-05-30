<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<title>게시글 작성</title>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready(function() {
		
		$("#btnWrite").click(function() {
			//페이지 주소 변경(이동)
			location.href = "/main/write.do"
		});

	});
	//원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해
	function list(page) {
		location.href = "/main/list.do?curPage=" + page
						+ "&searchOption=${map.searchOption}"
						+ "&keyword=${map.keyword}";
	}
</script>
</head>

<body>
<%@ include file="body1.jsp" %>

			<h2>게시글 목록</h2>

			<form name="form1" method="post" action="/main/list.do">
				<select name="searchOption">
					<option value="all"
						<c:out value="${map.searchOption == 'all' ? 'selected' : ''}"/>>
						제목+이름+제목</option>
					<option value="userName"
						<c:out value="${map.searchOption == 'userName' ? 'selected' : ''}"/>>이름</option>
					<option value="bcontent"
						<c:out value="${map.searchOption == 'bcontent' ? 'selected' : ''}"/>>내용</option>
					<option value="title"
						<c:out value="${map.searchOption == 'title' ? 'selected' : ''}"/>>제목</option>
				</select> <input name="keyword" value="${map.keyword }"> <input
					type="submit" value="조회">
				<c:if test="${sessionScope.userId != null }">
					<button type="button" id="btnWrite">글쓰기</button>
				</c:if>
			</form>

			${map.count }개의 게시물이 있습니다.

			<table border="1" width="600px">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>이름</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
				<c:forEach var="row" items="${map.list }">
					<tr>
						<td>${row.bno }</td>
						<!-- 게시글 상세보기 페이지로 이동시 게시글 목록페이지에 있는 검색조건, 키워드, 현재페이지 값을 유지하기 위해 -->
						<td><a
							href="${path}/main/view.do?bno=${row.bno}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">${row.title }
							<c:if test="${row.recnt > 0 }">
							<span style="color:red;">(${row.recnt })
							</span>
							</c:if>
							</a>
						</td>
						<td>${row.userName }</td>
						<td>
							<!-- 원하는 날짜 형식으로 출력하기 위해 fmt 태그 사용 --> <fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
						<td>${row.viewcnt }</></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="5">
					<c:if test="${map.boardPager.curBlock >= 1}">
							<a href="javascript:list('1')">[처음]</a>
						</c:if>
						<c:if test="${map.boardPager.curBlock >= 1}">
							<a href="javascript:list('${map.boardPager.prevPage }')">[이전]</a>
						</c:if> 
						<c:forEach var="num" begin="${map.boardPager.blockBegin }"
							end="${map.boardPager.blockEnd }">
							<c:choose>
								<c:when test="${num == map.boardPager.curPage }">
									<span style="color: red">${num }</span>&nbsp;
		</c:when>
								<c:otherwise>
									<a href="javascript:list('${num }')"></a>&nbsp;
		</c:otherwise>
							</c:choose>
						</c:forEach> 
						<c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock+1}">
							<a href="javascript:list('${map.boardPager.nextPage }')">[다음]</a>
						</c:if>
						<c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
							<a href="javascript:list('${map.boardPager.totPage }')">[끝]</a>
						</c:if>
					</td>
				</tr>
			</table>

<%@ include file="../footer.jsp"%>