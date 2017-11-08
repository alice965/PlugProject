<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
    <div class="row">
	<div class="col-md-6 col-md-offset-3">
	<h2>회원탈퇴</h2><br/>
		<form action="/my/out" method="post">
		<div class="form-group" align="center">
			<h5>고객님의 소중한 피드백 감사드립니다.</h5>
		<p>
			<textarea rows="6" cols="40" name="feedback" placeholder="피드백을 남겨주세요.."></textarea>
		</p>
		<b><small>정말로 탈퇴하시겠습니까?</small></b><br/>
		<br/>
		<input type="submit" id="sbt" value="탈퇴하기">
		<div align="right">
		<a href="/" tabindex="5">메인화면으로 돌아가기</a>
		</div>
		</div>	
		</form>
	</div>
	</div>
</div>