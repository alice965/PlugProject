<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- bootstrap사용하므로 이제는 <style></style>사용하지 않아도 됨. 
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
-->
<div class="row"> <!-- row로 클래스를 잡으면 12개의 영역을 사용할 수 있음. 
						col-md-n => n값의 합이 12가 되도록. : 세로 구역으로 나눌 수 있음.-->
	<div class="col-md-6">
		<h3>WELCOME</h3>
		<p>
		<small>만나서 반갑습니다. <br/>저희 사이트를 이용하시려면 로그인이 필요합니다.</small>
		</p>
		<div>
		<img id="pre" src="/profiles/heart.jpg" alt="하트"
						style="width: 40%; height: 40%; border-radius: 10%;" />
		</div>
	</div>
	<div class="col-md-6">
		<div style="width: 340px;" align="left">
			<h3>LOGIN TO HUB</h3>
			<c:if test="${!empty temp }">
				<b style="color: red">login failed..</b>
			</c:if>
			<div class="container">
			<form action="/login" method="post" autocomplete="off">
				<c:if test="${ !empty param.redirect }">
					<input type="hidden" name="redirect" value="${param.redirect }" />
				</c:if>
				<div class="input-group">
					<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
					<input type="text" name="idmail" class="form-control" required id="idmail" style="width:250px"/><br /> <span id="chk_rst"></span>
				</div>
				<div class="input-group">
					<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
					<input type="password" name="pass" class="form-control" style="width:250px" required />
				</div>
				<button id="sbt" type="submit" style="">L O G I N</button>
			<div style="width: 340px; margin-top: 20px;" align="center">
			New to HUB? <a href="/join">Create an account.</a>
			</div>
			</form>
			</div>
		</div>
	</div>
</div>
