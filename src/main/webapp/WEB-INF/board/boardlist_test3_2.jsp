<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Paginatejs | Ligne</title>
    <link rel="stylesheet" href="/ggo/common/css/paginate.css">
    <link rel="stylesheet" href="/ggo/common/css/ligne.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/ggo/common/js/paginate.js"></script>

    <style>
        *{
            font-family: sans-serif;
        }
    </style>
</head>
<body>
<div class="container">
    <div>
        <h1> paging 테스트3-2</h1>
 
    
    
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
		
    
    
    
    
    
    <table class="myTable table hover">
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
<!-- 
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
 -->
   
       
            <div class="input-group">
                <label for="searchBox">검색 :  </label>
                <input type="search" id="searchBox" placeholder="Filtrar...">
            </div>
</div>

<script>

    let options = {
        numberPerPage:5, //Cantidad de datos por pagina
        goBar:true, //Barra donde puedes digitar el numero de la pagina al que quiere ir
        pageCounter:true, //Contador de paginas, en cual estas, de cuantas paginas
    };

    let filterOptions = {
        el:'#searchBox' //Caja de texto para filtrar, puede ser una clase o un ID
    };

    paginate.init('.myTable',options,filterOptions);
    
    
 	var category = "${category}"
 		$(document).ready(function () {
 			//alert(category)
 			$("#category").val(category).attr("selected","selected");
 			$("#category").change(function () {
 				location.href="/ggo/page_test3_2?category="+encodeURI($(this).val());
 			})
 			
 		}) 
</script>
</body>
</html>