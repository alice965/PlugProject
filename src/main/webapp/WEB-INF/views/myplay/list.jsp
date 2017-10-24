<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="sub-top">
	<h2 class="text-center">나의 플레이 리스트</h2>
</div>
<br>
<div>
	<a href="/myplay/add"><button class="w3-btn w3-black w3-round-large">플레이리스트 만들기</button></a>
</div>
<br>
<div class="w3-container">
<div class="row">
	<div class="col-xs-7">
		총 <b>${cnt }</b> 개의 부스가 등록되어 있습니다.
	</div>
	<div class="col-xs-3">
		<input class="form-control" type="text" size="20" id="search">
	</div>
	<div class="col-xs-2">
		<button class="btn btn-primary" type="button">검색</button>
	</div>

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
			
		</tbody>
	</table>
	
	<!-- 페이지 처리 -->
	<div align="center">
		<c:if test="${param.page ne 1 }">
			<a href="/myplay/list?page=${param.page -1 }" style="text-decoration: none">
			<b style="color: #9c9892;">◀</b>
			</a>	
		</c:if>
		<c:forEach var="i" begin="1" end="${size }" varStatus="vs">
			<c:choose>
				<c:when test="${i eq param.page }">
					<b style="color: #ff9800;">${i }</b>
				</c:when>
				<c:otherwise>
					<a href="/myplay/list?page=${i }" style="text-decoration: none"
						><b style="color: #9c9892;">${i }</b></a>	
				</c:otherwise>
			</c:choose>
			<c:if test="${!vs.last }"> | </c:if>
		</c:forEach>
		<c:if test="${param.page ne last }">▶</c:if>
	</div>
</div>
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
				      "<td><button class=\"w3-button w3-black w3-round-xxlarge\" ><span class=\"enter\">입장하기</span></button></td>"+
				      "</tr>"
				}
				document.getElementById("blist").innerHTML = html;
				
				$(".enter").click(function() {
					console.log("눌렀어?");
				});
			}
		}
	}
	
	
	
window.onload=function(){
	list();
}
//list();
</script>
