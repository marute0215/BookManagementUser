<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.ToshoExam" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"href="css/index.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>検索結果</title>

</head>
<body>
<h2>モリジョビ図書館</h2><br>

	<h3>検索結果</h3><br>
	<table class="table table-dark table-hover">
		<thead>
    		<tr>
      			<th scope="col">ID</th>
      			<th scope="col">図書名</th>
      			<th scope="col">出版社</th>
      			<th scope="col">ISBN</th>
      			<th scope="col">著者</th>
      			<th scope="col">新旧</th>
    		</tr>
  		</thead>
	
		<%
		List<ToshoExam> list = (List<ToshoExam>)request.getAttribute("list");
		for(ToshoExam ee : list){
		%>
		
		<tr>
			<td><%=ee.getId() %></td>
			<td ><%=ee.getName() %></td>
			<td ><%=ee.getPublisher()%></td>
			<td><%=ee.getIsbn() %></td>
			<td ><%=ee.getAuthor()%></td>
			<td><%=ee.getNew_old() %></td>
			<td>
				<form action="BookMouthListServlet" method="post">
					<input type="hidden" name="id" value="<%=ee.getId() %>">
					<input type="submit" value="口コミを見る">
				</form>
			</td>
		</tr>
		<%
		}
		%>
		</form>
		</table>
		<h3><a href="TopServlet">戻る</a></h3>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>