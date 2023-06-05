<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../header.jsp"%>
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(function(){
    $("#btnIdCheck").click(function(){
    	let userId = $("[name=userId]").val();
        $.ajax({
            type:'POST', //post 형식으로 controller 에 보내기위함!!
            url:"${pageContext.request.contextPath}/idCheck.do",
            data: {"userId":userId}, // 원하는 값을 중복확인하기위해서  JSON 형태로 DATA 전송
            dataType : "JSON",
            
            success: function(vo){ 
                if(vo == null){ // 만약 성공할시
                	$("#idCheckMsg").html(userId+"는 사용가능 합니다.");
           	   }else { // 만약 실패할시
           			$("#idCheckMsg").html(userId+"는 사용불가능 합니다.");
               }
         },
            error : function(error){
            	alert(error);
            	}
        });
    });
});
</script>

<body>
<%@ include file="../body1.jsp" %>
<!-- 본문 시작 bbsForm.jsp-->
<form method="post" action="member.do" name="memberForm.do">
	<table width="450" border="1" align="center" cellspacing="0" cellpadding="5">
		<tr>
			<td colspan="2" align="center">회원가입</td>
		</tr>
		<tr>
			<th width="100">아이디</th>
			<td><input type="text" name="userId" id="userId" size=30 value="">&nbsp;<button type="button" id="btnIdCheck">중복체크</button>
				<p id="idCheckMsg"></p>
			</td>
		</tr>
		<tr>
			<th width="100">비밀번호</th>
			<td><input type="password" name="userPw" size=30></td>
		</tr>
		<tr>
			<th width="100">이름</th>
			<td><input type="text" name="userName" size=30></td>
		</tr>
		<tr>
			<th width="100">Email</th>
			<td><input type="email" name="userEmail" size=30 pattern=".+@gmail\.com" placeholder="example@gmail.com" required></td>
		</tr>
		<tr>
			<th>권한</th>
			<td>
				<input type="radio" name="userAuth" value="users">사용자
				<input type="radio" name="userAuth" value="admin">관리자
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="submit" name="Submit" value="회원가입"></td>
		</tr>
	</table>
</form>
<!-- 본문 끝 -->

<%@ include file="../footer.jsp"%>