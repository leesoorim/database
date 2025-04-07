<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "/include/dbcon.jsp" %>

<%
// 1. 파라메터 값 설정 (지역변수화)
String empno=request.getParameter("empno");

// 2. 널값 체크 또는 존재의 여부 체크
if(empno==null || empno.equals("")){
%>
	<script>
	alert("잘못된번호");
	location="empList.jsp";
	</script>
	
<% 
	return; // 프로그램중단
}
String sql2 = "select count(*) from emp where empno='"+empno+"'";
ResultSet rs2 = stmt.executeQuery(sql2);
rs2.next();
int cnt = rs2.getInt(1);

if(cnt==0){
%>
	<script>
	alert("다시 시도해주세요.");
	location="empList.jsp";
	</script>
<% 
return;
} 

// 3. 출력 SQL 작성
String sql = "select \n"
			+"		e1.ename ename \n"
			+"	   ,e1.job 	 job \n"
			+"	   ,decode(e1.deptno,null,'미정',0,'미정',e1.deptno) deptno \n"
			+"     ,decode(e1.mgr,null,'미정',e1.mgr)  mgr \n"
			+"     ,to_char(e1.hiredate,'yyyy-mm-dd') hiredate \n"
			+"     ,nvl(e1.sal,0) 	sal \n"
			+"     ,nvl(e1.comm,0)  comm \n"
			+"     ,d.dname 		dname \n"
			+"     ,e2.ename		mgrname \n"
			+"     ,g.grade 		grade \n"
			+"	from \n"
			+"		emp e1,emp e2,dept d,salgrade g \n"
			+"	where \n"
			+" 		e1.deptno=d.deptno \n"	
			+" and	e1.mgr=e2.empno \n"	
			+" and	e1.sal between g.losal and g.hisal \n"	
			+" and	e1.empno='"+empno+"'";
ResultSet rs = stmt.executeQuery(sql);
rs.next();

String ename = rs.getString("ename");
String job = rs.getString("job");
String deptno = rs.getString("deptno");
String mgr = rs.getString("mgr");
String hiredate = rs.getString("hiredate");
String sal = rs.getString("sal");
String comm = rs.getString("comm");
String dname = rs.getString("dname");
String mgrname = rs.getString("mgrname");
String grade = rs.getString("grade");

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 상세보기 화면</title>
<link rel="stylesheet" href="../css/style.css">
</head>

<style>
td{
text-align:left;
padding-left:10px;
}

</style>

<body>

<div class = "div_title">
	사원 상세 화면
</div>
		<!-- 폼이름 아무거나 설정해도됨 -->
<div class="div_top_button">
	<button type="button" onClick="location='empList.jsp'">목록</button>
	<button type="button" onClick="location='empModify.jsp?empno=<%=empno %>'">수정</button>
	<button type="button" onClick="location='empDelete.jsp?empno=<%=empno %>'">삭제</button>
</div>

<table>
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tr>
		<th><label for="empno">사원번호</label></th>
		<td><%=empno %></td>
	<tr>
		<th><label for="ename">사원이름</label></th>
		<td><%=ename %></td>
	</tr>
	<tr>
		<th><label for="job">업무</label></th>
		<td ><%=job %></td>
	</tr>
	<tr>
		<th><label for="mgr">매니저</label></th>
		<td><%=mgrname %>(<%=mgr %>)</td>
	</tr>
	<tr>
		<th><label for="hiredate">입사일</label></th>
		<td><%=hiredate %></td>
	</tr>
	<tr>
		<th><label for="sal">기본급여</label></th>
		<td><%=sal %></td>
	</tr>
	<tr>
		<th><label for="comm">업무수당</label></th>
		<td><%=comm %></td>
	</tr>
	
	<tr>
		<th><label for="deptno">부서</label></th>
		<td><%=dname %>(<%=deptno %>)</td>
	</tr>
	<tr>
		<th><label for="deptno">급여등급</label></th>
		<td><%=grade %>등급</td>
	</tr>

</table>
</body>
</html>