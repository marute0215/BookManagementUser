<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.UserMouth" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>口コミ投稿一覧</title>

</head>
<body>

	<h2>口コミ投稿一覧</h2>
	<table border="1">
		<tr>
			<th>図書名</th>
			<th>姓</th>
			<th>口コミ</th>
			<th>評価</th>
			<th>投稿日時</th>
		</tr>
	
		<%
		List<UserMouth> BookMouthList = (List<UserMouth>)request.getAttribute("BookMouthList");
		for(UserMouth bb : BookMouthList){
		%>
		
		<tr>
			<td ><%=bb.getBook_name() %></td>
			<td ><%=bb.getSurname() %></td>
			<td ><%=bb.getWord_mouth() %></td>
			<td ><%=bb.getAssessment() %></td>
			<td ><%=bb.getCreated_at() %></td>
		</tr>
		<%
		}
		%>
		</table>
		<h2><a href="TopServlet">戻る</a></h2>
		
</body>
</html>