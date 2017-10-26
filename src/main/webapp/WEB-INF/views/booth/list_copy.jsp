<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script> 
$(document).ready(function(){
    $("#flip").mouseleave(function(){
        $("#panel").slideUp("slow");
    });
});
</script>
 
<style> 
#panel, #flip {
    padding: 5px;
    text-align: center;
    background-color: #e5eecc;
    border: solid 1px #c3c3c3;
}

#panel {
    padding: 50px;
}
</style> <!-- 올리는거 -->
<script> <!-- 내리는것 -->
$(document).ready(function(){
    $("#flip").mouseenter(function(){
        $("#panel").slideDown("slow");
    });
});
</script>
 
 
<style> 
#panel, #flip {
    padding: 5px;
    text-align: center;
    background-color: #e5eecc;
    border: solid 1px #c3c3c3;
}

#panel {
    padding: 50px;
    display: none;
}
</style>

<div class="sub-top">
	<h2 class="text-center">DJ Booth</h2>
</div>
<br>
<div>
	<div class="col-xs-7">
		총 <b>${cnt }</b> 개의 부스가 등록되어 있습니다.
	</div>

	<a href="/myplay/add"><button
			class="w3-btn w3-black w3-round-large">플레이리스트 만들기</button></a>
</div>
<br>
<div class="w3-container">

	<div class="row">
		<!-- 첫번째 부스 -->
		<div class="col-sm-3 panel-body" align="center">
			<div class="media">
				<div class="media-top">
					<a href="#"><img class="media-object" src="/images/a.jpg"></a>
				</div>
				<!-- media-left -->
				<!-- 
				<div class="media-body">
					<br>
					<h4 class="media-heading">
						<a href="#">부스 타이틀 타이틀</a>&nbsp;<span class="badge">New</span>
					</h4>
					<p>부스 설명 설명 설명부스 설명 설명 설명부스 설명 설명 설명부스 설명 설명 설명부스 설명 설명 설명부스 설명
						설명 설명</p>
					<small>하우스/힙합, 댄스, 클럽음악</small>
				</div>
				 -->
				 
			</div>
			<!-- media tag end -->
		</div>
		<!-- panel-body tag end 첫번째 부스 -->
		<!-- 첫번째 부스 -->
		<div class="col-sm-3 panel-body" align="center">
			<div class="media">
				<div class="media-top">
					<a href="#"><img id="flip" class="media-object" src="/images/b.jpg"></a>
				</div>
				<!-- media-left -->
				
				<div id="panel" class="media-body">
					<br>
					<h4 class="media-heading">
						<a href="#">부스 타이틀 타이틀</a>&nbsp;<span class="badge">New</span>
					</h4>
					<p>부스 설명 설명 설명부스 설명 설명 설명부스 설명 설명 설명부스 설명 설명 설명부스 설명 설명 설명부스 설명
						설명 설명</p>
					<small>하우스/힙합, 댄스, 클럽음악</small>
					
				</div>
				
				 
			</div>
			<!-- media -->
		</div>
		<!-- panel-body tag end 첫번째 부스 -->
		<!-- 첫번째 부스 -->
		<div class="col-sm-3 panel-body" align="center">
			<div class="media">
				<div class="media-top">
					<a href="#"><img class="media-object" src="/images/c.jpg"></a>
				</div>
				<!-- media-left -->
			<!-- 
				<div class="media-body">
					<br>
					<h4 class="media-heading">
						<a href="#">부스 타이틀 타이틀</a>&nbsp;<span class="badge">New</span>
					</h4>
					<p>부스 설명 설명 설명부스 설명 설명 설명부스 설명 설명 설명부스 설명 설명 설명부스 설명 설명 설명부스 설명
						설명 설명</p>
					<small>하우스/힙합, 댄스, 클럽음악</small>
				</div>
				 -->
			</div>
			<!-- media  -->
		</div>


		<div class="col-sm-3 panel-body" align="center">
			<div class="media">
				<div class="media-top">
					<a href="#"><img class="media-object" src="/images/default.png"></a>
				</div>
				<!-- media-left -->
				<!-- 
					<div class="media-body">
					<br>
				
					<h4 class="media-heading">
						<a href="#">부스 타이틀 타이틀</a>&nbsp;<span class="badge">New</span>
					</h4>
					<p>부스 설명 설명 설명부스 설명 설명 설명부스 설명 설명 설명부스 설명 설명 설명부스 설명 설명 설명부스 설명
						설명 설명</p>
					<small>하우스/힙합, 댄스, 클럽음악</small>
					 -->
				</div>
			</div>
			<!-- media  -->
		</div>

	</div>


	<!-- 페이지 처리 -->
	<div align="center">
		<c:if test="${param.page ne 1 }">
			<a href="/booth/list?page=${param.page -1 }"
				style="text-decoration: none"> <b style="color: #9c9892;">◀</b>
			</a>
		</c:if>
		<c:forEach var="i" begin="1" end="${size }" varStatus="vs">
			<c:choose>
				<c:when test="${i eq param.page }">
					<b style="color: #ff9800;">${i }</b>
				</c:when>
				<c:otherwise>
					<a href="/booth/list?page=${i }" style="text-decoration: none"><b
						style="color: #9c9892;">${i }</b></a>
				</c:otherwise>
			</c:choose>
			<c:if test="${!vs.last }"> | </c:if>
		</c:forEach>
		<c:if test="${param.page ne last }">▶</c:if>
	</div>
</div>
<script>
	var list = function() {
		console.log(document.getElementById("blist").innerHTML);
		var xhr = new XMLHttpRequest();
		xhr.open("get", "/booth/listJSON", true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (this.readyState == 4) {
				var obj = JSON.parse(this.responseText);
				var html = "";
				for (i in obj) {
					html += "<tr class=\"w3-hover-blue\">"
							+ "<td>"
							+ obj[i].num
							+ "</td>"
							+ "<td><a href=\"/booth/view/"+obj[i].num+"\">"
							+ obj[i].title
							+ "</a></td>"
							+

							"<td><div class=\"dropdown\"><div class=\"dropdown-toggle\" data-toggle=\"dropdown\">"
							+ obj[i].nickname
							+ "<span class=\"caret\"></span></div><ul class=\"dropdown-menu\"><li><a href=\"#\" class=\"popFriend\">친구추가</a><input type=\"hidden\" value=\""+obj[i].id+"\"></li><li><a href=\"#\">쪽지보내기</a><input type=\"hidden\" value=\""+obj[i].id+"\"></li></ul></div></td>"
							+ "<td>"
							+ obj[i].regdate
							+ "</td>"
							+ "<td>"
							+ obj[i].count
							+ "</td>"
							+ "<td><button class=\"w3-button w3-black w3-round-xxlarge\" ><span id=\"enter\"><a href=\"/booth/boothpage/"+obj[i].num+"\">"
							+ "입장하기</a></span></button></td>" + "</tr>"
				}
				document.getElementById("blist").innerHTML = html;
			}
			$(".popFriend").click(function() {
				var url = "/friend/check?other=" + $(this).next().val();
				window.open(url, "", "width=400,height=400,left=200");
			});
		}
	}

	window.onload = function() {
		list();
	}
	//list();
</script>
