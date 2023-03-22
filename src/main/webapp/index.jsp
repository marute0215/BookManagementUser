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
	図書検索 <input type="text" name="name">
		<input type="submit" value="検索">
	</form>
	<p>最新の口コミ一覧</p>
	
</body>
</html>