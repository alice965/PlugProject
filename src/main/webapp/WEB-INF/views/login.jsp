<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
input, button {
	width: 55%;
	padding: 5px;
	font-family: 맑은 고딕;
}
b {
	font-size: 12pt;
}
</style>
<div align="center">
	
		<h3>WELCOME</h3>
		<p>
		<small>만나서 반갑습니다. <br/>저희 사이트를 이용하시려면 로그인이 필요합니다.</small>
		</p>
			<h3>LOGIN TO HUB</h3>
			<c:if test="${!empty temp }">
				<b style="color: red">login failed..</b>
			</c:if>
			<div class="container">
			<form action="/login" method="post" autocomplete="off">
				<c:if test="${ !empty param.redirect }">
					<input type="hidden" name="redirect" value="${param.redirect }" />
				</c:if>
				<b>ID</b><br/> <input type="text" name="id" required id="id"/><br/>
				<b>PASS</b><br/> <input type="password" name="pass" required id="pass"/><br/>
				<button id="sbt" type="submit" style="">L O G I N</button>
			<div style="width: 340px; margin-top: 20px;" align="center">
			New to HUB? <a href="/join">Create an account.</a>
			</div>
			</form>
			</div>
		
	</div>

