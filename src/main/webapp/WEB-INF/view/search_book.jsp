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
	<a href="RegisterFormServlet">新規会員登録</a><br>
	<a href="LoginFormServlet">ログインページ</a><br>
	検索結果
	<table class="table table-dark table-hover">
		<thead>
    		<tr>
      			<th scope="col">図書名</th>
      			<th scope="col">出版社名</th>
      			<th scope="col">著者名</th>
      			<th scope="col">新・旧</th>
      			<th scope="col">格納エリア</th>
    		</tr>
  		</thead>
	
	    <%
		List<ToshoExam> list = (List<ToshoExam>)request.getAttribute("list");
		for(ToshoExam ee : list){
		%>
		
	<tr>
		<td><%=ee.getName()%></td>
		<td><%=ee.getPublisher()%></td>
		<td><%=ee.getAuthor()%></td>
		<td><%=ee.getNew_old()%></td>
		<td><%=ee.getHouse()%></td>
	</tr>
		<%
		}
		%>
	</table>
	<a href="./">戻る</a>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>