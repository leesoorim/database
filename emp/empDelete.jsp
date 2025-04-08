<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file ="/include/dbcon.jsp" %>

<%
String empno = request.getParameter("empno");
String pass = request.getParameter("pass");

if(empno==null || pass==null || empno.equals("")||pass.equals("")){
%>
	<script>
		alert("잘못된 경로로의 접근!!");
		location="empList.jsp";
		</script>
<% 	
	return;
}

String sql = "select count(*) from admininfo where pass='"+pass+"'";
ResultSet rs = stmt.executeQuery(sql);
rs.next();
int cnt = rs.getInt(1);
if(cnt==0){
%>
	<script>
	alert("암호를 잘못 입력했습니다.");
	history.back();	// 이전화면으로 이동시키는 자바스크립트 함수
	</script>
<% 
	return;
}

String sql2 = "DELETE FROM emp where empno='"+empno+"'";
int result = stmt.executeUpdate(sql2);
if(result==0){
%>
	<script>
	alert("잘못된 경로로의 접근");
	history.back();	// 이전화면으로 이동시키는 자바스크립트 함수
	</script>
<%	
}else{
%>
	<script>
	alert("삭제가 올바로 진행됐습니다.");
	location="empList.jsp";	// 이전화면으로 이동시키는 자바스크립트 함수
	</script>
<%
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제 화면</title>
</head>
<body>

</body>
</html>