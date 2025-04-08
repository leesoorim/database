<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "/include/dbcon.jsp" %>

<%
String empno = request.getParameter("empno");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>암호입력화면</title>
<link rel="stylesheet" href="../css/style.css">
</head>

<script>
function fn_submit(){
	
	// String, int, ...=>java변수
	// let => 자바스크립트는 타입이 없음
	
// 변수선언 = 현재창(객체).구성요소,구조물(이름값)
	let f= document.frm;	
	
	if(document.frm.empno.value==""){
		alert("암호를 입력해주세요."); // 알림창
		f.empno.focus();	// 특정위치에 커서를 위치시킴 : focus=함수(커서이동)
		return false;		// 함수의 종료
	}
	f.submit(); 
}

</script>

<body>

<div class = "div_title">
	암호 입력 화면
</div>
		<!-- 폼이름 아무거나 설정해도됨 -->
<form name="frm" method="post" action="empDelete.jsp">
	<input type="hidden" name="empno" value="<%=empno %>"> <!-- 화면에 안 보이고 들고튀기 --> 

<div class="div_top_button">
	<button type="submit" onClick="fn_submit(); return false;" >삭제</button>
	<button type="reset">취소</button>
	<button type="button" onClick="location='empList.jsp'">목록</button>
</div>

<table>
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tr>
		<th><label for="pass">암호</label></th>
		<td><input type="password" id="pass" name="pass" class="input1" placeholder="암호입력" autofocus ></td>
	</tr>
</table>
</form>
</body>
</html>