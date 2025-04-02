<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

String url = "jdbc:oracle:thin:@//localhost:1522/orcl7";
String username = "c##java";
String userpass = "1234";

Class.forName("oracle.jdbc.OracleDriver");		
Connection con = DriverManager.getConnection(url,username,userpass);
Statement stmt = con.createStatement(); 

String deptno = request.getParameter("deptno");

String sql = "select deptno,dname,loc from dept2 where deptno='"+deptno+"'";
ResultSet rs = stmt.executeQuery(sql);
rs.next();
String danme = rs.getString("dname");
String loc = rs.getString("loc");
%>   
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="frm" method=post action="deptModifySave.jsp">

<table border="1" width="500">
	<tr>
		<th>부서번호</th>
		<td>
		<!-- 
			readonly : 입력상자는 활성상태로 두고 쓰기를 막음(전송가능)
			disabled : 입력상자를 비활성상태로 만들고 쓰기를 막음(전송안됨)
		 -->
		<input type="text" 
				   name = "deptno" 
				   value="<%=deptno %>"
				   readonly>
		</td>
	</tr>
	<tr>
		<th>부서이름</th>
		<td><input type="text" name = "dname"value="<%=danme %>"></td>
	</tr>
	<tr>
		<th>부서위치</th>
		<td><input type="text" name = "loc"value="<%=loc %>"></td>
	</tr>
	<tr>
		<th colspan="2">
		<button type="submit">수정</button>
		<button type="reset">취소</button>
		<button type="button" onClick="location='deptList.jsp'">목록</button>
		
		</th>
	</tr>
</table>
</form>
</body>
</html>