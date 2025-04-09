<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 절대경로 -->
<%@ include file = "/include/dbcon.jsp" %>

<%
String page1 = request.getParameter("page");

if(page1==null) page1 = "1";

// 출력페이지 번호
int pageIndex = Integer.parseInt(page1);

// 한 화면의 출력개수(단위)
int Unit = 10;
%>

<%
String sql2 = "select count(*) from emp";
ResultSet rs2 = stmt.executeQuery(sql2);
rs2.next();

// 총데이터 개수
int total = rs2.getInt(1);

// 총 페이지 개수
// 31 -> 4; 23 -> 3; 17 -> 2; 8 -> 1;
// 31/10 -> 3.1 -> (올림) 3.1 -> 4

int totalpage = (int)Math.ceil((double)total/Unit);

// pageIndex = 1 => 1
// pageIndex = 2 => 11
// pageIndex = 3 => 21
// (1페이지 기준) (1-1) * 10+1 -> 1
// (3페이지 기준) (3-1) * 10+1 -> 21
// (4페이지 기준) (4-1) * 10+1 -> 31

int firstIndex = (pageIndex-1)*Unit+1;
int lastIndex = firstIndex+(Unit-1);

// 각 출력페이지의 시작 (행)번호
int pageRownum = total-(pageIndex-1)*Unit;

String sql =   "select b.* from( "
			 +"    select rownum rn, a.* from( "
			 +"      select empno \n"
			 +"		       ,ename \n"
			 +"		       ,job \n"
			 +"		       ,deptno \n"
			 +"		       ,to_char(hiredate,'yyyy-mm-dd') hiredate \n "
			 +"    from emp\n"
			 +"    order by hiredate desc) a) b"
			 +" where rn >="+firstIndex+" and rn<="+lastIndex+"";
			 
			 System.out.println(sql);

ResultSet rs= stmt.executeQuery(sql);
// System.out.println(sql);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css"/>

</head>

<script>
function fn_acrion(){
	location="empWrite.jsp";
}

</script>

<body>

<div class = "div_title">
	사원목록
</div>

<div class="div_top_button">
	<button type="button" onClick="fn_acrion()">사원등록</button>
</div>

	<table border=1 >
	<colgroup>
		<col width="15%"/>
		<col width="20%"/>
		<col width="25%"/>
		<col width="20%"/>
		<col width="20%"/>
	</colgroup>
	<tr>
		<th>사원번호</th>
		<th>사원이름</th>
		<th>업무</th>
		<th>부서번호</th>
		<th>입사일</th>
	</tr>
	
	<% while(rs.next()){
	String sno = rs.getString("empno");
	String snm = rs.getString("ename");
	String job = rs.getString("job");
	String dno = rs.getString("deptno");
	String hdt = rs.getString("hiredate");
	%>
	<tr style="cursor:pointer;" 
		onClick="location='empDetail.jsp?empno=<%=sno %>'">
		<td><%=pageRownum %></td>
		<!--<td><a href="empDetail.jsp?empno=<%=sno %>"><%=snm %></a></td>  -->
		<td><%=snm %></td>
		<td><%=job %></td>
		<td><%=dno %></td>
		<td><%=hdt %></td>
	</tr>

<%
	pageRownum--;
	}
%>

</table>

	<div class="div_page">
		<%
		for(int p=1; p<=totalpage; p++){
			String uri =(String)request.getRequestURI();
		%>	
			<a href="<%=uri %>?page=<%=p %>"><%=p %></a>
		<%	
		}
		%>
	</div>

</body>
</html>