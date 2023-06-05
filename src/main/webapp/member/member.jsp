<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../header.jsp"%>
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<body>
<%@ include file="../body1.jsp" %>
<!-- 본문 시작 bbsForm.jsp-->
<form method="post" action="member.do" name="memberForm.do">
	<table width="450" border="1" align="center" cellspacing="0" cellpadding="5">
		<tr>
			<td colspan="2" align="center">회원가입</td>
		</tr>
		<tr>
			<th width="150">아이디</th>
			<td><input type="text" name="userId" size=30 value=""><button type="button" id="btnIdCheck">중복체크</button>
				<p id="idCheckMsg">ㅁㅁㅁ</p>
			</td>
		</tr>
		<tr>
			<th width="150">비밀번호</th>
			<td><input type="password" name="userPw" size=30></td>
		</tr>
		<tr>
			<th width="150">이름</th>
			<td><input type="text" name="userName" size=30></td>
		</tr>
		<tr>
			<th width="150">Email</th>
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

<script>

$("#btnIdCheck").on("click", function(){
	console.log("버튼 클릭")
	//아이디 추출
	var id = $("[name=userId]").val();
	console.log(id);
	//통신
	
	$.ajax({
		//url : "${path}/main/idCheck.do",
		url : "${path}/main/idCheck.do?id="+id,
		type : "post",
		//contentType : "application/json",
		data : {id: id},
		
		dataType : "json",
		success : function(data){
			console.log(data)
			if(membervo == null){
				//사용가능
				$("#idCheckMsg").html(id+"는 사용가능 합니다.");
			}else{
				//사용불가능
				$("#idCheckMsg").html(id+"는 사용불가능 합니다.");
			} 
	/*성공시 처리해야될 코드 작성*/
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
	
	//응답
	//사용불가능
 
});

</script>

<%@ include file="../footer.jsp"%>