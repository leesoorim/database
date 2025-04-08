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

String sqlpass = "select count(*) from admininfo where pass='"+pass+"'";
ResultSet rs = stmt.executeQuery(sqlpass);
rs.next();
int cnt = rs.getInt(1);
if(cnt==1){
	String sql = "DELETE FROM emp where empno='"+empno+"'";
	int result = stmt.executeUpdate(sql);
	if(result==1){
%>
		<script>
		alert("삭제성공!!");
		location="empList.jsp";
		</script>
<% 	
	}else{
%>	
		<script>
		alert("삭제실패!!");
		location="empList.jsp";
		</script>
<%		
	}
}else{
%>
	<script>
	alert("비밀번호가 틀립니다.");
	location="empPassWrite.jsp";
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