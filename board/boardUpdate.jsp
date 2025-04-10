<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "/include/dbcon.jsp" %>

<%
String seqid=request.getParameter("seqid");
String title=request.getParameter("title");
String writer=request.getParameter("writer");
String content=request.getParameter("content");
String pass=request.getParameter("pass");

if(seqid==null || title==null || pass==null || seqid.equals("") || title.equals("") || pass.equals("")){
%>	
	<script>
	alert("입력데이터를 다시 확인해주세요.");
	location="boardList.jsp";
	</script>
<% 	
	return;
}
%>
<%
String sql = "UPDATE nboard SET title='"+title+"'"
							+" ,writer='"+writer+"'"
							+" ,content='"+content+"' "
							+" ,udate=sysdate"
							+" WHERE seqid='"+seqid+"' AND pass='"+pass+"'";
int cnt = stmt.executeUpdate(sql);
if(cnt==0){
%>	
	<script>
	alert("다시 시도해주세요!");
	history.back();
	</script>
<% 	
}else{
	%>	
	<script>
	alert("수정 완료!");
	location="boardList.jsp";
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