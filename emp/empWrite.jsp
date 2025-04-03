<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원등록화면</title>
<link rel="stylesheet" href="../css/style.css">
</head>
<body>

<div class = "div_title">
	사원목록
</div>

<form name="frm" method="post" action="empWriteSave.jsp">
<div class="div_top_button">
	<button type="submit" >저장</button>
	<button type="reset">취소</button>
</div>

<table>
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tr>
		<th><label for="empno">사원번호</label></th>
		<td><input type="number" id="empno" name="empno" class="input1" placeholder="사원번호" autofocus></td>
	</tr>
	<tr>
		<th><label for="ename">사원이름</label></th>
		<td><input type="text" id="ename" name="ename" class="input1" placeholder="사원이름"></td>
	</tr>
	<tr>
		<th><label for="job">업무</label></th>
		<td><input type="text" id="job" name="job" class="input1" ></td>
	</tr>
	<tr>
		<th><label for="mgr">매니저</label></th>
		<td><input type="text" id="mgr" name="mgr" class="input1"></td>
	</tr>
	<tr>
		<th><label for="hiredate">입사일</label></th>
		<td><input type="date" id="hiredate" name="hiredate" class="input1"></td>
	</tr>
	<tr>
		<th><label for="sal">기본급여</label></th>
		<td><input type="number" id="sal" name="sal" class="input1"></td>
	</tr>
	<tr>
		<th><label for="comm">업무수당</label></th>
		<td><input type="number" id="comm" name="comm" class="input1" value="0"></td>
	</tr>
	<tr>
		<th><label for="deptno">부서번호</label></th>
		<td><input type="number" id="deptno" name="deptno" class="input1" ></td>
	</tr>

</table>
</form>
</body>
</html>