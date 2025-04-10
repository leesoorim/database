<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/include/dbcon.jsp" %>    

<%
String seqid = request.getParameter("seqid");

if(seqid==null || seqid.equals("")){
%>	
	<script>
	alert("잘못된 접근입니다!!");
	location="boardList.jsp";
	</script>
<%	
}
int result = stmt.executeUpdate("UPDATE nboard SET hits=hits+1 WHERE seqid='"+seqid+"'");

if(result==0){
%>	
	<script>
	alert("잘못된 접근입니다!!");
	location="boardList.jsp";
	</script>
<%	
	return;
}

String sql="select title "
				+",writer "
				+",content "
				+",hits "
				+",to_char(rdate,'yyyy-mm-dd') rdate "
				+", udate "
				+"from nboard "
				+"where seqid='"+seqid+"'";
ResultSet rs = stmt.executeQuery(sql);
rs.next();	// 커서를 데이터 있는 곳으로 위치 시킴

String title= rs.getString("title");
String writer= rs.getString("writer");
String content= rs.getString("content");
String hits= rs.getString("hits");
String rdate= rs.getString("rdate");
String udate= rs.getString("udate");

if(udate==null){
	udate="변경날짜가 없습니다.";
}
%>    

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판 상세화면</title>
	<link rel="stylesheet" href="/css/style.css"/>
	<script src="/js/fn_script.js"></script>
</head>

<style>
	td{
		text-align:left;
		padding:5px;
	}
</style>

<body>
<div class = "div_title">
	게시판 상세화면
</div>

<div class="div_top_button">
	<button type="button" onClick="location='boardList.jsp'">목록</button>
	<button type="button" onClick="location='boardModify.jsp?seqid=<%=seqid %>'">수정</button>
	<button type="button" onClick="location='passWrite.jsp?seqid=<%=seqid %>'">삭제</button>
</div>

<table>
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tr>
		<th>제목</th>
		<td><%=title %></td>
	</tr>
	<tr>
		<th>글쓴이</th>
		<td><%=writer %></td>
	</tr>
	<tr>
		<th>조회수</th>
		<td><%=hits %></td>
	</tr>
	<tr>
		<th>등록일</th>
		<td><%=rdate %></td>
	</tr>
	<tr>
		<th>수정일</th>
		<td><%=udate %></td>
	</tr>
	<tr>
		<th>내용</th>
			<td>
				<div class="div_content_area"><%=content %></div>
			</td>
	</tr>
	
</table>

</body>
</html>