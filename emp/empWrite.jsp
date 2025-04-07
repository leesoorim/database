<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "/include/dbcon.jsp" %>

<%
// 새로운 사원번호 가져오기
// 1001 ~ 9999
// 만약 첫 데이터 등록시 1001번으로 시작
String sql = "select nvl(max(empno),1000)+1 from emp";
ResultSet rs = stmt.executeQuery(sql);
rs.next();
int empno=rs.getInt(1);

//업무 목록
String sql3 = "select distinct(job) from emp where job!='PRESIDENT'";
ResultSet rs3 = stmt.executeQuery(sql3);

// 부서정보 목록
String sql2 = "select deptno,dname,loc from dept2 order by dname";
Statement stmt2 = con.createStatement();
ResultSet rs2 = stmt2.executeQuery(sql2);

// 매니저 목록
String sql4 = "select empno,ename from emp where job='MANAGER' or job='PRESIDENT'";
Statement stmt4 = con.createStatement();
ResultSet rs4 = stmt4.executeQuery(sql4);
%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원등록화면</title>
<link rel="stylesheet" href="../css/style.css">
</head>

<script>
function fn_submit(){
	
	// String, int, ...=>java변수
	// let => 자바스크립트는 타입이 없음
	
// 변수선언 = 현재창(객체).구성요소,구조물(이름값)
	let f= document.frm;	
	
	if(document.frm.empno.value==""){
		alert("사원번호를 입력해주세요."); // 알림창
		f.empno.focus();	// 특정위치에 커서를 위치시킴 : focus=함수(커서이동)
		return false;		// 함수의 종료
	}
	if(document.frm.empno.value.length != 4){
		alert("사원번호는 4자리입니다.");
		f.empno.focus();
		return false;
	}
	
	if(f.ename.value==""){
		alert("사원이름을 입력해주세요.");
		f.ename.focus();
		return false;
	}
	if(f.ename.value.length>30){
		alert("사원이름은 30자를 초과할 수 없습니다.");
		f.ename.focus();
		return false;
	}
	
	if(f.hiredate.value.length!=10){
		alert("날짜를 선택해주세요.");
		f.hiredate.focus();
		return false;
	}
	// 현재창의 폼을 전송한다.
	//submit() :: 자바스크립트 전송기능의 내장 함수;
	f.submit(); 
}

</script>

<body>

<div class = "div_title">
	사원등록
</div>
		<!-- 폼이름 아무거나 설정해도됨 -->
<form name="frm" method="post" action="empWriteSave.jsp">
<div class="div_top_button">
	<!-- return false : submit()버튼 기능의 전송기능을 없애는 세팅 -->
	<!-- submit()버튼 :: 전송기능,{enter}버튼의 인식 -->
	<button type="submit" onClick="fn_submit(); return false;" >저장</button>
	<button type="reset">취소</button>
	<button type="button" onClick="location='empList.jsp'">목록</button>
</div>

<table>
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tr>
		<th><label for="empno">사원번호</label></th>
		<td><input type="number" id="empno" name="empno" class="input1" value="<%=empno %>" placeholder="사원번호" readonly maxlength="4" ></td>
	</tr>
	<tr>
		<th><label for="ename">사원이름</label></th>
		<td><input type="text" id="ename" name="ename" class="input1" placeholder="사원이름" maxlength="30" autofocus></td>
	</tr>
	<tr>
		<th><label for="job">업무</label></th>
		<td style="text-align:left;">
		<select name="job" id="job" class="select1">
			<%
			while(rs3.next()){
				String job = rs3.getString(1);
			%>
				<option value="<%=job%>"><%=job %></option>
			<% 	
			}
			%>
			
			
		</select>
		</td>
	</tr>
	<tr>
		<th><label for="mgr">매니저</label></th>
		<td style="text-align:left;">
			<select name="mgr" id="mgr" class="select1">
			<%
			while(rs4.next()){
				String sno = rs4.getString(1);
				String snm = rs4.getString(2);
			%>
				<option value="<%=sno%>"><%=snm %></option>
			<% 
			}
			%>
				
			</select>
		</td>
	</tr>
	<tr>
		<th><label for="hiredate">입사일</label></th>
		<td><input type="date" id="hiredate" name="hiredate" class="input1"></td>
	</tr>
	<tr>
		<th><label for="sal">기본급여</label></th>
		<td><input type="number" id="sal" name="sal" class="input1" value="0"></td>
	</tr>
	<tr>
		<th><label for="comm">업무수당</label></th>
		<td><input type="number" id="comm" name="comm" class="input1" value="0"></td>
	</tr>
	
	<tr>
		<th><label for="deptno">부서</label></th>
		<td style="text-align:left;">
			<select name="deptno" id="deptno" class="select1">
			<%
			while(rs2.next()){
				String dno=rs2.getString(1);
				String dnm=rs2.getString(2);
				String loc=rs2.getString(3);
			%>
				<option value="<%=dno %>"><%=dnm %> (<%=loc %>)</option>	
			<%
			}
			%>
			</select>
			
		</td>
	</tr>

</table>
</form>
</body>
</html>