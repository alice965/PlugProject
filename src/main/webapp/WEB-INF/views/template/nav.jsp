<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" 
				data-target="#bs-example-navbar-collapse-1" aria-expended="false">  
				<span class="sr-only"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/index">Plug.DJ</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapase-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">전체 플레이 리스트<span class="sr-only"></span></a></li>
				<li><a href="myplay/list">나의 플레이 리스트</a></li>
				<li><a href="#">나의 프로필</a></li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-haspopup="true" aria-expanded="false">
						쪽지함<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="#">받은 쪽지함</a></li>
						<li><a href="#">보낸 쪽지함</a></li>
					</ul>
				</li>
			</ul>
			<form class="navbar-form navbar-left">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="음악검색">
				</div>
				<button type="submit" class="btn btn-default">검색</button>
			</form>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-haspopup="true" aria-expanded="false">
						접속하기<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="#">로그인</a></li>
						<li><a href="#">회원가입</a></li>
					</ul>
					
					
				</li>
			
			</ul>
		</div>
	</div>
</nav>

