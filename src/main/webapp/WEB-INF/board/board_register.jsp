
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<script type="text/javascript">
	
</script>
</head>

<body>
	<div class="container-fluid">

		<form role="form" class="form-horizontal" action="/ggo/b_insert.do" method="POST" name="myform" enctype="multipart/form-data">
			
			
			<fieldset>
				<div id="legend"></div>
				<div class="form-group" style="padding: 40px">
					<p class="centered">
						<img src="/ggo/images/myphoto.jpg" id="userImage"
							style="width: 100px">
					</p>
					<div>
						<input type="file" name="userImage"
							onchange="document.getElementById('userImage').src = window.URL.createObjectURL(this.files[0])"
							accept="image/*">
					</div>

				</div>

				<div class="form-group">
					<label class="col-sm-2 col-sm-2 control-label"></label>

					<div class="col-sm-3">
						<select class="form-control" id="category" name="category">
							<option value="경조사">경조사</option>
							<option value="사내소식">사내소식</option>
							<option value="게시판">게시판</option>
						</select>
					</div>
				</div>





				<div class="form-group">
					<!-- 아이디-->
					<label class="control-label col-sm-2" for="grade">아이디</label>
					<div class="col-sm-3">
						<input type="hidden" id="id" name="id" placeholder="아이디"
							class="form-control" value="${user.id }"> ${user.id }
					</div>
				</div>




				<div class="form-group">
					<!-- 비밀번호-->
					<label class="control-label col-sm-2" for="grade">제목</label>
					<div class="col-sm-3">
						<input type="text" id="title" name="title" placeholder="제목"
							class="form-control" m>
					</div>
				</div>






				<div class="form-group">
					<!-- 이름-->
					<label class="control-label col-sm-2" for="grade">내용</label>
					<div class="col-sm-3">
						<input type="text" id="content" name="content" placeholder="내용"
							class="form-control">
					</div>
				</div>




				<div class="form-group">
					<div class="col-md-2 text-right">
						<label for="files" class="control-label">파일1</label>
					</div>
					<div class="col-md-8">
						<input type="file" class="form-control input-lg" name="files"
							id="files" placeholder="파일선택">
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-2 text-right">
						<label for="title" class="control-label">파일2</label>
					</div>
					<div class="col-md-8">
						<input type="file" class="form-control input-lg" name="files"
							id="title" placeholder="파일선택">
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-2 text-right">
						<label for="files" class="control-label">파일3</label>
					</div>
					<div class="col-md-8">
						<input type="file" class="form-control input-lg" name="files"
							id="files" placeholder="파일선택">
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-2 text-right">
						<label for="files" class="control-label">파일4</label>
					</div>
					<div class="col-md-8">
						<input type="file" class="form-control input-lg" name="files"
							id="files" placeholder="파일선택">
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-2 text-right">
						<label for="title" class="control-label">파일5</label>
					</div>
					<div class="col-md-8">
						<input type="file" class="form-control input-lg" name="files"
							id="title" placeholder="파일선택">
					</div>
				</div>














				<div class="form-group">
					<!-- Button -->
					<div class="col-sm-3 col-sm-offset-2">
						<input type="submit" value="등록하기" class="btn btn-success" />
					</div>
				</div>
			</fieldset>
		</form>
		<div>
			<a href="/erp/emp/list.do">회원목록보기</a>
		</div>
	</div>

</body>
</html>