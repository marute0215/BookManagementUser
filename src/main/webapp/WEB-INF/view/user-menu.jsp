<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
</body>
</html>