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
					<th>조회수</th>
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
						<td>${board.hits }</td>
						
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<!--페이지네이션  -->
	 <nav aria-label="Page navigation example center">
		  <ul class="pagination center">
		
		
		
		  <c:if test="${pageMaker.prev}"><!--시작페이지가 1이 아닌경우 보인다.  -->
		    <li class="page-item"><a class="page-link" href="${pageMaker.startPage-1}">Previous</a></li>
		  </c:if>
		  
		  
		  
		  
		  
		  <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
		    <li class="page-item ${pageMaker.criteria.pageNum == num ? 'active':''}"><a class="page-link" href="/ggo/b_list.do?pageNum=${num }">${num}</a></li>
		  </c:forEach>
		  
		  
		  
		  
		  
		  
		  <c:if test="${pageMaker.next}"> <!-- 끝 페이지가 마지막 페이지가 아닌경우보인다. -->
		    <li class="page-item"><a class="page-link" href="${pageMaker.endPage+1}">Next</a></li>
		   </c:if>
		   
		   
		  </ul>
		</nav>
		
		
		
		
		
		
		
		 
		<!-- 페이지네이션 클릭한 페이지로 이딩시키는 정보가있는 form 태그작성  -->
		<form id="actionForm" action="/ggo/b_list.do" method="get">
		<!-- 클릭한 href에 들어있는 이동페이지로 바꿔준다. -->
			<input type="hidden" name="pageNum" value="${pageMaker.criteria.pageNum }" id="pageNum">
			<input type="hidden" name="amount" value="${pageMaker.criteria.amount }">
		
		</form>
		<script type="text/javascript">
			$(function () {
				//var actionForm = $("#actionForm");
				/*  e = event*/
				$(".page-item a").on("click", function (e) {
					alert("페이지이동클릭");
					e.preventDefaut();  //페이지 이동을 무시시킨다. return false와 동일 
					//actionForm.find("input[name='pagenum]")
					$("#pageNum").val($(this).attr("href"));
					$("#actionForm").submit();
				})
			})
		
		
		</script>
		
		
		
		
		
		
		
		
		
		
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
