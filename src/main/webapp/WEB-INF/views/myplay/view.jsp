<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="sub-top">
	<h2 class="text-center">My Booth</h2>
</div>
<div class="container">
<div style="width: 100%; border-radius: 10px; background-color: #e6dfdf;  padding: 20px;"
	align="center">
	<input type="hidden" id="num" value="${one.NUM }" />
	<h3>${one.TITLE }</h3>
	<p style="padding-left: 10px;">
			생성일 : <fmt:formatDate pattern="yyyy.MM.dd" value="${one.REGDATE }" /> 
			 참여자 수:<fmt:formatNumber value="${one.COUNT }" pattern="#,###" />			
	</p>
	<div align="left">
			설명  <pre style="font-family: 맑은 고딕; font-size: 12pt; ">${one.CONTENT }</pre>
	</div>
	<div align="left">
			장르  <pre style="font-family: 맑은 고딕; font-size: 12pt; ">${one.GENRE }</pre>
	</div><br>
	
	<!-- 부스 대표 이미지-->
	<div align="left">
	<b>부스 이미지</b><br>
	<img id="pre" src="${one.URL}" alt="기본이미지" style="width: 300px; height: 300px; border-radius: 10%; margin-bottom: 10px;" /> 
	</div>
	<br>
	<button type="button" id="edit">수정</button>
	<button type="button" id="delete">삭제</button>
	<button type="button" id="list">목록</button>
</div>
</div>
<script>
	document.getElementById("edit").onclick=function(){
		location.href='/myplay/edit/${one.NUM}';
	}
	document.getElementById("delete").onclick=function(){
		var r = confirm("정말 삭제하시겠습니까?");
		if(r==true){
			location.href='/myplay/delete/${one.NUM}'
			
		}else{
			location.href='/myplay/view/${one.NUM}';
		}
	}
	document.getElementById("list").onclick=function(){
		location.href='/myplay/list'
	}
</script>	
