<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title><t:getAsString name="title" /></title>
<!-- JQUERY -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="/js/default.js" type="text/javascript" ></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- BootStrap (CDN방식)-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="/css/bootstrap.css">
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 <link rel="shortcut icon" href="//d2d3qesrx8xj6s.cloudfront.net/favicon.ico" type="image/x-icon">
 <link rel="icon" href="//d2d3qesrx8xj6s.cloudfront.net/favicon.ico" type="image/x-icon">
 <link rel="apple-touch-icon-precomposed" href="//d2d3qesrx8xj6s.cloudfront.net/apple-touch-icon-precomposed.png">
 <link rel="apple-touch-icon-precomposed" href="//d2d3qesrx8xj6s.cloudfront.net/apple-touch-icon-72x72-precomposed.png">
 <link rel="apple-touch-icon-precomposed" href="//d2d3qesrx8xj6s.cloudfront.net/apple-touch-icon-114x114-precomposed.png">
 <link rel="apple-touch-icon-precomposed" href="//d2d3qesrx8xj6s.cloudfront.net/apple-touch-icon-144x144-precomposed.png">
<link rel="alternate" type="application/rss+xml" title="Latest snippets from Bootsnipp.com" href="https://bootsnipp.com/feed.rss" />

<script src="https://apis.google.com/js/api.js"></script>


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
		.page-top {
			background-color: gray;
			padding:10px;
			background-size: cover;
			color:white;
		}
		.bg{
			background-image: url('/images/bg.jpg');
			background-size: cover;
		}

</style>
	
	
	<header>
		<t:insertAttribute name="header" />
	</header>
	<div>
	<nav>
		<t:insertAttribute name="nav" />
	</nav>
		<section style="min-height: 70%;" >
			<t:insertAttribute name="section" />
		</section>
	
	</div>
	<footer style="background-color:#000000; color:#ffffff">
		<t:insertAttribute name="footer" />
	</footer>
</body>
</html>


