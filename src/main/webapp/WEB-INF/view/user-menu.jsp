<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>利用者画面</title>
</head>
<body>
	<h2>モリジョビ図書館</h2>
　　<%
	User ac = (User)session.getAttribute("user");
	%>
	<p>ようこそ<%= ac.getName() %>さん</p>
	
	<h2>管理者管理</h2>
	<a href="UserBookHistoryServlet">借用履歴</a><br>
	<a href="UserBookMouthListServlet">最新の口コミ</a><br>
	<a href="LogoutServlet">ログアウト</a><br>
	
</body>
</html>