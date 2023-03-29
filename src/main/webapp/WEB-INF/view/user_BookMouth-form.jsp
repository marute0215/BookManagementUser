<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"href="css/index.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>口コミ投稿画面</title>
</head>
<body>
<h2>モリジョビ図書館</h2><br>
	<%
	String book_name = (String)session.getAttribute("book_name");
	%>
	<p>口コミ投稿</p>
	
	<form action="BookMouthRegisterServlet" method="post">
	<h3>図書名：<%=book_name %>></h3><br>
	<h3>投稿文<h3>
	<p><textarea name="comment" cols="30" rows="5"></textarea></p><br>
	評価：1<input type="radio" name="assessment" value="1">
		  2<input type="radio" name="assessment" value="2">
		  3<input type="radio" name="assessment" value="3">
		  4<input type="radio" name="assessment" value="4">
		  5<input type="radio" name="assessment" value="5"><br><br>
	<input type="submit" value="投稿"><br><br>
	<a href = "TopServlet">戻る</a>
	</form>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>