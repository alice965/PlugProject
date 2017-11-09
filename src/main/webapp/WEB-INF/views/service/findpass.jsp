<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
    <div class="row">
	<div class="col-md-6 col-md-offset-3">
		<c:if test="${!empty checkId }">
			<script>
				alert("해당 아이디가 존재하지 않습니다.");
			</script>
		</c:if>	
	<h3><b>비밀번호 찾기</b></h3><br/>
	<h6>아이디를 입력해주세요. 해당 계정으로 임시 비밀번호가 전송됩니다. </h6>
		<form action="/service/findpass" method="post">
		<div class="form-group" align="center">
		<div class="form-group">
			<input type="email" name="id" tabindex="1" class="form-control" placeholder="Email" value="" 
			autocomplete="off" id="id"/>
		</div>
		<br/>
		<button type="submit" id="submit">전송하기</button>
		</div>	
		</form>
		
		<c:if test="${!empty haveId}"> <!-- 해당 아이디를 가지고 있으면.. 근데 alert뜨지는 않음..-->
			<script>
			alert("임시비밀번호를 보냈습니다.");
			</script>
		</c:if>
	
		<div align="right">
		<a href="/" tabindex="5">메인화면으로 돌아가기</a>
		</div>

	</div>
	</div>
</div>