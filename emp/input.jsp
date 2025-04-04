<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="frm" method="post" action="inputSave.jsp">
아이디 <input type="text" name="userid"> <br>

암호 <input type="password" name="pass"> <br>

성별 <input type="radio" name="gender" value="M">남
    <input type="radio" name="gender" value="F">여 <br>
    
취미 <input type="checkbox" name="hobby" value="축구">축구
	<input type="checkbox" name="hobby" value="야구">야구
	<input type="checkbox" name="hobby" value="농구">농구 <br>
	
년도 <select name="year">
		<option value="2020">2020년</option>
		<option value="2021">2021년</option>
		<option value="2022">2022년</option>
	</select> <br>
	
내용 <textarea name="content" rows="10" cols="50"></textarea>
<button type="submit">전송</button>

</form>
</body>
</html>