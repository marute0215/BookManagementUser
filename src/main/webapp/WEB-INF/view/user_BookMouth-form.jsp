<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>口コミ投稿画面</title>
</head>
<body>
	<%
	String book_name = (String)session.getAttribute("book_name");
	%>
	<h2>モリジョビ図書館</h2>
	<p>口コミ投稿</p>
	
	<form action="BookMouthRegisterServlet" method="post">
	<h2 >図書名：<%=book_name %>></h2><br>
	<p>投稿文<textarea name="comment" cols="30" rows="5"></textarea></p><br>
	評価：1<input type="radio" name="assessment" value="1">
		  2<input type="radio" name="assessment" value="2">
		  3<input type="radio" name="assessment" value="3">
		  4<input type="radio" name="assessment" value="4">
		  5<input type="radio" name="assessment" value="5">
	<input type="submit" value="投稿"><br>
	<a href = "TopServlet">戻る</a>
	</form>
</body>
</html>