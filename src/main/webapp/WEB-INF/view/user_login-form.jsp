<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		if(request.getParameter("error") != null){	
	%>
		<h2 style="color:red">ログイン失敗</h2>
	<form action="LoginServlet" method="post">
	
		ログインID：<input type="text" name="mail" value="<%=request.getParameter("mail") %>"><br>
		PW：<input type="password" name="pw"><br>
		<input type="submit" value="ログイン"><br>
	<a href="RegisterFormServlet">新規登録はこちら</a>
	</form>
	<%
		} else {
	%>
	<form action="LoginServlet" method="post">
	
		ログインID：<input type="text" name="mail"><br><br><br>
		PW：<input type="password" name="pw"><br><br>
		<input type="submit" value="ログイン"><br><br>
	<a href="RegisterFormServlet">新規登録はこちら</a>
		
	</form>
	
	<%
		}
	%>

</body>
</html>