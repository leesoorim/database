<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "/include/dbcon.jsp" %>
<%
String seqid=request.getParameter("seqid");
String pass=request.getParameter("pass");
%>
<%
if(seqid==null || pass==null || seqid.equals("") || pass.equals("")){
%>	
	<script>
	alert("잘못된 경로입니다.");
	location="boardList.jsp";
	</script>
<% 	
	return;
}
%>

<%
String sql="DELETE FROM nboard WHERE seqid='"+seqid+"' and pass='"+pass+"'";
int result=stmt.executeUpdate(sql);

if(result==1){
%>
	<script>
	alert("삭제 성공!");
	location="boardList.jsp";
	</script>
<% 	
}else{
%>
	<script>
	alert("삭제 실패!");
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