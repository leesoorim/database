<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- DB 연결 -->
<%@include file = "/include/dbcon.jsp"%>
    
<!-- 파라메터 값 설정 -->
<%
String title = request.getParameter("title");
String pass = request.getParameter("pass");
String writer = request.getParameter("writer");
String content = request.getParameter("content");
%>
<!-- 제목,암호에 대한 NULL체크 -->
<%
if(title==null || pass==null || title.equals("") || pass.equals("")){
%>	
	<script>
	alert("입력데이터를 다시 확인해주세요.");
	location="boardList.jsp";
	</script>
<% 	
	return;
}
%>

<!-- 저장처리 -->
<%
String sql = "INSERT into nboard(seqid,title,pass,writer,content,hits,rdate,udate) "
			+ " values(NBOARD_SEQ.nextval,'"+title+"','"+pass+"','"+writer+"','"+content+"','0',sysdate,'')";
int cnt = stmt.executeUpdate(sql);	

if(cnt>0){
%>	
	<script>
	alert("저장성공!");
	location="boardList.jsp";
	</script>
<% 	
}else{
	%>	
	<script>
	alert("저장실패!");
	history.back();
	</script>
<%
}

%>




