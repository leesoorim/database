<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
 String dno = request.getParameter("deptno");
 String dnm = request.getParameter("dname");
 String loc = request.getParameter("loc");
%>

<%
String url = "jdbc:oracle:thin:@//127.0.0.1:1522/orcl7";
String username = "c##java";
String userpass = "1234";

Class.forName("oracle.jdbc.OracleDriver");
Connection con = DriverManager.getConnection(url,username,userpass);
Statement stmt = con.createStatement();

String sql = " insert into dept2(deptno,dname,loc) "
		   + " values('"+dno+"','"+dnm+"','"+loc+"') ";

int result = stmt.executeUpdate(sql);
if( result == 1 ) {
%>
		<script>
		alert("저장완료!");  // 알림창, 팝업창
		history.back();	   // 이전 페이지로 이동
		</script>
<%
} else {
%>
		<script>
		alert("저장실패!");
		history.back();
		</script>
<%
}
%>
