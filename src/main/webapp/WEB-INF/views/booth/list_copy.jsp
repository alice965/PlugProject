<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style>
.main {
	width: 100%;
	height: 100%;
	position: relative;
} /*position ???????????*/
.main .work {
	width: 100%;
	height: auto;
	position: relative;
	overflow: hidden;
} /*position work_title을 위해 지정*/
.main .work .work_title {
	width: 100%;
	position: absolute;
	top: 50%;
	margin-top: -40%;
	text-align: center;
} /*position .main .work이 기준* 
/* 마진top으로 글자높낮이를 조정하였고 */
.main .work .media {
	display: block;
	width: 100%;
}

.main .work .caption {
	background: rgba(0, 0, 0, 0.6);
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;		
	opacity: 0;
	transition: all 0.8s;
}
/*position .main .work이 기준*/
.main .work a:hover .caption {
	opacity: 1;
}

.main .work .caption h1 {
	color: #fff;
	font-size: 16px;
	border-top: 1px solid #fff;
	border-bottom: 1px solid #fff;
	padding: 20px;
	width: 100%; /*margin:auto를 사용할 수도 있다. 중간정렬*/
	display: inline-block;
} /*text-align해도 보더가 가운데 정렬이 안되서 인라인으로 바꿈.*/
</style>

<!--  
   <section class="main clearfix">
      <div class="work">
         <a href="#">
            <img src="/images/a.jpg" alt="" class="media">
            <div class="caption">
               <div class="work_title">
                  <h1>Music App Interface</h1>
               </div><!--work_title->
            </div><!--caption->            
         </a>
      </div><!--work1->   

   </section>
 -->

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
<div class="w3-container main">

	<div class="row">
		<!-- 첫번째 부스 -->
		<div class="col-sm-3 panel-body" align="center">
			<div class="work">
				<div class="media-top">
					<a href="#"> <img class="media-object media"
						src="/images/a.jpg">
						<div class="caption">
							<div class="work_title">
								<h1>부스명(db)</h1>
								</br>
								<h2>부스소개(db)</h2>
							</div>
						</div>
					</a>
				</div>
			</div>
			<!-- media tag end -->
		</div>
		<!-- 2번째 부스 -->
		<div class="col-sm-3 panel-body" align="center">
			<div class="work">
				<div class="media-top">
					<a href="#"> <img class="media-object media"
						src="/images/b.jpg">
						<div class="caption">
							<div class="work_title">
								<h1>부스명(db)</h1>
								</br>
								<h2>부스소개(db)</h2>
							</div>
						</div>
					</a>
				</div>
			</div>
			<!-- media tag end -->
		</div>

		<!-- 3번째 부스 -->
		<div class="col-sm-3 panel-body" align="center">
			<div class="work">
				<div class="media-top">
					<a href="#"> <img class="media-object media"
						src="/images/c.jpg">
						<div class="caption">
							<div class="work_title">
								<h1>부스명(db)</h1>
								</br>
								<h2>부스소개(db)</h2>
							</div>
						</div>
					</a>
				</div>
			</div>
			<!-- media tag end -->
		</div>

		<!-- 4번째 부스 -->
		<div class="col-sm-3 panel-body" align="center">
			<div class="work">
				<div class="media-top">
					<a href="#"> <img class="media-object media"
						src="/images/default.png">
						<div class="caption">
							<div class="work_title">
								<h1>부스명(db)</h1>
								</br>
								<h2>부스소개(db)</h2>
							</div>
						</div>
					</a>
				</div>
			</div>
			<!-- media tag end -->
		</div>

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
