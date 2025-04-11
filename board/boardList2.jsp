<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 절대경로 -->
<%@ include file = "/include/dbcon.jsp" %>

<%
String page1= request.getParameter("page"); // 무조건 스트링
if(page1 == null || page1.equals("")){
	page1 = "1";
}

	// pageIndex => 출력페이지 번호
int pageIndex = Integer.parseInt(page1);   // Sting -> int 형변환

// 출력단위
int unit = 7;
%>

<%
String sql2 = "select count(*) from nboard";
ResultSet rs2 = stmt.executeQuery(sql2);
rs2.next();
int total = rs2.getInt(1);

// 13개 -> 2                      13.0-> 1.3 -> 2.0 -> 2
int totalpage = (int)Math.ceil((double)total/unit);

// 출력 페이지의 시작 행번호
int pageRownum = total - (pageIndex-1)*unit;


// 1page -> 1~10
// 2page -> 11~20
// pageIndex (출력페이지번호)
// ex) 2 -> 11, 3 -> 21
// 	   (2-1)*10+1 -> 11
int firstIndex = (pageIndex-1)*unit+1;
int lastIndex=firstIndex + (unit-1);

String sql = "select b.* from( \n"
		+ "    select rownum rn,a.* from( \n"
		+ "        select seqid \n"
		+ "                ,title \n"
		+ "                ,writer \n"
		+ "                ,hits \n"
		+ "                ,to_char(rdate,'yyyy-mm-dd') rdate \n"
		+ "         from nboard \n"
		+ "         order by seqid desc)a)b \n"
		+ " where rn >= "+firstIndex+" and rn<="+lastIndex;

ResultSet rs= stmt.executeQuery(sql);

//System.out.println(sql);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 게시판 목록 화면</title>
<link rel="stylesheet" href="../css/style.css"/>

</head>

<script>
function fn_action(){
	location="boardWrite.jsp";
}

</script>

<body>

<div class = "div_title">
	일반게시판 목록
</div>

<div class="div_top_button">
	<button type="button" onClick="fn_action()">등록</button>
</div>

	<table border=1 >
	<colgroup>
		<col width="10%"/>
		<col width="*"/>
		<col width="15%"/>
		<col width="15%"/>
		<col width="15%"/>
	</colgroup>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>글쓴이</th>
		<th>조회수</th>
		<th>등록일</th>
	</tr>
	
	<% while(rs.next()){
	String seqid = rs.getString("seqid");
	String title = rs.getString("title");
	String writer = rs.getString("writer");
	String hits = rs.getString("hits");
	String rdate = rs.getString("rdate");
	%>
	<tr >
		<td><%=pageRownum %></td>
		<td style="text-align:left">&nbsp;<a href="boardDetail.jsp?seqid=<%=seqid %>"><%=title %></a></td>
		<td><%=writer %></td>
		<td><%=hits %></td>
		<td><%=rdate %></td>
	</tr>

<%
	pageRownum--;
	}
%>

</table>

<div class="div_page">
	<%
		for(int p = 1; p<=totalpage; p++){
			//out.print(p);
		%>
		<a href="boardList2.jsp?page=<%=p %>"><%=p %></a>
	<% 	
		}
	%>
</div>

</body>
</html>