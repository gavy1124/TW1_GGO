<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
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
		$("#sort").val(data).attr("selected","selected");
	});
</script>

 <style>
      .modal {
        position: absolute;
        top: 0;
        left: 0;

        width: 100%;
        height: 100%;

        display: none;

        background-color: rgba(0, 0, 0, 0.4);
      }

      .modal.show {
        display: block;
      }

      .modal_body {
        position: absolute;
        top: 50%;
        left: 50%;
		text-align:left;
        width: 200px;
        height: auto;

        padding: 5px;

        text-align: center;

        background-color: rgb(255, 255, 255);
        border-radius: 10px;
        box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

        transform: translateX(-50%) translateY(-50%);
      }
    </style>

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
					<option value="골드">골드</option>
					<option value="실버">실버</option>
					<option value="브론즈">브론즈</option>
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
					<div class="col-md-8" >
					<input type="button" id="modal-open" value="${idRead.id}" style="border: 0em;">
					</div>
					
					
				</div>
				
				<!-- --------------------------------------------------------- -->
				<div class="modal" id="modal">
					<div class="modal_body">
						<ul>
							<li><a href="" onclick="location.href='#'">쪽지보내기</a></li>
							<li><a href="" onclick="location.href='#'">회원정보보기</a></li>
							<li><a href="" onclick="location.href='#'">거래내역보기</a></li>
						</ul>
					</div>
				</div>
				
				<script type="text/javascript">
					 const body = document.querySelector('body');
				      const modal = document.querySelector('.modal');
				      //const btnOpenPopup = document.querySelector('.btn-open-popup');
				      const btnOpenPopup = document.querySelector('#modal-open');

				      btnOpenPopup.addEventListener('click', () => {
				        modal.classList.toggle('show');

				        if (modal.classList.contains('show')) {
				          body.style.overflow = 'hidden';
				        }
				      });

				      modal.addEventListener('click', (event) => {
				        if (event.target === modal) {
				          modal.classList.toggle('show');

				          if (!modal.classList.contains('show')) {
				            body.style.overflow = 'auto';
				          }
				        }
				      });
				</script>
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				<!-- --------------------------------------------------------- -->
				
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
					onclick="location.href='/ggo/listall.do?sort=all'">
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