<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<title>인사관리시스템</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript">
 
 
 
	//구분저장공유
	$(document).ready(function() {
		data = "${idRead.sort}"
		$("#sort").val(data).attr("selected","seleted");
	});
</script>



<!-- 
<script type="text/javascript">
	$(document).ready(function(){ //브라우저가 로딩되면
		data = "${board.category}" 
		//서버에서 받아온 board객체의 getCategory() 메소드를 호출해서, 
		//값을 받은후에 자바스크립트 data변수에 저장해줘
		$("#category").val(data).attr("selected", "selected"); //// 
	  //  #category은 #은 태그내 id를말함 //  어트리뷰트명, 어트리뷰트 속성
	});
	
</script> -->

</head>
<body>

		












	<form class="form-horizontal" 
		action="/ggo/idRead.do?state=UPDATE&id=${idRead.id}" 
		method="post" >
		
				
		<div class="form-group">
			<label class="col-sm-2 col-sm-2 control-label">구분</label>

			<div class="col-sm-3">
				<select class="form-control" id="sort" name="sort" >
					<option value="중고">중고</option>
					<option value="나눔">나눔</option>
					<option value="업체">업체</option>
				</select>
			</div>
		</div>
		
		
		
	<%-- 	<div class="form-group">
			<div class="col-md-2 text-right">
				<label for="id" class="control-label">번호</label>
			</div>
			<div class="col-md-8">${board.board_no}</div>
		</div> --%>
		<!-- <div class="form-group">
			<div class="col-md-2 text-right">
				<label for="id" class="control-label">게시글종류</label>
			</div>
			<div class="col-md-3">
				<select name="category" class="form-control" 
							id="category">
					<option value="경조사">경조사</option>
					<option value="사내소식">사내소식</option>
					<option value="게시판">게시판(익명)</option>
				</select>
			</div>
		</div> -->
		<%-- <c:forEach var="id_Read" items="${idRead}">  --%>
				<div class="form-group">
					<div class="col-md-2 text-right">
						<label for="id" class="control-label">회원번호</label>
					</div>
					<div class="col-md-8">${idRead.no}</div>
				</div>
				<div class="form-group">
					<div class="col-md-2 text-right">
						<label for="title" class="control-label">아이디</label>
					</div>
					<div class="col-md-8">${idRead.id}</div>
				</div>
				
				<div class="form-group">
					<div class="col-md-2 text-right">
						<label for="title" class="control-label">비밀번호</label>
					</div>
					<div class="col-md-8">${idRead.pass}</div>
				</div>
				
				
				<div class="form-group">
					<div class="col-md-2 text-right">
						<label for="title" class="control-label">이름</label>
					</div>
					<div class="col-md-8">${idRead.name}</div>
				</div>
				
				<div class="form-group">
					<div class="col-md-2 text-right">
						<label for="title" class="control-label">전화번호</label>
					</div>
					<div class="col-md-8">${idRead.tel}</div>
				</div>
				
				<div class="form-group">
					<div class="col-md-2 text-right">
						<label for="title" class="control-label">주소</label>
					</div>
					<div class="col-md-8">${idRead.addr}</div>
				</div>
				
				<div class="form-group">
					<div class="col-md-2 text-right">
						<label for="title" class="control-label">이메일</label>
					</div>
					<div class="col-md-8">${idRead.email}</div>
				</div>
				
				
				
				
				
			<%-- 	<div class="form-group">
					<div class="col-md-2 text-right">
						<label for="title" class="control-label">구분</label>
					</div>
					<div class="col-md-8">${idRead.sort}</div>
				</div> --%>
				
				
				
				
				
				
				
				
				<div class="form-group">
					<div class="col-md-2 text-right">
						<label for="title" class="control-label">가입일</label>
					</div>
					<div class="col-md-8">${idRead.regdate}</div>
				</div>
		
<%-- </c:forEach>  --%> 
		<%-- 
			<div class="form-group">
			<div class="col-md-2 text-right">
				<label for="title" class="control-label">첨부파일</label>
			</div>
			<div class="col-md-8">
				<!-- 디비에 저장된 파일명을 출력( 클라이언트가 선택한 파일명) JSTL사용-->
				<c:forEach var="file" items="${boardfiledtolist}">
					<h5><a href="/erp/board/download/${board.id}/${board.board_no}/${file.boardFileno}">${file.originalFilename}</a></h5>
				</c:forEach>
			</div>
		</div> --%>
		
		
		
		
		
		
		<%-- 
		
		<div class="form-group">
			<div class="col-md-2 text-right">
				<label for="title" class="control-label">작성날짜</label>
			</div>
			<div class="col-md-8">${board.write_date}</div>
		</div>
		<div class="form-group">
			<div class="col-md-2 text-right">
				<label for="text" class="control-label">내용</label>
			</div>
			<div class="col-md-8"
				style="width: 500px; height: 400px; border: solid 1px;">
				${board.content}
				</div>
		</div>
 --%>
		<div class="form-group">
			<div class="col-md-10 text-center">
				<input type="submit" class="btn btn-lg btn-primary" value="수정" >

				<button type="button" class="btn btn-danger btn-lg"
					onclick="location.href='/ggo/listall.do'">
					<i class="fa fa-fw fa-close"></i> 목록
				</button>
				<button type="button" class="btn btn-danger btn-lg" id="deletebtn" onclick="location.href='/ggo/idDelete.do?id=${idRead.id}'">
					<i class="fa fa-fw fa-close"></i> 삭제
				</button>
			</div>
		</div>
	</form>

</body>
</html>