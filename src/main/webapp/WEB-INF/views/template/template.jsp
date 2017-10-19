<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<html>
<head>
	<title><t:getAsString name="title" /></title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width", initial-scale="1">
	<link rel="stylesheet" href="/css/bootstrap.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="/css/plugdj.css">

</head>

<body>
	<style type="text/css">
		.jumbotron {
			background-image: url('/images/background.jpg');
			background-size: cover;
			text-shadow: black 0.2em 0.2em 0.2em;
			color:white;
		}
		.sub-top {
			background-image: url('/images/Playlist.jpg');
			
			padding:10px;
			background-size: cover;
			color:white;
		}
	
	</style>
	<div class="container">
		<nav>
			<t:insertAttribute name="nav" />
		</nav>
		<header>
			<t:insertAttribute name="header" />
		</header>
		<section style="min-height: 70%;" >
			<t:insertAttribute name="section" />
		</section>
		<footer>
			<t:insertAttribute name="footer" />
		</footer>
	</div> <!-- container end -->

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/js/bootstrap.js"></script>
	
</body>
</html>


