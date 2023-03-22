<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.ToshoExam" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>検索結果</title>
</head>
<body>
	<a href="RegisterFormServlet">新規会員登録</a><br>
	<a href="LoginFormServlet">ログインページ</a><br>
	検索結果
	<table border="1">
	<tr>
		<td>図書名</td>
		<td>出版社名</td>
		<td>著者名</td>
		<td>新・旧</td>
		<td>格納エリア</td>
	</tr>
	
	    <%
		List<ToshoExam> list = (List<ToshoExam>)request.getAttribute("list");
		for(ToshoExam ee : list){
		%>
		
	<tr>
		<td><%=ee.getName()%></td>
		<td><%=ee.getPublisher()%></td>
		<td><%=ee.getAuthor()%></td>
		<td><%=ee.getNew_old()%></td>
		<td><%=ee.getHouse()%></td>
	</tr>
		<%
		}
		%>
	</table>
	<a href="./">戻る</a>
</body>
</html>