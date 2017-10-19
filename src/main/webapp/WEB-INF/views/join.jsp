<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
input, button {
	width: 100%;
	padding: 5px;
	font-family: 맑은 고딕;
}
b {
	font-size: 12pt;
}
</style>
<div align="center">
	<div style="width: 380px;" align="left">
		<h3>JOIN</h3>
		<h4>WELCOME</h4>
		<h3 style="margin-top: 50px;">CREATE YOUR ACCOUNT</h3>
		<c:if test="${!empty temp }"> <!-- 앞서 joincontroller에서 오류가 나면 temp에 값을 넣음. temp가 비어있지 않다면 => join 실패. -->
			<b style="color:red">join failed..</b>	
		</c:if>
		<span id="error"></span>
		<form action="/join" method="post" autocomplete="off" id="form">
			<p>
				<b>EMAIL</b><br /> <input type="email" name="id" required id="id"/><br />
				<!-- //자바스크립트나 css에서 쓰기 위해 id필요하고, name은 파라미터 위해 필요  -->
			</p>
			<p>
				<b>NICKNAME</b><br /> <input type="text" name="nickname" required id="nickname"/><br />
			</p>
			<p>
				<b>PASS</b><br /> <input type="password" name="pass" required id="pass"/> <br/>
			</p>
			<p>
				<b>PASS_CONFIRM</b><br /> <input type="password" required id="pass_con"/> <br/>
				<span id="pass_rst"></span>
			<button id="sbt" type="submit">C R E A T E</button>
		</form>
	</div>
</div>
<script>
document.getElementById("pass_con").onblur = function() {
	if (document.getElementById("pass").value == document.getElementById("pass_con").value) {
		document.getElementById("pass_rst").innerHTML = "<b style=\"color:blue\">일치합니다</b>";
		document.getElementById("sbt").disabled = false;
	} else {
		document.getElementById("pass_rst").innerHTML = "<b style=\"color:red\">불일치합니다</b>";
		document.getElementById("sbt").disabled = true;
	}
}
</script>

