<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.BookLendingList" %>
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
	<h3>借用履歴</h3><br>
	<table class="table table-dark table-hover">
		<thead>
    		<tr>
      			<th scope="col">図書名</th>
      			<th scope="col">ISBN</th>
      			<th scope="col">姓</th>
      			<th scope="col">名</th>
      			<th scope="col">メール</th>
      			<th scope="col">借用日</th>
      			<th scope="col">返却予定日</th>
      			<th scope="col">返却日</th>
    		</tr>
  		</thead>
		<%
		List<BookLendingList> bookhistoryList = (List<BookLendingList>)request.getAttribute("bookhistoryList");
		for(BookLendingList hh : bookhistoryList){
		%>
		
		<tr>
			<td ><%=hh.getBook_name() %></td>
			<td ><%=hh.getIsbn() %></td>
			<td ><%=hh.getSurname() %></td>
			<td ><%=hh.getName() %></td>
			<td ><%=hh.getMail() %></td>
			<td ><%=hh.getBorrow_date() %></td>
			<td ><%=hh.getDue_date() %></td>
			<td ><%=hh.getReturn_date() %></td>
			<td>
				<form action="BookMouthFormServlet" method="post">
					<input type="hidden" name="book_name" value="<%=hh.getBook_name() %>">
					<input type="hidden" name="book_id" value="<%=hh.getBook_id() %>">
					<input type="submit" value="口コミ投稿">
				</form>
			</td>
		</tr>
		<%
		}
		%>
		</table>
		<h3><a href="TopServlet">戻る</a></h3>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>