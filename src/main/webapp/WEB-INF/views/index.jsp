<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<!-- 페이지 상단 이미지 영역 -->
	<div class="jumbotron">
		<h2 class="text-center">Welcome to Plug.DJ</h2>
		<p class="text-center">Plug.DJ에서 전세계 음악팬들과 플레이 리스트를 공유해보세요!</p>
		<br>
		<p class="text-center">
			<a class="btn btn-primary btn-lg" href="#" role="button">나만의 DJ부스
				만들기</a>
		</p>
	</div>
	<!-- 점보트론 종료 -->


	<!-- 소개 영역[모달 활용] -->
	<div class="row">
		<!-- 소개1 -->
		<div class="col-md-4">
			<h4>서비스 소개</h4>
			<p>Plug.DJ는 나만의 부스를 만들어 플레이 리스트를 공유할 수 있는 음악 서비스입니다.</p>
			<p>
				<a class="btn btn-default" data-target="#modal-1"
					data-toggle="modal">자세히 알아보기</a>
			</p>
		</div>
		<!-- 소개2 -->
		<div class="col-md-4">
			<h4>서비스 소개</h4>
			d
			<p>Plug.DJ는 나만의 부스를 만들어 플레이 리스트를 공유할 수 있는 음악 서비스입니다.</p>
			<p>
				<a class="btn btn-default" href="#">자세히 알아보기</a>
			</p>
		</div>
		<!-- 소개3 -->
		<div class="col-md-4">
			<h4>서비스 소개</h4>
			<p>Plug.DJ는 나만의 부스를 만들어 플레이 리스트를 공유할 수 있는 음악 서비스입니다.</p>
			<p>
				<a class="btn btn-default" href="#">자세히 알아보기</a>
			</p>
		</div>

	</div>
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
			<div class="col-sm-4 panel-body" align="center">
				<div class="media">
					<div class="media-top">
						<a href="#"><img class="media-object" src="images/a.jpg"></a>
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
				<!-- media tag end -->
			</div>
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
					<br> <img src="/images/a.jpg" id="imagepreview"
						style="width: 256px; height: 256px;">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	<!-- 모달 종료 -->
</div>
<!-- 컨테이너 종료 -->


