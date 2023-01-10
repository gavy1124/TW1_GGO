<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript">
	var category = "${category}"
	$(document).ready(function () {
		//alert(category)
		$("#category").val(category).attr("selected","selected");
		$("#category").change(function () {
//		alert("#category".val());////////////////////////////////////////////////////??
			location.href="/ggo/b_category.do?category="+encodeURI($(this).val());
		})
		
	})
	

	
</script>
</head>
<body>
	<h1>JSTL게시판</h1>
	
	
	<div style="padding-top: 30px">
		<div class="col-md-3" style="padding-bottom:10px">
		    구분:
			<form action="">
				<select name="category"  id="category">
					<option value="all">전체게시물</option>
					<option value="경조사">경조사</option>
					<option value="사내소식">사내소식</option>
					<option value="게시판">게시판</option>
				</select>
			</form>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${boardlist }">
					<tr>
						<td>${board.no }</td>
						<td>${board.category }</td>
						<td><a href="/ggo/b_read.do?no=${board.no}&state=READ"> ${board.title }</a></td>
						<td>${board.content }</td>
						<td>${board.id }</td>
						<td>${board.write_date }</td>
						
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<form action="/springmvc/board/search.do" method="post">
		<select name="tag">
			<option value="id">작성자</option>
			<option value="title">제목</option>
			<option value="content">본문</option>
			<option value="write_date">작성일</option>
		</select> <input type="text" name="search" /> <input type="submit" value="검색">
		<ul class="nav navbar-nav navbar-right">
			<li><a href="" style="text-align: right;">글쓰기</a></li>
		</ul>
	</form>

</body>
</html>
