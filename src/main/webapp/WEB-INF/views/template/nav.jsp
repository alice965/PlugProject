<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expended="false">
				<span class="sr-only"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/index">Plug.DJ</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapase-1" >
			<ul class="nav navbar-nav">
				<!-- 비회원메뉴 -->
				<li class="active"><a href="/booth/boothmain">DJ Booth<span	class="sr-only"></span></a></li>
				<c:choose>
					<c:when test="${empty auth }">
						<li><a href="/login">로그인</a></li>
						<li><a href="/join">회원가입</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/myplay/list?page=1">My Booth</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"> 마이페이지<span class="caret"></span>
						</a>
								<ul class="dropdown-menu">
									<li><a href="/my/profile">나의 정보</a></li>
									<li><a href="/my/mybooth">나의 부스</a></li>
									<li><a href="/my/alarm">알리미</a></li>
								</ul>
							</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"> 쪽지함<span class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<li><a href="/memo/receivelist/">받은 쪽지함</a></li>
								<li><a href="/memo/sendlist/">보낸 쪽지함</a></li>
							</ul></li>

						<li><a href="/logout">로그아웃</a></li>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${empty auth.ID }">
						<li>방문객님 환영합니다.</li>
					</c:when>
					<c:otherwise>
						<li>${auth.NICKNAME }님안녕하세요</li>
					</c:otherwise>
				</c:choose>
			</ul>

			<form class="navbar-form navbar-left">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="부스 검색">
				</div>
				<button type="submit" class="btn btn-default">검색</button>
			</form>
			<!-- <ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-haspopup="true" aria-expanded="false">
						접속하기<span class="caret"></span>
					</a>
					 <ul class="dropdown-menu">
						<li><a href="/login">로그인</a></li>
						<li><a href="/join">회원가입</a></li>
						<li>${auth.ID }님 안녕하세요</li>
					</ul>  -->
			</li>
			</ul>
		</div>
	</div>
</nav>
