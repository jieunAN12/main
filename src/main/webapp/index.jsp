<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- <link href="/mysite3/assets/css/mysite.css" rel="stylesheet" type="text/css"> -->
<style>
@charset "UTF-8";

.row:after {
	content: "";
	clear: both;
	display: block;
}

.aside{
	height: 180px;	
}

[class*="col-"] {
	float: left;
	padding: 15px;
}

html {
	font-family: "Lucida Sans", sans-serif;
}

.header {
	background-color: #ffffff;
	color: #000000;
	padding: 5px;
}

.menu ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

.menu li {
	padding: 8px;
	margin-bottom: 7px;
	background-color: #33b5e5;
	color: #ffffff;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
}

.menu li:hover {
	background-color: #0099cc;
}

.aside {
	background-color: #ffffff;
	padding: 15px;
	color: #808080;
	text-align: center;
	font-size: 14px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
}

.footer {
	background-color: #d0d0d0;
	color: #000000;
	text-align: center;
	font-size: 12px;
	padding: 5px;
}
/* For mobile phones: */
[class*="col-"] {
	width: 100%;
}

@media only screen and (min-width: 600px) {
	/* For tablets: */
	.col-m-1 {
		width: 8.33%;
	}
	.col-m-2 {
		width: 16.66%;
	}
	.col-m-3 {
		width: 26%;
	}
	.col-m-4 {
		width: 33.33%;
	}
	.col-m-5 {
		width: 41.66%;
	}
	.col-m-6 {
		width: 50%;
	}
	.col-m-7 {
		width: 58.33%;
	}
	.col-m-8 {
		width: 66.66%;
	}
	.col-m-9 {
		width: 75%;
	}
	.col-m-10 {
		width: 83.33%;
	}
	.col-m-11 {
		width: 91.66%;
	}
	.col-m-12 {
		width: 100%;
	}
}

@media only screen and (min-width: 768px) {
	/* For desktop: */
	.col-1 {
		width: 8.33%;
	}
	.col-2 {
		width: 16.66%;
	}
	.col-3 {
		width: 25%;
	}
	.col-4 {
		width: 33.33%;
	}
	.col-5 {
		width: 41.66%;
	}
	.col-6 {
		width: 50%;
	}
	.col-7 {
		width: 58.33%;
	}
	.col-8 {
		width: 66.66%;
	}
	.col-9 {
		width: 75%;
	}
	.col-10 {
		width: 83.33%;
	}
	.col-11 {
		width: 91.66%;
	}
	.col-12 {
		width: 100%;
	}
}

body {
	font-family: 굴림체;
	font-size: 12px;
	line-height: 19px; /*줄간격*/
	margin: 0px 0px 0px 0px; /*본문 바깥쪽 여백*/
	padding: 0px 0px 0px 0px; /*본문 안쪽 여백*/
	color: #000000; /*글자색*/
	background-color: #ffffff;
}

img {
	border: 0px;
}

A:link {
	text-decoration: none;
	color: blue;
}

A:visited {
	text-decoration: none;
	color: black;
}

A:active {
	text-decoration: underline;
	color: black;
}

A:hover {
	text-decoration: underline;
	color: blue;
}

#myfilm {
	position: relative;
	left: 20px;
	top : 10px;
	background-color: #ffffff;
	width: 800px;
	height: 180px;
	overflow: hidden;
}
#myfilm img{
	width: 200px;
	height: 180px;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function showtime() {
		var now = new Date();
		var str = "";

		// 2015.03.12 (목) PM 2:33:05
		str += now.getFullYear() + ".";
		if (now.getMonth() + 1 < 10) {
			str += "0"; //1~9월이면 0을 앞에 추가  
		}
		str += (now.getMonth() + 1) + "."; //03.

		if (now.getDate() < 10) {
			str += "0";
		}
		str += now.getDate(); //12

		switch (now.getDay()) {
		case 0:
			str += " (일) ";
			break;
		case 1:
			str += " (월) ";
			break;
		case 2:
			str += " (화) ";
			break;
		case 3:
			str += " (수) ";
			break;
		case 4:
			str += " (목) ";
			break;
		case 5:
			str += " (금) ";
			break;
		case 6:
			str += " (토) ";
			break;
		}

		//시 분 초 PM5:03:15
		if (now.getHours() < 12) {
			str += "AM";
		} else {
			str += "PM";
		}

		if (now.getHours() >= 13) {
			str += (now.getHours() - 12) + ":";
		} else {
			str += now.getHours() + ":";
		}

		if (now.getMinutes() < 10) {
			str += "0";
		}
		str += now.getMinutes() + ":";

		if (now.getSeconds() < 10) {
			str += "0";
		}
		str += now.getSeconds();

		document.clock.time.value = str;
		timer1 = window.setTimeout("showtime()", 1000);

	}

	var timer1, timer2; // 전역변수
	var ctnt = [];
	ctnt[0] = "<img src='/main/img/r_1.jpg'>";
	ctnt[1] = "<img src='img/r_2.jpg'>";
	ctnt[2] = "<img src='img/r_3.jpg'>";
	ctnt[3] = "<img src='img/r_4.jpg'>";
	ctnt[4] = "<img src='img/r_1.jpg'>";
	ctnt[5] = "<img src='img/r_2.jpg'>";

	function start() { // 그림배치
		for (idx = 0; idx < ctnt.length; idx++) {
			document.write("<div id='area" + idx
					+ "'  style='position:absolute;top:0px;left:" + (idx * 200)
					+ "px;'>");
			document.write(ctnt[idx]);
			document.write("</div>");
		}
		setTimeout("scroll()", 3000);
	} //end

	function scroll() { //이미지 스크롤
		for (idx = 0; idx < ctnt.length; idx++) {
			var temp = document.getElementById("area" + idx).style;
			temp.left = parseInt(temp.left) - 5 + "px";
			//영역을 벗어난 맨앞 div를 뒤로 보내기
			if (parseInt(temp.left) < -200) {
				temp.left = parseInt(200 * 5) + "px";
			}
		}
		timer2 = setTimeout("scroll()", 50);
	} //end

	function killtime() {
		window.clearTimeout(timer1);
		window.clearTimeout(timer2);
	}
</script>

</head>
<body onload="showtime()" onunload="killtime()">

<%@ include file="home.jsp" %>

	<div class="header">
		<!-- 머리말 -->
		<table width="100%" border="0">
			<tr>
				<td><a href="index.jsp">HOME</a></td>

				<form name="clock">
					<td align="right" height="25"><input type="text" name="time"
						size="25" readonly style="border: 1px"></td>
				</form>
			</tr>
			<tr bgcolor="#99ccff">
				<td colspan="2" height="1"></td>
			</tr>
			<tr>
				<td colspan='2' height='50' bgcolor='#f0f0f0'>
					<!-- 메인카테코리 -->
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
					<li><a href="./member.jsp">회원가입</a></li>
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

		<div class="col-6 col-m-12">
			<!-- 본문 시작 -->
			<div id="myfilm">
				<script>
					start();
				</script>
			</div>
			<!-- 본문 끝 -->
		</div>

		<div class="col-2 col-m-12">
			<div class="aside" style="background-color: pink">
				광고</br> 퀵메뉴
			</div>
		</div>

	</div>

	<div class="footer">
		<table width="100%">
			<tr>
				<td>Copyright &copy; 2023 An jieun</td>
			</tr>
		</table>
	</div>

</body>
</html>