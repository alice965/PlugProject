<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="col-xs-2">

	</div>
	<div class="col-xs-4">
		
				<div class="well">
				<h4>
				<i class="fa fa-exclamation-circle" aria-hidden="true" style="color: #292F33"><b> 주의사항</b></i>
				<br/>
				</h4>
				<i class="fa fa-commenting-o" aria-hidden="true" style="color: #292F33"><b> 계정명</b></i> <br/>
				-비밀번호를 찾을 때 해당아이디로  이메일이 보내지므로, 존재하는 계정을 입력해주세요. <br/>
				<br/>
				<i class="fa fa-commenting-o" aria-hidden="true" style="color: #292F33"><b> 닉네임</b></i>   <br/>
				-닉네임에 공백 또는 특수문자를<br/>  넣을 수 없습니다. <br/>
				-닉네임은 변경이 불가능합니다. <br/>
				<br/>	
				<i class="fa fa-commenting-o" aria-hidden="true" style="color: #292F33"><b> 비밀번호</b></i>  <br/>
				-숫자, 문자, 특수문자를 조합하여<br/> 8자 ~ 20자 이내로 조합해주세요. <br/>
				-공백을 넣을 수 없습니다. 
				</div>
	</div>
	<div class="col-xs-6">
	<h1><b>JOIN</b></h1>
				<div class="panel-body" style="height: 200px">
				<div class="row">
						<c:if test="${!empty temp }">
							<b style="color: red">[회원가입 실패 요인] </b>
							<br />
							<c:if test="${!empty alertid }">
								<!-- 앞서 joincontroller에서 오류가 나면 temp에 값을 넣음. temp가 비어있지 않다면 => join 실패. -->
								<b style="color: red">같은 계정명이 있습니다.</b>
								<br />
							</c:if>
							<c:if test="${!empty alertnick }">
								<b style="color: red">같은 닉네임이 있습니다.</b>
								<br />
							</c:if>
							<br />
						</c:if>
						<form action="/join" method="post" autocomplete="off" id="form">
							<div class="form-group">
								<input type="email" name="id" tabindex="1" class="form-control"
									placeholder="Email" value="" required id="id" />
							</div>
							<div class="form-group">
								<input type="text" name="nickname" tabindex="1"
									class="form-control" placeholder="Nickname" value="" required
									id="nickname" />
							</div>
							<div class="form-group">
								<input type="password" name="pass" tabindex="2"
									class="form-control" placeholder="Password" required id="pass" />
							</div>
							<div class="form-group">
								<!-- name쓰면 파라미터로 전달됨. -->
								<input type="password" id="pass_con" tabindex="2"
									class="form-control" placeholder="Confirm Password" required />
								<br/><span id="pass_rst"></span>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-sm-6 col-sm-offset-3">
										<button type="submit" name="sbt" id="sbt" tabindex="4"
											class="form-control btn btn-register">Register Now</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
	</div>
</div>