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
			location.href="/ggo/b_category.do?category="+encodeURI($(this).val());
		})
		
	}) 
	
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="/ggo/page_test2.do?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
	
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
		</div>
		
		
		<div id="outter">
	<div style="float: right;">
		<select id="cntPerPage" name="sel" onchange="selChange()">
			<option value="5"
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
			<option value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
			<option value="15"
				<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
			<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
		</select>
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
		
		<div style="display: block; text-align: center;">		
			<c:if test="${paging.startPage != 1 }"> <!--startPage가 1이 아니면  시작페이지링크를 보여준다.-->
				<a href="/ggo/page_test2.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
				<!-- startPage링크는 : 시작페이지-1    +  페이지당 글수 를 파라미터로 넘겨줌   -->
			</c:if>
			
			<!-- 반복문 시작   startPage부터 ~ endPage까지  -->
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }"> <!-- startPage부터 ~ endPage까지  == mowPage가 일치하면 페이지생성  -->
						<b>${p }</b>
					</c:when>
					<c:when test="${p != paging.nowPage }"> 
					<!-- startPage부터 ~ endPage까지  == nowPage가 일치불일치시, 링크는 nowPage에 반복숫자 + 페이지당 글수 파라미터로 보냄     -->
						<a href="/ggo/page_test2.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
					</c:when>
				</c:choose>
			</c:forEach>
			
			
			<c:if test="${paging.endPage != paging.lastPage}">  <!-- endPage 와 lastPage 불일치시 endPage +1 과 cntPerPage를 파라미터보냄 -->
				<a href="/ggo/page_test2.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
			</c:if>
		</div>
		
		
		
		
		
		
		
		
		
		
		  <%-- 
		  <c:if test="${pageMaker.prev}"><!--시작페이지가 1이 아닌경우 보인다.  -->
		    <li class="page-item"><a class="page-link" href="${pageMaker.startPage-1}">Previous</a></li>
		  </c:if>
		  <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
		    <li class="page-item ${pageMaker.criteria.pageNum == num ? 'active':''}"><a class="page-link" href="/ggo/b_list.do?pageNum=${num }">${num}</a></li>
		  </c:forEach>
		  <c:if test="${pageMaker.next}"> <!-- 끝 페이지가 마지막 페이지가 아닌경우보인다. -->
		    <li class="page-item"><a class="page-link" href="${pageMaker.endPage+1}">Next</a></li>
		   </c:if> 
		   --%>
		   
		   
		  </ul>
		</nav>
		
		
		
		
		
		
<%-- 		
		 
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
					//alert("페이지이동클릭");
					e.preventDefaut();  //페이지 이동을 무시시킨다. return false와 동일 
					//actionForm.find("input[name='pagenum]")
					$("#pageNum").val($(this).attr("href"));
					$("#actionForm").submit();
				})
			})
		
		
		</script>
		 --%>
		
		
		
		
		
		
		
		
		
	<form action="/ggo/serarchData.do" method="post">
		<select name="tag">
			<option value="id">작성자</option>
			<option value="title">제목</option>
			<option value="content">내용</option>
			<option value="write_date">작성일</option>
		</select> 
		<input type="text" name="searchData" id="searchData"/> 
		<input type="submit" value="검색">
		<ul class="nav navbar-nav navbar-right">
			<li><a href="" style="text-align: right;">글쓰기</a></li>
		</ul>
	</form>













</body>
</html>
