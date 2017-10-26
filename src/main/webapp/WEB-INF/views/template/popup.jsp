<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<title><t:getAsString name="title" /></title>
<head>
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<section style="min-height: 70%;" >
	<t:insertAttribute name="section" />
</section>