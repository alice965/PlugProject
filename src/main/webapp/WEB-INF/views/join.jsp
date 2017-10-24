<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
    	<div class="row">
			<div class="col-md-6 col-md-offset-3">
			<h1>JOIN</h1>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
							<c:if test="${!empty temp }">
							<b style="color:red">[회원가입 실패 요인] </b><br/>
							<c:if test="${!empty alertid }"> <!-- 앞서 joincontroller에서 오류가 나면 temp에 값을 넣음. temp가 비어있지 않다면 => join 실패. -->
							<b style="color:red">같은 계정명이 있습니다.</b><br/>
							</c:if>
							<c:if test="${!empty alertnick }">
							<b style="color:red">같은 닉네임이 있습니다.</b><br/>
							</c:if>
							<br/>
							</c:if>
							<form action="/join" method="post" autocomplete="off" id="form">
									<div class="form-group">
										<input type="email" name="id" tabindex="1" class="form-control" placeholder="Email" value="" required id="id"/>
									</div>
									<div class="form-group">
										<input type="text" name="nickname" tabindex="1" class="form-control" placeholder="Nickname" value="" required id="nickname"/>
									</div>
									<div class="form-group">
										<input type="password" name="pass" tabindex="2" class="form-control" placeholder="Password" required id="pass"/>
									</div>
									<div class="form-group"><!-- name쓰면 파라미터로 전달됨. -->
										<input type="password" id="pass_con" tabindex="2" class="form-control" placeholder="Confirm Password" />
									<br/> <span id="pass_rst"></span>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<button type="submit" id="sbt" tabindex="4" class="form-control btn btn-register">Register Now</button>
											</div>
										</div>
									</div>
							</form>
						</div>
					</div>
				</div>
			</div>
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