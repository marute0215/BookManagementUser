<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="dto.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ゲスト画面_top</title>
</head>
<body>
	
	<h2>モリジョビ図書館</h2>
	
	<h2>管理者管理</h2>
	<a href="RegisterFormServlet">新規会員登録</a><br>
	<a href="LoginFormServlet">ログインページ</a><br>
	
	<form action="SearchBookServlet" method="post">
	<h2>図書検索</h2>
	<h2 >図書名：<input type="text" name="name"></h2><br>
	<input type="submit" value="検索"><br>
	</form>
	
</body>
</html>