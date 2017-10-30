<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.main {
	width: 100%;
	min-height: 100%;
	position: relative;
} 
.main .work {
	width: 300px;
	height: auto;
	position: relative;
	overflow: hidden;
} 
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

<div class="main ">
<div class="container">
  <ul class="nav nav-tabs nav-justified">
    <li class="active"><a data-toggle="tab" href="#blist" id="b_list">부스 목록</a></li>
    <li><a data-toggle="tab"   href="#bookmark"  id="b_mark">관심 부스</a></li>
  </ul>

  <div class="tab-content">
    <div id="blist" class="tab-pane fade in active">
총 <b>${cnt }</b> 개의 부스가 등록되어 있습니다.<hr>
		<!--부스 -->
	<c:forEach var="obj" items="${list }">	
		<div style="background-color: black; float:left; width:306px; padding:3px; margin:5px; border-radius: 10px; ">
			<div class="row" style="padding:5px;">
				<div class="col-sm-6">
					  <!-- 다른 사람 아이디라면 드롭다운  -->
                  <c:choose>
	                     <c:when test="${auth_id ne obj.ID}">
	                        <div class="dropdown">
	                           <div class="dropdown-toggle" data-toggle="dropdown" style="color:white">
	                              ${obj.NICKNAME}<span class="caret"></span>
	                          </div>
	                          <ul class="dropdown-menu">
	                             <li><a href="#" class="popFriend">친구추가</a><input type="hidden" value="${obj.ID}"></li>
	                             <li><a href="#" class="popMemo">쪽지보내기</a><input type="hidden" value="${obj.ID}"></li>
	                          </ul>
	                       </div>
	                     </c:when>
                     <c:otherwise>
	                        <!-- 내 닉네임에는 드롭다운 없이 출력 -->   
	                        <div style="color:white">
		                        ${obj.NICKNAME} 
	                        </div>
                     </c:otherwise>
                    </c:choose>
				</div>
				<div class="col-sm-4">
					<div class="row">
						<div class="col-sm-3" style="text-align:right">
							<i class="fa fa-users fa-lg" aria-hidden="true" style="font-size:14px; color:white;"></i> 
						</div>
						<div class ="col-sm-2">
							<div style="color:white">${obj.COUNT}</div>
						</div>
						<div class="col-sm-2">
						<!-- 북마크 할 별 모양 -->
						<!-- 관심부스인지 번호를 확인해서 관심인 경우 클래스 다르게 함 -->
						<c:forEach var="ist" items="${interest }">	
							 <c:choose>
								<c:when test="${obj.NUM ne ist.NUM}">
										<i class="fa fa-star-o fa-lg bookmark" aria-hidden="true" style="font-size:17px; color:white;"></i>
										<input type="hidden"	value="${obj.ID }"> 
										<input type="hidden"	value="${obj.NUM }">
								</c:when>
								<c:otherwise>
								<!-- ---------------내 관심부스인경우 코드 추가!! -->
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						</div>
					
					</div>
				</div>
			</div>
			<div class="work">
				<div class="media-top">
					<a href="#"> 
					<div style="border-radius: 3px">
						<img class="media-object media" 	src="${obj.URL }" > <!-- 이미지 보더 radius -->
					</div>
						<div class="caption">
							<div class="work_title">
								<h6 style="color:white">${obj.TITLE}</h6>
								<hr style="padding:10px;"> <!-- hr은 스타일 적용이 안되는지??? -->
								<p style="color:white">${obj.CONTENT}</p>
								<p style="color:white">${obj.GENRE}</p>
								<small style="color:white"><fmt:formatDate value="${obj.REGDATE}" pattern="yyyy.MM.dd" /></small>
							</div>
						</div>
					</a>
				</div>
			</div> <!-- /work -->
		</div> <!-- /부스 전체 -->
		</c:forEach>
  </div>  
    <div id="bookmark"" class="tab-pane fade">
    	 bookmark
    </div>
   </div>
</div>
</div>

<script>
//관심부스 마우스 오버
$(".bookmark").click(function(){
	var r = confirm("관심부스에 추가하시겠습니까?");
	if (r == true) {
		location.href = '/booth/addInterest?id='
				+ $(this).next().val()+ '&num='
				+$(this).next().next().val()
		$(this).toggleClass("fa-star");
		$(this).toggleClass("fa-star-o");
	} else {
		window.close();
	}
});

</script>