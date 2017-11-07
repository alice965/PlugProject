<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
    <div class="row">
	<div class="col-md-6 col-md-offset-3">
	<h2>인증번호 입력</h2><br/>
		<form action="/service/keynum" method="post">
		<div class="form-group" align="center">
			<h5>인증번호를 입력해주세요. </h5>
		<div class="form-group">
			<input type="text" name="uuid" tabindex="1" class="form-control" placeholder="인증번호" 
			value="" autocomplete="off" id="id"/>
		</div>
		<br/>
		<button type="submit" id="submit">인증번호 입력</button>
		<div align="right">
		<a href="/" tabindex="5">메뉴화면으로 돌아가기</a>
		</div>
		</div>	
		</form>
	</div>
	</div>
</div>