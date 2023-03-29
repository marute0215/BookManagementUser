<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="dto.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"href="css/index.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>ゲスト画面_top</title>
</head>
<body>
	
	<h2>モリジョビ図書館</h2><br>
	
	<h3>ゲストページ</h3><br>
	<a href="RegisterFormServlet">新規会員登録</a><br><br>
	<a href="LoginFormServlet">ログインページ</a><br><br>
	
	<form action="SearchBookServlet" method="post">
	<h3>図書検索</h3>
	<h3 >図書名：<input type="text" name="name"></h3><br>
	<input type="submit" value="検索"><br>
	</form>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>