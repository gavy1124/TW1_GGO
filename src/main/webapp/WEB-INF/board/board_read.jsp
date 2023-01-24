<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE>
<html>
<head>
<title>인사관리시스템</title>

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>

<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  --> 
  </body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">

	$(document).ready(function(){ //자바스크립트가 실행되면
		data = "${board.category}"//서버에서 받아온 board객체의 getCategory()메소드를 호출해서 값을 받은 후에 자바스크립트 data변수에 저장해주
		$("#category").val(data).attr("selected","selected");
	});

</script>


<style>   //모달에 적용한 css속성값. 
.auction-img-main {
    background-color:#fff !important;
    height: 80% !important;
}
.auction-img-main ul li img {
    height: 80% !important;
}
</style>
</head>
<body>

	<form class="form-horizontal" 
		action="/springmvc/board/read.do?state=UPDATE&board_no=${board.no }" 
		method="post" >

		
		<div class="form-group">
			<div class="col-md-2 text-right">
				<label for="id" class="control-label">번호</label>
			</div>
			<div class="col-md-8">${board.no}</div>
		</div>
		<div class="form-group">
			<div class="col-md-2 text-right">
				<label for="id" class="control-label">게시글종류</label>
			</div>
			<div class="col-md-3">
				<select name="category" class="form-control" 
							id="category">
					<option value="경조사" >경조사</option>
					<option value="사내소식">사내소식</option>
					<option value="게시판">게시판(익명)</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-2 text-right">
				<label for="id" class="control-label">작성자</label>
			</div>
			<div class="col-md-8">${board.id}</div>
		</div>
		<div class="form-group">
			<div class="col-md-2 text-right">
				<label for="title" class="control-label">제목</label>
			</div>
			<div class="col-md-8">${board.title }</div>
		</div>
		
		<!--  -->
		
		
		
		
		
		
			<div class="form-group">
			<div class="col-md-2 text-right">
				<label for="title" class="control-label">첨부파일</label>
			</div>
			<div class="col-md-8">
				<!-- 디비에저장된 파일명을 출력(클라이언트가 선택한 파일명) -->
				<c:forEach var="file" items="${boardfiledtolist }">
					<h5><a  href="/ggo/download/${board.id}/${board.no}/${file.boardFileno}">${file.originalFilename}</a></h5>
				
				</c:forEach>
				
			
			
		
		
			
			
			
			</div>
		</div>
		
		
		
		
		
		
		
		
		<!--  -->
		
		<div class="form-group">
			<div class="col-md-2 text-right">
				<label for="title" class="control-label">작성날짜</label>
			</div>
			<div class="col-md-8">${board.write_date }</div>
		</div>
		<div class="form-group">
			<div class="col-md-2 text-right">
				<label for="text" class="control-label">내용</label>
			</div>
			<div class="col-md-8"
				style="width: 500px; height: 400px; border: solid 1px;">
				${board.content }
				</div>
		</div>






<!-- 모달테스트____________________________________________________________________________ -->
<!-- Large modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">Large modal</button>

<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      ...
    </div>
  </div>
</div>

<!-- Small modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">Small modal</button>

<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      ...ddddd
    </div>
  </div>
</div>
<!-- ____________________________________________________________________________ -->
















		<div class="form-group">
			<div class="col-md-10 text-center">
				
				
				<input type="submit" class="btn btn-lg btn-primary" 
				value="수정">

				<button type="button" class="btn btn-danger btn-lg"
					onclick="location.href='/stswebTest/board/list.do'">
					<i class="fa fa-fw fa-close"></i> 목록
				</button>
				
				<button type="button" class="btn btn-danger btn-lg"
					id="deletebtn">
					<i class="fa fa-fw fa-close"></i> 삭제
				</button>
			</div>
		</div>
	</form>

</body>
</html>