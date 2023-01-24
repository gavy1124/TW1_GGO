<%@page import="com.multi.ggo.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link href="/erp/common/css/font-awesome.css" rel="stylesheet" />
 --><!-- Custom styles for this template -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<!-- document 가 준비되면 ㅁ 할거다 / 준비구분은(페이지로딩되면 준비된상태로봄) -->
<!-- <script type="text/javascript">
	$(document).ready(function(){ //자바스크립트가 실행되면
		data = "${board.category}" //서버에서 받아온 board객체의 getCategory() 메소드를 호출해서 값을 받은후에 자바스크립트 data변수에 저장해줘
		$("#category").val(data).attr("selected", "selected"); //// 
	  //  #category은 #은 태그내 id를말함 //  어트리뷰트명, 어트리뷰트 속성
	});
	
</script> -->

<script type="text/javascript">

	
	//구분저장공유
	$(document).ready(function() {
		data = "${idRead.sort}"
		$("#sort").val(data).attr("selected","selected");
	});
</script>


</head>
<body>
	
	
	<h4>
		<i class="fa fa-angle-right"></i> 회원정보수정
	</h4>
	<hr>
	<div class="row mt">
		<div class="col-lg-12">
			<div class="form-panel">

				<form class="form-horizontal style-form"  action="/ggo/idUpdate.do" method="post">
					
				
			<%-- 	<div class="form-group">
					<div class="col-md-2 text-right">
						<label for="sort" class="control-label">구분</label>
					</div>
					<div class="col-md-8">${idRead.sort}</div>
					<input type="hidden" class="form-control" name="sort" value="${idRead.sort}">
				</div> --%>
				
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
				
				
				
				
				
				
				
				
				
				
				
					
				<div class="form-group">
					<div class="col-md-2 text-right">
						<label for="id" class="control-label">회원번호</label>
					</div>
					<div class="col-md-8">${idRead.no}</div>
					<input type="hidden" class="form-control" name="no" value="${idRead.no}">
				</div>
					
				<div class="form-group">
					<div class="col-md-2 text-right">
						<label for="id" class="control-label">아이디</label>
					</div>
					<div class="col-md-8">${idRead.id}</div>
					<input type="hidden" class="form-control" name="id" value="${idRead.id}">
				</div>
				
				<div class="form-group">
					<div class="col-md-2 text-right">
						<label for="pass" class="control-label">비밀번호</label>
					</div>
					<div class="col-md-5">
					<input type="text" class="form-control" name="pass" value="${idRead.pass}">
					</div>
				</div>
				
				
				<div class="form-group">
					<div class="col-md-2 text-right">
						<label for="name" class="control-label">이름</label>
					</div>
					<div class="col-md-5">
					<input type="text" class="form-control" name="name" value="${idRead.name}">
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-md-2 text-right">
						<label for="tel" class="control-label">전화번호</label>
					</div>
					<div class="col-md-5">
					<input type="text" class="form-control" name="tel" value="${idRead.tel}">
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-md-2 text-right">
						<label for="addr" class="control-label">주소</label>
					</div>
					<div class="col-md-5">
					<input type="text" class="form-control" name="addr" value="${idRead.addr}">
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-md-2 text-right">
						<label for="email" class="control-label">이메일</label>
					</div>
					<div class="col-md-5">
					<input type="text" class="form-control" name="email" value="${idRead.email}">
					</div>
				</div>
				
				
				
				<div class="form-group">
					<div class="col-md-2 text-right">
						<label for="regdate" class="control-label">가입일</label>
					</div>
					<div class="col-md-8">${idRead.regdate}</div>
					<input type="hidden" class="form-control" name="regdate" value="${idRead.regdate}">
				</div>
					
					
					
					
					
					
					
					
					
					<%-- 
					
					<input type="hidden" name="board_no" value="${board.board_no}">
					<div class="form-group">
						<div class="col-md-2 text-right">
							<label for="id" class="control-label">게시글종류</label>
						</div>
						<div class="col-md-3">
							<select name="category" class="form-control" id="category">
								<option value="경조사">경조사</option>
								<option value="사내소식">사내소식</option>
								<option value="게시판">게시판</option>
							</select>
						</div>
					</div>
					<div class="form-group" style="border: 1px solid #eff2f7;">
						<label class="col-sm-2 col-sm-2 control-label">작성자</label>
						<div class="col-sm-10">

							<p class="form-control-static">
								${board.id}
							</p>
						</div>
					
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">제목</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="title" value="${board.title}"> <span
									class="help-block" > 게시글 유형에 맞는 내용으로 작성 부탁드립니다. </span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">내용</label>
							<div class="col-sm-8" > 
								<textarea id="content"  
									style="width: 100%; border: 1; overflow: visible; text-overflow: ellipsis;"
									rows=15 name="content" >${board.content}</textarea>

							</div>
						</div> --%>
						
						
						
						<div class="form-group">
							<div class="col-lg-4 text-center"></div>
							<div class="col-lg-2 text-center">
								<button type="submit" class="btn btn-success"
									style="width: 100px; background-color: #0ea006">수정완료</button>
							</div>
							<div class="col-lg-2 text-center">
								<button type="reset" class="btn btn-default"
									style="width: 100px; background-color: #9a9a9a">취소</button>
							</div>

						</div>
						</form>
						
					</div>
					
				</form>
			</div>
		</div>
	</div>
</body>
</html>