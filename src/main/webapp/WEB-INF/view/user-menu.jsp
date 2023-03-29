<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"href="css/index.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>利用者画面</title>
</head>
<body>
	<h2>モリジョビ図書館</h2><br>
　　<%
	User ac = (User)session.getAttribute("user");
	%>
	<p>ようこそ<%= ac.getName() %>さん</p>
	

	<h3>ユーザーメニュー</h3><br>
	<a href="UserBookHistoryServlet">借用履歴</a><br><br>
	<a href="UserBookMouthListServlet">最新の口コミ</a><br><br>
  <a href="LogoutServlet">ログアウト</a><br>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>