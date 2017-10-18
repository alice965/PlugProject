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
		<c:if test="${!empty temp }">
			<b style="color:red">join failed..</b>	
		</c:if>
		
		<form action="/join" method="post" autocomplete="off" id="form">
			<p>
				<b>EMAIL</b><br /> <input type="email" id="id" required/><br />
			</p>
			<p>
				<b>NICKNAME</b><br /> <input type="text" name="nickname" required /><br />
			</p>
			<p>
				<b>PASS</b><br /> <input type="password" name="pass" required />
			</p>

<!--  
			<p>
				<button id="auth" type="button">C O N F I R M</button>
			</p>
			<p id="auth_view" style="display:none;">
				<b>AUTHORIZED KEY</b><small id="left"
					style="color: red; font-weight: bold"></small><br/>
				<input id="key" type="text" name="key" required/>
			</p>
-->
			<button id="sbt" type="submit">C R E A T E</button>
		</form>
	</div>
</div>
<!--  create눌렀을 때
id, password 입력 안돼있으면 어떻게 하는지..? -->

