<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="dto.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"href="css/index.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>新規会員登録画面</title>
</head>
<body>
<h2>モリジョビ図書館</h2><br>
	<%
	request.setCharacterEncoding("UTF-8");
			String errorCode = request.getParameter("error");
			if(errorCode != null && errorCode.equals("1")){
		User ac = (User)session.getAttribute("input_data");
	%>
		<p style="color:red">登録に失敗しました。</p>
		<h3>新規会員登録</h3>
		<form action="RegisterExecuteServlet" method="post">
			メール：<input type="email" name="email" value="<%=ac.getMail()%>"><br><br>
			姓：<input type="text" name="surname" value="<%=ac.getSurname()%>"><br><br>
			名：<input type="text" name="name" value="<%=ac.getName()%>"><br><br>
			住所：<input type="text" name="address" value="<%=ac.getAddress()%>"><br><br>
			パスワード：<input type="password" name="pw"><br><br>
			<input type="submit" value="登録"><br><br>
		</form>
		<a href="./">戻る</a>
	<%
		} else {
	%>
	<h3>新規会員登録</h3>
	<form action="RegisterExecuteServlet" method="post">
		メール：<input type="email" name="email"><br><br>
		姓：<input type="text" name="surname"><br><br>
		名：<input type="text" name="name"><br><br>
		住所：<input type="text" name="address"><br><br>
		パスワード：<input type="password" name="pw"><br><br>
		<input type="submit" value="登録"><br><br>
	</form>
	<a href="./">戻る</a>
	<%
		}
	%>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>