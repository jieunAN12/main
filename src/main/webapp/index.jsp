<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>프로젝트 메인</title>
<!-- <link href="/mysite3/assets/css/mysite.css" rel="stylesheet" type="text/css"> -->
<%@ include file="header.jsp"%>
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
	ctnt[0] = "<img src='img/cap1.png'>";
	ctnt[1] = "<img src='img/cap2.png'>";
	ctnt[2] = "<img src='img/cap3.png'>";
	ctnt[3] = "<img src='img/model1.jpg'>";
	ctnt[4] = "<img src='img/cap1.png'>";
	ctnt[5] = "<img src='img/cap2.png'>";

	function start() { // 그림배치
		for (idx = 0; idx < ctnt.length; idx++) {
			document.write("<div id='area" + idx + "'style='position:absolute;top:0px;left:" + (idx * 200) + "px;'>");
			document.write(ctnt[idx]);
			document.write("</div>");
		}
		setTimeout("scroll()", 5000);
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

<%@ include file="body.jsp" %>

			<!-- 본문 시작 -->
			<div id="myfilm">
				<script>
					start();
				</script>
			</div>
			<!-- 본문 끝 -->
			
<%@ include file="footer.jsp" %>