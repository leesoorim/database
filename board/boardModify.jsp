<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- DB -->    
<%@ include file ="/include/dbcon.jsp" %>
    

<!-- 파라메터 값 설정 -->
<% 
String seqid = request.getParameter("seqid");
%>

<!-- 널값 체크 -->
<%
if(seqid==null || seqid.equals("")){
%>	
	<script>
	alert("잘못된 접근입니다!!");
	location="boardList.jsp";
	</script>
<%	
}
%>

<!-- 출력 SQL 작성 -->    
<% 
String sql="select title "
				+",writer "
				+",content "
				+",hits "
				+",to_char(rdate,'yyyy-mm-dd') rdate "
				+",to_char(udate,'yyyy-mm-dd') udate "
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

%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판 수정화면</title>
	<link rel="stylesheet" href="/css/style.css"/>
	<script src="/js/fn_script.js"></script>
</head>

<body>
<div class = "div_title">
	게시판 수정화면
</div>
<form name="frm" method="post" action="boardUpdate.jsp">

	<input type="hidden" name="seqid" value="<%=seqid %>">
	
<div class="div_top_button">
	<!-- return false : submit()버튼 기능의 전송기능을 없애는 세팅 -->
	<!-- submit()버튼 :: 전송기능,{enter}버튼의 인식 -->
	<button type="submit" onClick="fn_board_submit(); return false;" >저장</button>
	<button type="reset">취소</button>
	<button type="button" onClick="location='boardList.jsp'">목록</button>
</div>

<table>
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tr>
		<th><label for="title">제목</label></th>
		<td><input type="text" id="title" name="title" class="input1" placeholder="제목입력" autofocus value="<%=title%>"></td>
	</tr>
	<tr>
		<th><label for="pass">암호</label></th>
		<td><input type="password" id="pass" name="pass" class="input1" placeholder="암호입력" ></td>
	</tr>
	<tr>
		<th><label for="writer">글쓴이</label></th>
		<td><input type="text" id="writer" name="writer" class="input1" value="<%=writer%>"></td>
	</tr>
	<tr>
		<th><label for="content">내용</label></th>
		<td><textarea id ="content" name="content" class="textarea1" ><%=content%></textarea></td>
	</tr>
	
</table>
</form>
</body>
</html>