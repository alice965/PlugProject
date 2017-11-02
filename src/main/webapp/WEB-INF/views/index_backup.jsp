<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {box-sizing:border-box}
body {font-family: Verdana,sans-serif;margin:0}
.mySlides {display:none}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 3.5s;
  animation-name: fade;
  animation-duration: 3.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}
</style>

<div class="container">
	<!-- 페이지 상단 이미지 영역 -->
	<div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 3</div>
  <img src="/images/main/main1.jpg" style="width:100%">
  <div class="text">
  	<h2 class="text-center">Welcome to Plug.DJ</h2>
  	<br>　
  	<br>
	<p class="text-center">Plug.DJ에서 전세계 음악팬들과 플레이 리스트를 공유해보세요!</p>
	<br>　
  	<br>　
  	<br>　
  	　
  	
		<br>

  
  </div>
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 3</div>
  <img src="/images/main/main2.jpg" style="width:100%">
  <div class="text">
 	<h2 class="text-center">자신의 음악을 뽐내보자!</h2>
		<p class="text-center">직접 부스를 만들어서 음악을 공유하고 자신의 음악을 들려주세요!</p>
		<br>
		<p class="text-center">
		<br>　
		<br>　
		<br>　
		<br>　
		
			<a class="btn btn-primary btn-lg" href="/myplay/add" role="button"> 나만의 부스 만들러가기</a>
		</p>
  
  </div>
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 3</div>
  <img src="/images/main/main3.jpg" style="width:100%">
  <div class="text">
   <h4>서비스 소개</h4>
			<p>Plug.DJ는 나만의 부스를 만들어 플레이 리스트를 공유할 수 있는 음악 서비스입니다.<br>
			상세설명이 궁금하시면 아래 자세히 알아보기를 눌러주세요!
			<br>　
			<br>　
			<br>　
			<br>　
			</p>
			<p>
				<a class="btn btn-default" data-target="#modal-1"
					data-toggle="modal">자세히 알아보기</a>
					
			</p>
  
  
  </div>
</div>
<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
<a class="next" onclick="plusSlides(1)">&#10095;</a>


</div>
<br>

<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
</div>
	<!-- 점보트론 종료 -->


	<!-- 소개 영역[모달 활용] -->
	<!-- 
	<div class="row">
		
		<div class="col-md-4">
			<h4>서비스 소개</h4>
			<p>Plug.DJ는 나만의 부스를 만들어 플레이 리스트를 공유할 수 있는 음악 서비스입니다.</p>
			<p>
				<a class="btn btn-default" data-target="#modal-1"
					data-toggle="modal">자세히 알아보기</a>
			</p>
		</div>
		
		<div class="col-md-4">
			<h4>서비스 소개</h4>

			<p>Plug.DJ는 나만의 부스를 만들어 플레이 리스트를 공유할 수 있는 음악 서비스입니다.</p>
			<p>
				<a class="btn btn-default" href="#">자세히 알아보기</a>
			</p>
		</div>
		
		<div class="col-md-4">
			<h4>서비스 소개</h4>
			<p>Plug.DJ는 나만의 부스를 만들어 플레이 리스트를 공유할 수 있는 음악 서비스입니다.</p>
			<p>
				<a class="btn btn-default" href="#">자세히 알아보기</a>
			</p>
		</div>

	</div>
	 -->
	<!-- row tag end -->

	<hr>

	<!-- 미디어 영역 -->
	<div class="panel panel-primary">

		<div class="panel-heading">
			<h3 class="panel-title">
				<span class="glyphicon glyphicon-headphones"></span> &nbsp; &nbsp;최신
				부스 목록
			</h3>
		</div>
		<!-- panel-heading -->

		<div class="row">
			<!-- 첫번째 부스 -->
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
			<!-- panel-body tag end 첫번째 부스 -->
			<!-- 첫번째 부스 -->
			<div class="col-sm-4 panel-body" align="center">
				<div class="media">
					<div class="media-top">
						<a href="#"><img class="media-object" src="images/b.jpg"></a>
					</div>
					<!-- media-left -->
					<div class="media-body">
						<br>
						<h4 class="media-heading">
							<a href="#">부스 타이틀 타이틀</a>&nbsp;<span class="badge">New</span>
						</h4>
						<p>부스 설명 설명 설명부스 설명 설명 설명부스 설명 설명 설명부스 설명 설명 설 명부스 설명 설명 설명부스
							설명 설명 설명</p>
						<small>하우스/힙합, 댄스, 클럽음악</small>
					</div>
				</div>
				<!-- media -->
			</div>
			<!-- panel-body tag end 첫번째 부스 -->
			<!-- 첫번째 부스 -->
			<div class="col-sm-4 panel-body" align="center">
				<div class="media">
					<div class="media-top">
						<a href="#"><img class="media-object" src="images/c.jpg"></a>
					</div>
					<!-- media-left -->
					<div class="media-body">
						<br>
						<h4 class="media-heading">
							<a href="#">부스 타이틀 타이틀</a>&nbsp;<span class="badge">New</span>
						</h4>
						<p>부스 설명 설명 설명부스 설명 설명 설명부스 설명 설명 설명부스 설명 설명 설 명부스 설명 설명 설명부스
							설명 설명 설명</p>
						<small>하우스/힙합, 댄스, 클럽음악</small>
					</div>
				</div>
				<!-- media  -->
			</div>
			<!-- panel-body 첫번째 부스 -->
		</div>
		<!--  row -->
	</div>
	<!--  panel panel-primary  -->


	<!-- modal -->
	<div class="modal fade" id="modal-1" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Plug.DJ의 특징</h4>
				</div>
				<div class="modal-body">
					저희 서비스의 특징은 유투브의 음악을 선택하여 디제잉해 볼 수 있다는 점입니다. <br> DJ가 되어 부스를
					만들어 보세요. 전세계 음악팬들과 함께 음악을 공유할 수 있습니다. <br>
					본인의 음악말고도 타인의 음악을 감상하고싶으시다면<br>
					하단의 부스목록 보러가기를 클릭!<br>
					<br> <img src="/images/a.jpg" id="imagepreview"
						style="width: 256px; height: 256px;">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary btn-lg" data-dismiss="modal">Close</button>
					<a class="btn btn-primary btn-lg" href="/booth/boothmain" role="button">부스목록 보러가기</a>
				</div>
			</div>

		</div>
	</div>
	<!-- 모달 종료 -->
	
<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
</script>
