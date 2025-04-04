<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String userid = request.getParameter("userid");   // ok
String pass = request.getParameter("pass");		  // ok
String gender = request.getParameter("gender");   // ok

String[] hobby = request.getParameterValues("hobby");	  // fail => 배열이라 하나만 출력됨

String year = request.getParameter("year");		  // ok
String content = request.getParameter("content"); // ok
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

아이디 : <%=userid %> <br>
암호 : <%=pass %> <br>
성별 : <%=gender %> <br>


취미 : <%
		if(hobby != null){
			for(int i=0; i<hobby.length; i++){
				out.print(hobby[i]+" ");
			}
		}else{
			out.print("선택내용이 없습니다.");
		}	
	   %> 

<br>


년도 : <%=year %> <br>
내용 : <%=content %> 

</body>
</html>