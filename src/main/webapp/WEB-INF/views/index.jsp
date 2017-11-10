<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.main {
	width: 100%;
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

.optxt{
	font-size:  14px;
}
.optxt  td{
	font-weight: bold;
}
.lbtxt{
	font-weight: 100;
}
</style>
<div class="container">
	<!-- 페이지 상단 이미지 영역 -->
	<div class="jumbotron">
		<h2 class="text-center"><b>Welcome to Play.DJ</b></h2>
		<h4 class="text-center">Play.DJ에서 전세계 음악팬들과 플레이 리스트를 공유해보세요!</h4>
		<br>
		<p class="text-center">
			<a type="button"
			style="font-size: 15px; color: #292F33; background-color: #FFFFFF; width: 200px"
			class="btn btn-md" href="/myplay/add" role="button">나만의 DJ부스
				만들기</a>
		</p>
	</div>
	<!-- 점보트론 종료 -->


	<!-- 소개 영역[모달 활용] -->
	<div class="row">
		<!-- 소개1 -->
		<div class="col-md-4">
			<h4><b>서비스 소개</b></h4>
			<p>Play.DJ는 나만의 부스를 만들어 플레이 리스트를 공유할 수 있는 음악 서비스입니다.</p>
			<p>
				<a class="btn btn-default" data-target="#modal-1"
					data-toggle="modal">자세히 알아보기</a>
			</p>
		</div>
		<!-- 소개2 -->
		<div class="col-md-4">
			<h4><b>문의하기</b></h4>
			<p>불편하신 점이 있다면 피드백을 남겨주세요.<br/> 서비스 구현에 많은 도움이 됩니다.</p>
			<p>
				<a class="btn btn-default" data-target="#modal-2"
					data-toggle="modal">자세히 알아보기</a>
			</p>
		</div>
		<!-- 소개3 -->
		<div class="col-md-4">
			<h4><b>관리자 CONTACT</b></h4>
			<p>개발자 정보입니다.</p><br/>
			<p>
				<a class="btn btn-default" data-target="#modal-3"
					data-toggle="modal">자세히 알아보기</a>
			</p>
		</div>

	</div>
	<!-- row tag end -->

	<hr>

	<!-- 미디어 영역 -->
  	<div class="panel panel-primary" style="background-color:#484848; color:#CCD6DD; border-color:#484848;">
    	<div class="panel-body"><span class="glyphicon glyphicon-headphones"></span><b> &nbsp; &nbsp;최신
				부스 목록</b></div>
  	</div>

	<!-- 최신부스 -->
	<div class="main">
	<c:forEach var="obj" items="${list}">
					<div
						style="background-color: black; float: left; width: 256px; padding: 3px; margin: 5px; border-radius: 10px;">
						<div class="row" style="padding: 5px;">
							<div class="col-sm-6" style="color:white">
										<div style="color: white">${obj.NICKNAME}</div>
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
							</div>
						</a>
						<!-- /work -->
					</div>
					<!-- /부스 전체 -->
			</c:forEach>
	<!-- 최신부스 끝 -->
	</div>	


	<!-- modal -->
	<div class="modal fade" id="modal-1" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"><b>Play.DJ의 특징</b></h4>
				</div>
				<div class="modal-body">
					저희 서비스의 특징은 유투브의 음악을 선택하여 디제잉해 볼 수 있다는 점입니다. <br> DJ가 되어 부스를
					만들어 보세요. 전세계 음악팬들과 함께 음악을 공유할 수 있습니다. <br>
					<br> <p align="center">  <img src="/images/a.jpg" id="imagepreview"
						style="width: 256px; height: 256px;"> </p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	<!-- 모달 종료 -->
	<div class="modal fade" id="modal-2" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content" >
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"><b>문의하기</b></h4>
				</div>
				<div class="modal-body">
					불편하신 점이 있다면 아래 이메일로 피드백을 보내주세요 <br/> csrom0128@gmail.com<br/>
					저희 사이트 이용에 항상 감사드립니다.^^<br/>
					<br> <p align="center"> <img src="/images/c.jpg" id="imagepreview"
						style="width: 256px; height: 256px;"> </p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	<!-- 모달 종료 -->
	<div class="modal fade" id="modal-3" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content" >
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"><b>관리자 CONTACT</b></h4>
				</div>
				<div class="modal-body">
					곽효진 : alice965@naver.com <br/> 조새롬 : finolove@naver.com <br/>
					저희 사이트 이용에 항상 감사드립니다.^^<br/>
					<br> <p align="center"> <img src="/images/b.jpg" id="imagepreview"
						style="width: 256px; height: 256px;"> </p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	
</div>
<!-- 컨테이너 종료 -->
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

