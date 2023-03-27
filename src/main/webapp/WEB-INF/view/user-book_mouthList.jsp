<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.UserMouth" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>最新の口コミ投稿</title>

</head>
<body>

	<h2>最新の口コミ投稿</h2>
	<table border="1">
		<tr>
			<th>図書名</th>
			<th>姓</th>
			<th>口コミ</th>
			<th>評価</th>
			<th>投稿日時</th>
		</tr>
	
		<%
		List<UserMouth> UserMouthList = (List<UserMouth>)request.getAttribute("UserMouthList");
		for(UserMouth mm : UserMouthList){
		%>
		
		<tr>
			<td ><%=mm.getBook_name() %></td>
			<td ><%=mm.getSurname() %></td>
			<td ><%=mm.getWord_mouth() %></td>
			<td ><%=mm.getAssessment() %></td>
			<td ><%=mm.getCreated_at() %></td>
		</tr>
		<%
		}
		%>
		</table>
		<h2><a href="TopServlet">戻る</a></h2>
		
</body>
</html>