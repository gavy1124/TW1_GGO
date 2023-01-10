<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>


<script type="text/javascript">
/*일반 동기(페이지전체전환) ____________________________________________________________ */
		$(document).ready(function(){
			$("#noajaxbtn").on("click", function () {
				location.href="/ggo/ajax/noajax?id="+$("#id1").val(); // id는 자바의 매개변수명과 동일하게 맞춰야함(+input박스 id명도 동일하게)
			})
/*ajax 비동기(페이지전환x)__________________________________________________________________________ */			
			
			$("#ajaxbtn").on("click", function () {
				var inputdata1 = {"id":$("#name").val()} // 자바로 넘어감
				$.ajax({
					url: "/ggo/ajax/ajaxtest01", //url : ajax 요청할 path
					type: "get",				//type : 요청방식 get or post
					data: inputdata1,			//data : 서버로 전송할 데이터 (보내서 처리할 데이터가 여러개면 json형식으로 처리)
					success : success_inputdata1,//success : 서버와 통신이 성공했을 때 호출되는 함수
					error: error_inputdata1		//error : 서버와의 통신이 실패했을 때 호출되는 함수
				})//end ajax
			})//end click
		})//end ready
		
		//ajax 요청이 성공하면 .ajax메서드 내부에서 success속성에 설정한 함수를 호출하면서 
		//ajax의 처리결과를 함수의 매개변수로 전달 - 자동
		function success_inputdata1(txt) {   // 자바의 결과(return)가 txt로 넘어옴.//txt는 임의로 줘도됨
			//alert(txt);
			$("#result").html("<h2>jquery" + txt + "</h2>")
		}
		function error_inputdata1(obj, msg, statusMsg) {
			alert("오류발생 : " + obj +", " + msg +", " + statusMsg) ;
		}
		
		//obj : ajax통신을 하는 XMLHttpRequest객체,
		//msg : 응답메세지
		//statusMsg : 에러메세지
		
		
		/* 
		url : ajax 요청할 path
		type : 요청방식 get or post
		data : 서버로 전송할 데이터 (보내서 처리할 데이터가 여러개면 json형식으로 처리)
		dataType : ajax처리 결과에 대한 타입 (text,json)
		success : 서버와 통신이 성공했을 때 호출되는 함수
		error : 서버와의 통신이 실패했을 때 호출되는 함수
           */
</script>
<title>Insert title here</title>
</head>
<body>
	<h3>Ajax테스트하기</h3>
	<form name="myform">
		<input type="text" name="id" id="id1"/>
		<input type="text" name="name" id="name"/>
		<input type="button" id="noajaxbtn" value="no ajax테스트">
		<input type="button" id="ajaxbtn" value="ajax테스트">
	</form>
	<div id="result">${msg }</div>
	
	<h3>Ajax테스트하기(JQuery...get)</h3>
	<form name="myform">
		<input type="text" name="id" id="id2"/>
		<input type="button" id="ajaxbtn2" value="ajax테스트">
	</form>
	<div id="result2"></div>


	<h3>Ajax테스트하기(JQuery...post)</h3>
	<form name="myform">
		<input type="text" name="id" id="id3"/>
		<input type="button" id="ajaxbtn3" value="ajax테스트">
	</form>
	<div id="result3"></div>
</body>
</html>