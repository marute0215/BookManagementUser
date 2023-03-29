<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.UserMouth" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"href="css/index.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>口コミ投稿一覧</title>

</head>
<body>
<h2>モリジョビ図書館</h2><br>

	<h3>口コミ投稿一覧</h3><br>
	<table class="table table-dark table-hover">
		<thead>
    		<tr>
      			<th scope="col">図書名</th>
      			<th scope="col">姓</th>
      			<th scope="col">口コミ</th>
      			<th scope="col">評価</th>
      			<th scope="col">投稿日時</th>
    		</tr>
  		</thead>
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
		<h3><a href="TopServlet">戻る</a></h3>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>