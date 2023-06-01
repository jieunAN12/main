<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
	margin-bottom: 35px;
	/* box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24); */
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
		width: 20%;
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
		width: 20%;
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
	width: 100%;
	height: 180px;
	overflow: hidden;
}
#myfilm img{
	width: 200px;
	height: 180px;
}
</style>
