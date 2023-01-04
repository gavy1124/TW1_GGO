<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
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
  <%-- <%
  	ArrayList<EmpDTO> emplist = (ArrayList<EmpDTO>)request.getAttribute("emplist");
  	int size = emplist.size();
  %> --%>
</head>
<body>
			<form action="">
				<select name="category"  id="category">
					<option value="all">전체게시물</option>
					<option value="경조사">경조사</option>
					<option value="사내소식">사내소식</option>
					<option value="게시판">게시판</option>
				</select>
			</form>
			<!-- 테스트  -->
<!--타임리프 http://oss.opensagres.fr/tem.repository/1.2.0/  -->
<!-- <img src="/ggo/images/kbr.jpg" width="200" height="300"> -->
<!-- <img src="/ggo/resources/images/ironman.jpg" width="200" height="300">
<img src="/ggo/images/ironman.jpg" width="200" height="300">
<img src="/ggo/images2/Yeona.jpg" width="200" height="300"> -->


	<div>
		<table class="table">
			<thead>
				<tr>
					<th>회원번호</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>이메일</th>
					<th>구분</th>
					<th>가입일</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var = "member" items="${listall}">
						<tr>
							<%-- <td><a href="/springmvc/emp/read.do?id=<%=emp.getId()%>"><%= emp.getId() %></a></td> --%>
							<td>${member.no }</td>
							<td><a href="/ggo/idRead.do?id=${member.id}&state=READ">${member.id}</a></td>
							<td>${member.pass }</td>
							<td>${member.name }</td>
							<td>${member.tel }</td>
							<td>${member.addr }</td>
							<td>${member.email }</td>
							<td>${member.sort }</td>
							<td>${member.regdate}</td>
							<td><a href="/ggo/idRead.do?state=UPDATE&id=${member.id}">수정</a></td>
							<td><a href="/ggo/idDelete.do?id=${member.id}">삭제</a></td>
							<%-- <td><%= emp.getName() %></td>
							<td><%= emp.getDeptno() %></td>
							<td><%= emp.getGrade() %></td>
							<td><%= emp.getAddr() %></td>
							<td><%= emp.getPoint() %></td>
							<td><a href = "/springmvc/emp/delete.do?id=<%=emp.getId()%>">삭제</a></td> --%>
						</tr>
					</c:forEach>
			</tbody>
		</table>
	</div>
	<form action="/ggo/dataSearch.do" method="post">
		<select name="tag">
			<option value="no">회원번호</option>
			<option value="id">작성자</option>
			<option value="regdate">작성일</option>
		</select> 
		
		<input type="text" name="searchData" /> 
		<input type="submit" value="검색">
	</form>
		
		<ul class="nav navbar-nav navbar-right">
			<li><a href="/ggo/reg_Page" style="text-align: right;">글쓰기</a></li>
		</ul>
</body>
</html>
