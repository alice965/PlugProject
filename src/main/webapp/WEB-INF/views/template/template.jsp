<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title><t:getAsString name="title" /></title>
<link href="/css/default.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css">

 <link rel="shortcut icon" href="//d2d3qesrx8xj6s.cloudfront.net/favicon.ico" type="image/x-icon">
    <link rel="icon" href="//d2d3qesrx8xj6s.cloudfront.net/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon-precomposed" href="//d2d3qesrx8xj6s.cloudfront.net/apple-touch-icon-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="//d2d3qesrx8xj6s.cloudfront.net/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="//d2d3qesrx8xj6s.cloudfront.net/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="//d2d3qesrx8xj6s.cloudfront.net/apple-touch-icon-144x144-precomposed.png">
    <link rel="alternate" type="application/rss+xml" title="Latest snippets from Bootsnipp.com" href="https://bootsnipp.com/feed.rss" />

<script src="/js/default.js" type="text/javascript" >
</script>
</head>

<body>
	
	<header>
		<t:insertAttribute name="header" />
	</header>
	<nav>
		<t:insertAttribute name="nav" />
	</nav>
	<section style="min-height: 70%;" >
		<t:insertAttribute name="section" />
	</section>
	<footer>
		<t:insertAttribute name="footer" />
	</footer>
</body>
</html>


