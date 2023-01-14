<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
/*  #toparea{
		padding: 30px;
	}  */
/* body{
		background-color: #edeef1
	} */
</style>
<title>Insert title here</title>
</head>
<body>
	
	<div style="height:90px" style="padding:10px">
		<div id="toparea"  class="navbar navbar-inverse">
			<a href="/ggo/index.do" style="position:absolute;top:30px;font-size: 18pt; font-weight: bolder;text-decoration: none;padding-left: 10px">GGO</a>
			<ul class="nav navbar-nav navbar-right" 
			 style="position:relative ;top:20px" >
			 
			 
				<c:choose>
						<c:when test="${user==null}" >
							
							<li style="margin-right: 20px;height: 70px">
							<a href="/ggo/reg_Page"><span class="glyphicon glyphicon-log-in">
								</span>    join</a></li>
							
				
				
				
							<li style="margin-right: 20px;height: 70px">
							<a href="/ggo/login_Page"><span class="glyphicon glyphicon-log-in">
		 						</span>   Login</a></li>
							</ul>
						</c:when>
						
						
						<c:otherwise>
						<h5>${user.name }님 </h5>
							<li><a href="/ggo/logout.do"><span class="glyphicon glyphicon-log-out"></span>
									Logout</a></li>
							</ul>
						
						
						
							<span  class="navbar-form pull-right" >	
								<img  class="img-circle" style="width: 60px;height: 70px"
											src="/ggo/images/<%-- ${user.profile_photo} --%> "  />
							</span>  
						</c:otherwise>
		
				</c:choose>
				
				
				
				
			<form class="navbar-form pull-right" style="position:relative ;top:20px">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
				
			</form>
			
		</div>
		
	</div>
	<nav>
		<div class="container-fluid">
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<!-- <li class="active"><a href="#">Home</a></li>
					<li><a href="/erp/menu/insa.do">업무관리</a></li>
					<li><a href="/erp/menu/board.do">커뮤니티</a></li> -->
					<li><a href="#">업무관리</a></li>
					<li><a href="/ggo/b_category.do?category=all">게시판list</a></li>
					<li><a href="/ggo/B_register">게시판등록하기</a></li>
					<li><a href="/ggo/listall.do?sort=all">ex)(관리자)회원리스트</a></li>
					<li><a href="/ggo/b_list.do">페이지테스트</a></li>
				</ul>

			</div>
		</div>
	</nav>
</body>
</html>