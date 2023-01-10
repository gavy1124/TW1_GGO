<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<form>
		no 검색:<input type="text" name="no" id="no">
		<input type="button" value="ajax테스트" id="testbtn"><br/> 
		<div id="result">
	</div><br/>
		
		id 검색:<input type="text" name="id" id="id">
		<input type="button" value="testjsonbtn2" id="testjsonbtn2"> 	
	</form>
	
	<div id="result2">
		<h4>넘버:<span id="board_no"></span></h4>
		<h4>이메일:<span id="board_email"></span></h4>
		<h4>아이디:<span id="board_id"></span></h4>
		<h4>패스:<span id="board_pass"></span></h4>
	</div>
	
	<script type="text/javascript"> // no중복확인(티몬처럼)
		$(document).ready(function () {
			$("#testbtn").on("click", function () {
				var querydata = {"no":$("#no").val()}
				
				$.ajax({
					url : "/ggo/ajax/exam",
					type : "get",
					data : querydata,
					dataType : "text",
					success : s_param,
					error : e_param
				})
			})
			
/* _____________________________________________________________________________________________________________________  */			
			
			$("#testjsonbtn2").on("click", function () {
				var querydata = {"id":$("#id").val()}
				alert(querydata)
				$.ajax({
					url : "/ggo/ajax/exam02",
					type : "get",
					data : querydata,
					dataType : "json",
					success : function(data) {
						//alert(data)
						$("#board_no").html("<h2>" + data.no + "</h2>");
						$("#board_email").html("<h2>" + data.email + "</h2>");
						$("#board_id").html("<h2>" + data.id + "</h2>");
						$("#board_pass").html("<h2>" + data.pass + "</h2>");
					},
					error : function(obj, msg, statusMsg) {
						$("#result2").html("<h2> 오류발생 : " + obj + " , " + msg + " , " + statusMsg + "</h2>")
					}
				})
			})
		})
		function s_param(ss) {
			$("#result").html("<h2> 자바결과:" +ss+"</h2>")
		}
		function e_param(obj, msg, statusMsg) {
			$("#result").html("<h2> 오류발생 : " +obj+" , "+msg+" , "+statusMsg+"</h2>")
		}
	</script>
</body>
</html>