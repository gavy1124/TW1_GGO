<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="/ggo/common/css/main.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

</style>

<script type="text/javascript">
	$(document).ready(function () {
		//alert("연결Test");
		//each : id가 boardCategory인 엘리먼트의 모든 li하위엘리먼트에 동일한 코드를 적용하겠다
		$("#boardCategory>li").each(function () { //<li class="active"> 클래스 active속성이 있으면 해당li가 선택된상태로 로딩
			//alert("개수만큼 뜨는지 체크")
			$(this).click(function () {
				//alert("선택 탭 test") //작업중인 객체가 선택되면 실행
				category = $(this).text(); // 현재 선택된 li의 text추출
				$("#boardCategory>li").removeAttr("class");   // 모든 li중 선택된것만 나오게 하기위해 클래스속성 제거
				$(this).attr("class", "active"); //클래스속성에 active속성부여 
				
				//ajax요청시작__________________________________________________________
				$.ajax({
					url : "/ggo/b_ajax.do",
					type : "get",
					data : {
						"category":category
					},
					success: function (ajaxlist) {
						//alert(ajaxlist)
						//alert(ajaxlist.length);
						mydata = "";
						for (var i = 0; i < ajaxlist.length; i++) {
							mydata = mydata +
								"<tr><td class='boardDate' style=''><a href='/ggo/b_read.do?no="+ ajaxlist[i].no +"&state=READ'>"
								+ ajaxlist[i].title +"<a></td>"+
								"<td class='boardDate' style=''>"+ ajaxlist[i].write_date +"</td></tr>"
						}
						//기존의 출력된 데이터노드를 삭제하고
						$("#mytable").empty();
						
						//만든테이블 mytable에 append넣기
						$("#mytable").append(mydata); 
						
					},
					error: function (a,b,c) {
						//alert(c);
					}
				})//end ajax
			})// end click
		})// end each
	})// end ready

</script>



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
						<ul class="nav nav-tabs" id="boardCategory">
							<li class="active"><a href="#">게시판</a></li>
							<li><a href="#">사내소식</a></li>
							<li><a href="#">경조사</a></li>
						</ul>
						<div id="boardMain" style="padding-top: 20px; padding-left: 10px">
							<table id="mytable">
								<c:forEach var="board" items="${boardlist }">
								
									<tr>
										<td class="boardDate" style=""><a href="/ggo/b_read.do?no=${board.no}&state=READ">${board.title }<a></td>
										<td class="boardDate" style="">${board.write_date }</td>
									</tr>
								</c:forEach>
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