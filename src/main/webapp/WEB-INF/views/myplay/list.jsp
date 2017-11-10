<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="sub-top">
	<h2 class="text-center">My Booth</h2>
</div>
<div class="container">
<br>
<div>
	<a href="/myplay/add"><button class="w3-btn w3-black w3-round-large">부스 만들기</button></a>
</div>
<br>
<div class="w3-container">
<div class="row">
	<div class="col-xs-7">
		총 <b>${cnt }</b> 개의 부스가 등록되어 있습니다.
	</div>
	<!-- -----------검색 가림
	<div class="col-xs-3">
		<input class="form-control" type="text" size="20" id="search">
	</div>
	  <div class="col-xs-2">
		<button class="btn btn-primary" type="button">검색</button>
	</div> -->

</div>
<br>
  <table class="w3-table-all" style="width: 95%" id="list">
		<thead>
			<tr class="w3-Black">
				<th style="width: 10%">번호</th>
				<th style="width: 50%">방 제목</th>
				<th style="width: 20%">생성일</th>
				<th style="width: 20%">참여자수</th>
				<th style="width: 20%">입장하기</th>
			</tr>
		</thead >
		<tbody id="blist" >
		<c:forEach var="obj" items="${list}">
			<tr>
				<td>${obj.NUM}</td>
				<td><a href="/myplay/view/+${obj.NUM}">${obj.TITLE}</a></td>
				<td><fmt:formatDate
						 value="${obj.REGDATE}" pattern="yyyy.MM.dd" /></td>
				<td>${obj.COUNT}</td>
				<td><button class="w3-button w3-black w3-round-xxlarge" >
					<a href="/booth/boothpage/${obj.NUM}"><span class="enter">입장하기</span></a></button></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
</div>
<br>
<script>

	var list = function(){
		console.log(document.getElementById("blist").innerHTML);
		var xhr = new XMLHttpRequest();
		xhr.open("get", "/myplay/listJSON", true);
		xhr.send();
		xhr.onreadystatechange = function(){
			if(this.readyState==4){
				var obj = JSON.parse(this.responseText);
				var html = "";
				for(i in obj) {
					html+="<tr class=\"w3-hover-blue\">"+				
				      "<td>"+obj[i].num+"</td>"+
				      "<td><a href=\"/myplay/view/"+obj[i].num+"\">"+obj[i].title+"</a></td>"+
				      //"<td>"+obj[i].title+"</td>"+
				      "<td>"+obj[i].regdate+"</td>"+
				      "<td>"+obj[i].count+"</td>"+
				      "<td><button class=\"w3-button w3-black w3-round-xxlarge\" ><a href=""><span class=\"enter\">입장하기</span></a></button></td>"+
				      "</tr>"
				}
				document.getElementById("blist").innerHTML = html;
				
				$(".enter").click(function() {
				});
			}
		}
	}
	
	
	
window.onload=function(){
	list();
}
//list();
</script>
