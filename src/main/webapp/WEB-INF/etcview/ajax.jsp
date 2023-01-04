<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Ajax테스트하기</h1>
	<form name="myform">
		<input type="text" name="id" id="id"/>
		<input type="text" name="name" id="name"/>
		<input type="button" id="ajaxbtn" value="ajax테스트">
	</form>
	<div id="result"></div>
	
	<h1>Ajax테스트하기(JQuery...get)</h1>
	<form name="myform">
		<input type="text" name="id" id="id"/>
		<input type="button" id="ajaxbtn" value="ajax테스트">
	</form>
	<div id="result"></div>


	<h1>Ajax테스트하기(JQuery...post)</h1>
	<form name="myform">
		<input type="text" name="id" id="id"/>
		<input type="button" id="ajaxbtn" value="ajax테스트">
	</form>
	<div id="result"></div>
</body>
</html>