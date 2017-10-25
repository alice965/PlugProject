<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- //자바스크립트나 css에서 쓰기 위해 id필요하고, name은 파라미터 위해 필요  -->
<div class="container">
    	<div class="row">
			<div class="col-md-6 col-md-offset-3">
			<h1>LOGIN</h1>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
							<form id="login-form" action="/login" 
							method="post" role="form" style="display: block;"autocomplete="off">
							<c:if test="${!empty temp }">
							<b style="color: red">login failed..</b>
							</c:if>
									<div class="form-group">
										<input type="email" name="id" tabindex="1" class="form-control" placeholder="Email" value="" required id="id"/>
									</div>
									<div class="form-group">
										<input type="password" name="pass" tabindex="2" class="form-control" placeholder="Password" required id="pass"/>
									</div>
									<div class="form-group text-center">
										<input type="checkbox" tabindex="3" class="" name="keep" id="keep">
										<label for="remember"> Remember Me</label>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="LOGIN">
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
													<a href="#" tabindex="5">Forgot Password?</a><br/>
													<a href="/join">create new account</a></p>
												</div>
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


<!--  
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
				<p>
					<input type="checkbox" name="keep" value="true" id="keep"/>로그인 유지
				</p>
				<button id="sbt" type="submit" style="">L O G I N</button>
			<div style="width: 340px; margin-top: 20px;" align="center">
			New to HUB? <a href="/join">Create an account.</a>
			</div>
			</form>
			</div>
		
	</div>
-->