<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String url = "jdbc:oracle:thin:@//127.0.0.1:1522/orcl7";
String username = "c##java";
String userpass = "1234";

Class.forName("oracle.jdbc.OracleDriver");
Connection con = DriverManager.getConnection(url,username,userpass);
Statement stmt = con.createStatement();
%>
 
<%
 String deptno = request.getParameter("deptno");
 String dname  = request.getParameter("dname");
 String loc    = request.getParameter("loc");
 
 String sql = " update dept2 set dname='"+dname+"',loc='"+loc+"' "   
 		    + "  where deptno='"+deptno+"' ";
 
 int result = stmt.executeUpdate(sql);
 if( result == 1 ) {
%>
    	<script>
    	alert("수정완료!");
    	location="deptList.jsp";
    	</script>
<%
 } else {
%>
		<script>
    	alert("수정실패!");
    	history.back();
    	</script>
<%
 }
%>


