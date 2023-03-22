<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="dto.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規会員登録画面</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
			String errorCode = request.getParameter("error");
			if(errorCode != null && errorCode.equals("1")){
		User ac = (User)session.getAttribute("input_data");
	%>
		<p style="color:red">登録に失敗しました。</p>
		<h3>新規会員登録</h3>
		<form action="RegisterExecuteServlet" method="post">
			メール：<input type="email" name="email" value="<%=ac.getMail()%>"><br>
			姓：<input type="text" name="surname" value="<%=ac.getSurname()%>"><br>
			名：<input type="text" name="name" value="<%=ac.getName()%>"><br>
			住所：<input type="text" name="address" value="<%=ac.getAddress()%>"><br>
			パスワード：<input type="password" name="pw"><br>
			<input type="submit" value="登録">
		</form>
	<%
		} else {
	%>
	<h3>新規会員登録</h3>
	<form action="RegisterExecuteServlet" method="post">
		メール：<input type="email" name="email"><br>
		姓：<input type="text" name="surname"><br>
		名：<input type="text" name="name"><br>
		住所：<input type="text" name="address"><br>
		パスワード：<input type="password" name="pw"><br>
		<input type="submit" value="登録">
	</form>
	<%
		}
	%>
</body>
</html>