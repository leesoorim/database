<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/include/dbcon.jsp"%>

<%
String deptno = request.getParameter("deptno");
if(deptno == null || deptno.equals("")){
%>
	<script>
	alert("잘못된 경로로의 접근입니다.");
	location="deptList.jsp";
	</script>
<% 	
	return; // 프로그램 종료
}
String sql = "delete from dept2 where deptno='"+deptno+"'";
int result = stmt.executeUpdate(sql);

if(result==1){
%>	

	<script>
	alert("삭제완료!");
	location="deptList.jsp";
	</script>

<%
}else{
%>	
	<script>
	alert("삭제실패!");
	history.back();
	</script>	
<% 	
}
%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>