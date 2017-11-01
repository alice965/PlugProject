<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.main {
	width: 100%;
	min-height: 100%;
	position: relative;
}

.main .work {
	width: 250px;
	height: 250px;
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
			<li class="active"><a data-toggle="tab" href="#blist"
				id="b_list">부스 목록</a></li>
			<li><a data-toggle="tab" href="#bookmark" id="b_mark">관심 부스</a></li>
		</ul>

		<div class="tab-content">
		<!-- 전체 부스 보기 탭 시작 -->
			<div id="blist" class="tab-pane fade in active">
			<!-- 검색 영역 시작 -->
  <div class="panel-group" >
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title"> 
          <a data-toggle="collapse" href="#collapse1">검색 옵션&nbsp;&nbsp;&nbsp;<i class="fa fa-chevron-down" aria-hidden="true"></i> </a>
        </h4>
      </div>
      <div id="collapse1" class="panel-collapse collapse">
      <!-- 검색 조건 영역 시작 -->
        <div class="panel-body">
        	
      </div>
      <!-- 검색 조건 영역 끝 -->
    </div>
  </div>
 </div>
 <!-- --------검색 영역 끝 -->
				총 <b>${cnt }</b> 개의 부스가 등록되어 있습니다.
				<hr>
				<!--부스 -->
				<c:forEach var="obj" items="${list }">
					<div
						style="background-color: black; float: left; width: 256px; padding: 3px; margin: 5px; border-radius: 10px;">
						<div class="row" style="padding: 5px;">
							<div class="col-sm-6">
								<!-- 다른 사람 아이디라면 드롭다운  -->
								<c:choose>
									<c:when test="${auth_id ne obj.ID}">
										<div class="dropdown">
											<div class="dropdown-toggle" data-toggle="dropdown"
												style="color: white">
												${obj.NICKNAME}<span class="caret"></span>
											</div>
											<ul class="dropdown-menu">
												<li><a href="#" class="popFriend">친구추가</a><input
													type="hidden" value="${obj.ID}"></li>
												<li><a href="#" class="popMemo">쪽지보내기</a><input
													type="hidden" value="${obj.ID}"></li>
											</ul>
										</div>
									</c:when>
									<c:otherwise>
										<!-- 내 닉네임에는 드롭다운 없이 출력 -->
										<div style="color: white">${obj.NICKNAME}</div>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="col-sm-4">
								<div class="row">
									<div class="col-sm-4" style="text-align: right">
										<i class="fa fa-users fa-lg" aria-hidden="true"
											style="font-size: 14px; color: white;"></i>
									</div>
									<div class="col-sm-4">
										<div style="color: white">${obj.COUNT}</div>
									</div>
									<div class="col-sm-2"></div>
									<div class="col-sm-2">
										<!-- 북마크 할 별 모양 -->
										<!-- 관심부스인지 확인해서 관심인 경우 클래스 다르게 함 -->
										<c:set var="instbth" value="false" />
										<c:forEach var="inst" items="${interest }">
											<!-- 부스번호와 내 관심부스번호가 같다면 (관심부스라면) -->
											<c:if test="${obj.NUM eq inst.NUM}">
												<c:set var="instbth" value="true" />
												<c:set var="bthno" value="${inst.NO }" />
											</c:if>
										</c:forEach>
										<!-- 관심부스 트루라면 하얀별, 아니라면 테두리 별을 찍는다.-->
										<c:choose>
											<c:when test="${instbth}">
												<i class="fa fa-star fa-lg bookmarked" aria-hidden="true"
													style="font-size: 17px; color: orange;"></i>
												<input type="hidden" value="${bthno}">
											</c:when>
											<c:otherwise>
												<i class="fa fa-star-o fa-lg bookmark" aria-hidden="true"
													style="font-size: 17px; color: orange;"></i>
												<input type="hidden" value="${obj.NUM }">
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</div>
					<a href="/booth/boothpage/${obj.NUM}">
						<div class="work">
							<div class="media-top">
									<div style="border-radius: 3px">
										<img class="media-object media" src="${obj.URL }" style="width:250px; height:250px;">
										<!-- 이미지 보더 radius -->
									</div>
									<div class="caption">
										<div class="work_title">
											<h6 style="color: white">${obj.TITLE}</h6>
											<hr style="padding: 10px;">
											<!-- hr은 스타일 적용이 안되는지??? -->
											<p style="color: white">${obj.CONTENT}</p>
											<p style="color: white">${obj.GENRE}</p> <br>
											<small style="color: white"><fmt:formatDate
													value="${obj.REGDATE}" pattern="yyyy.MM.dd" /></small>
										</div>
										
									</div>
							</div>
							</a>
						</div>
						<!-- /work -->
					</div>
					<!-- /부스 전체 -->
				</c:forEach>
			</div>
			<!------------------ 관심 부스 탭 시작--------------------------------------- -->
			<div id="bookmark" class="tab-pane fade">
				총 <b>${cntint}</b> 개의 관심 부스가 등록되어 있습니다.
				<hr>
				<!--부스 -->
				<c:forEach var="obj" items="${interest}">
					<div
						style="background-color: black; float: left; width: 256px; padding: 3px; margin: 5px; border-radius: 10px;">
						<div class="row" style="padding: 5px;">
							<div class="col-sm-6">
								<!-- 다른 사람 아이디라면 드롭다운  -->
								<c:choose>
									<c:when test="${auth_id ne obj.ID}">
										<div class="dropdown">
											<div class="dropdown-toggle" data-toggle="dropdown"
												style="color: white">
												${obj.NICKNAME}<span class="caret"></span>
											</div>
											<ul class="dropdown-menu">
												<li><a href="#" class="popFriend">친구추가</a><input
													type="hidden" value="${obj.ID}"></li>
												<li><a href="#" class="popMemo">쪽지보내기</a><input
													type="hidden" value="${obj.ID}"></li>
											</ul>
										</div>
									</c:when>
									<c:otherwise>
										<!-- 내 닉네임에는 드롭다운 없이 출력 -->
										<div style="color: white">${obj.NICKNAME}</div>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="col-sm-4">
								<div class="row">
									<div class="col-sm-4" style="text-align: right">
										<i class="fa fa-users fa-lg" aria-hidden="true"
											style="font-size: 14px; color: white;"></i>
									</div>
									<div class="col-sm-4">
										<div style="color: white">${obj.COUNT}</div>
									</div>
									<div class="col-sm-2"></div>
									<div class="col-sm-2">
										<!-- 북마크 할 별 모양 -->
										<!-- 관심부스인지 확인해서 관심인 경우 클래스 다르게 함 -->
										<c:set var="instbth" value="false" />
										<c:forEach var="inst" items="${interest }">
											<!-- 부스번호와 내 관심부스번호가 같다면 (관심부스라면) -->
											<c:if test="${obj.NUM eq inst.NUM}">
												<c:set var="instbth" value="true" />
											</c:if>
										</c:forEach>
										<!-- 관심부스 트루라면 하얀별, 아니라면 테두리 별을 찍는다.-->
										<c:choose>
											<c:when test="${instbth}">
												<i class="fa fa-star fa-lg bookmarked" aria-hidden="true"
													style="font-size: 17px; color: orange;"></i>
												<input type="hidden"  value="${obj.NO}">
											</c:when>
											<c:otherwise>
												<i class="fa fa-star-o fa-lg bookmark" aria-hidden="true"
													style="font-size: 17px; color: orange;"></i>
												<input type="hidden" value="${obj.NUM }">
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</div>
					<a href="/booth/boothpage/${obj.NUM}">
						<div class="work">
							<div class="media-top">
									<div style="border-radius: 3px">
										<img class="media-object media" src="${obj.URL }">
										<!-- 이미지 보더 radius -->
									</div>
									<div class="caption">
										<div class="work_title">
											<h6 style="color: white">${obj.TITLE}</h6>
											<hr style="padding: 10px;">
											<!-- hr은 스타일 적용이 안되는지??? -->
											<p style="color: white">${obj.CONTENT}</p>
											<p style="color: white">${obj.GENRE}</p> <br>
											<small style="color: white"><fmt:formatDate
													value="${obj.REGDATE}" pattern="yyyy.MM.dd" /></small>
										</div>
										
									</div>
							</div>
							</a>
						</div>
						<!-- /work -->
					</div>
					<!-- /부스 전체 -->
				</c:forEach>
			</div>
			<!-- -----------------관심부스 탭 끝--------------------------------------- -->
		</div>
	</div>
</div>

<script>

	//관심부스 마우스 클릭 추가
	$(".bookmark").click(function() {
		var r = confirm("관심부스에 추가하시겠습니까?");
		if (r == true) {
			location.href = '/booth/addInterest?bthnum=' + $(this).next().val();
		} else {
		}
	});
	//관심부스 마우스 클릭 삭제
	$(".bookmarked").click(function() {
		console.log( $(this).next().val());
		var r = confirm("관심부스에서 삭제하시겠습니까?");
		if (r == true) {
			location.href = '/booth/deleteInterest?no=' + $(this).next().val();
			
		} else {
		}
	});
	$(".popFriend").click(function() {
        var url="/friend/check?other="+$(this).next().val();
        window.open(url,"","width=400,height=400,left=200");
	});
	$(".popMemo").click(function() {
	   var url="/memo/send?other="+$(this).next().val();
	   window.open(url,"","width=600,height=600,left=200");
	});
</script>