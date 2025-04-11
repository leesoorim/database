<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 절대경로 -->
<%@ include file = "/include/dbcon.jsp" %>
<%
String page1 = request.getParameter("page");
if(page1==null || page1.equals("")){
	page1="1";
}
// 현재 페이지 번호
int pageIndex = Integer.parseInt(page1);
%>

<%
String sql2 = "select count(*) from post1";
ResultSet rs2 = stmt.executeQuery(sql2);
rs2.next();
int total = rs2.getInt(1);
int pageRownum = total;

int firstIndex= (pageIndex-1)*10+1;
int latsIndex=firstIndex+9;

int totalpage= (int)Math.ceil((double)total/10);

// 페이징의 시작번호
// ex) 출력번호 7 -> sno:1, 1 ~ 10 : 1
// ex) 출력번호 9 -> sno:1, 
// ex) 출력번호 13 -> sno:11, 
//ex) 출력번호 26 -> sno:21,
int sno = (pageIndex/10)*10 +1;
// 페이징의 끝번호
int eno= 0;

String sql = "select b.* from("
		   +"  	select rownum rn, a.* from("
		   +" 		select p1,p2,p3,p4,p5,p6,p7,p8 "
		   +" 		from post1 "
		   +" 		order by p2 asc) a) b "
		   +" where rn>="+firstIndex+" and rn<="+latsIndex;

ResultSet rs= stmt.executeQuery(sql);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호/주소 화면</title>
<link rel="stylesheet" href="../css/style.css"/>

</head>

<body>

<div class = "div_title">
	일반게시판 목록
</div>

<div class="div_top_button">

</div>

	<table border=1 >
	<colgroup>
		<col width="15%"/>
		<col width="*"/>
	</colgroup>
	<tr>
		<th>우편번호</th>
		<th>주소</th>
	</tr>
	
	<% while(rs.next()){
	String p1 = rs.getString("p1");
	String p2 = rs.getString("p2");
	String p3 = rs.getString("p3");
	String p4 = (rs.getString("p4")==null)?"":rs.getString("p4");
	String p5 = (rs.getString("p5")==null)?"":rs.getString("p5");
	String p6 = (rs.getString("p6")==null)?"":rs.getString("p6");
	String p7 = (rs.getString("p7")==null)?"":rs.getString("p7");
	String p8 = (rs.getString("p8")==null)?"":rs.getString("p8");
	
	String addr = p2+" "+p3+" "+p4+" "+p5+" "+p6+" "+p7+" "+p8;
	%>
	<tr >
		<td><%=p1 %></td>
		<td style="text-align:left"> &nbsp<%=addr %></td>
	</tr>

<%
	}
%>

</table>

	<div>
		first
		before
		
		<%
		for(int p=1; p<=10; p++){
		%>
			<a href="postList.jsp?page=<%=p %>"><%=p %></a>
		<% 
		}
		%>
	
		next
		last
	</div>

</body>
</html>