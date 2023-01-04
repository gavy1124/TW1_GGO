<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="/erp/common/css/main.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

</style>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-7">
				<div id="myCarousel" class="carousel slide" data-ride="carousel"
					style="width: 600px; height: 300px">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
						<li data-target="#myCarousel" data-slide-to="3"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="#" alt="Image"
								style="width: 600px; height: 300px">

						</div>

						<div class="item">
							<img src="#" alt="Image"
								style="width: 800px; height: 300px">

						</div>
						<div class="item">
							<img src="#" alt="Image"
								style="width: 600px; height: 300px">

						</div>

						<div class="item">
							<img src="#" alt="Image"
								style="width: 800px; height: 300px">

						</div>
					</div>

					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel" role="button"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel" role="button"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<div class="col-sm-5">
				<div class="panel panel-primary"
					style="border-color: #edeef1; height: 300px; width: 450px">
					<div class="panel-footer">사내소식</div>
					<div class="panel-body">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#">최근게시판</a></li>
							<li><a href="#">업무공지</a></li>
							<li><a href="#">경조사</a></li>
						</ul>
						<div id="boardMain" style="padding-top: 20px; padding-left: 10px">
							<table>
								<tr>
									<td class="boardContent" style="">mini프로젝트 개최</td>
									<td class="boardDate" style="">2022.12.10</td>
								</tr>
								<tr>
									<td class="boardContent" style="">kimsaemERP ver2.0출시</td>
									<td class="boardDate" style="">2022.11.29</td>
								</tr>
								<tr class="boardRow">
									<td class="boardContent">사옥 이전날짜 확정</td>
									<td class="boardDate">2023.04.11</td>
								</tr>
								<tr class="boardRow">
									<td class="boardContent">보안의 날 참석 인원 확정</td>
									<td class="boardDate">2022.12.11</td>
								</tr>
							
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr />
		<div class="row main-row">
			<div class="col-sm-3">
				<div class="panel panel-primary"
					style="border-color: #edeef1; height: 300px">
					<div class="panel-footer">News</div>
					<div class="panel-body"></div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="panel panel-primary"
					style="border-color: #edeef1; height: 300px">
					<div class="panel-footer">회사소식</div>
					<div class="panel-body"></div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="panel panel-primary"
					style="border-color: #edeef1; height: 300px">
					<div class="panel-footer">회사소식</div>
					<div class="panel-body"></div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="panel panel-primary"
					style="border-color: #edeef1; height: 300px">
					<div class="panel-footer">회사소식</div>
					<div class="panel-body"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>