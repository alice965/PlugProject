<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!--부스 타이틀 영역  -->
<div style="background-color: #6699ff;">
	<div id="booth_name"><h2>${one.TITLE }</h2></div>
	<div id="booth_info">
		<div class="row">

			<!-- 방장 닉네임 -->
			<div class="col-md-2"> 
				<h4>&nbsp;
					<i class="fa fa-headphones fa-lg" aria-hidden="true" style="font-size:30px;color:gray;"></i> 
					${one.NICKNAME }
				</h4>
			</div>
			<!-- 참여자 수 -->
			<div class="col-md-2">
				<h4>&nbsp;
					<i class="fa fa-users fa-lg" aria-hidden="true" style="font-size:30px;color:gray;"></i> 
					${one.COUNT }
				</h4>
			</div>
		</div>
		
	</div>
</div>

<!-- 메인 영역 -->
<div class="row">

	<!-- 왼쪽 영역 (영상 플레이) -->
	<div class="col-md-9" style="min-height: 65%; background-color: black;">
		<p>영상이 들어갈 위치</p>
	</div>

		<!-- 오른쪽 영역 (채팅과 재생목록 -->
	<div class="col-md-3"  	style="min-height: 65%; min-width: 300px; background-color: #6699ff; border-radius: 2em;">
		
			<!-- 탭 영역 -->
		  <ul class="nav nav-tabs">
			    <li class="active"><a data-toggle="tab" href="#chat">채팅창</a></li>
			    <li><a data-toggle="tab" href="#">채팅참여자</a></li>
			    <li><a data-toggle="tab" href="#slist">재생목록</a></li>
		  </ul>
		
		  <div class="tab-content">
			    <div id="chat" class="tab-pane fade in active">
			    </div>
		   </div>
		    </div> <!-- 컨테이너 종료 태그 -->
   
	<!-- 채팅 영역 -->
	<div id="chat"  style="min-width: 300px;">
		<form class="chat_input_form" >
			<input id="chat_input_field" type="text" value="" autocomplete="off"
				placeholder="여기에 메시지를 입력하세요" maxlength="256">
		</form>
	</div>

</div> <!-- /row -->


<div style="background-color:yellow">
	<div id="na" class="col-md-3" style="border-radius: 2em; background-color:#66ff99;"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i>좋아요<br></div>

	<div id="book" class="col-md-3" style="border-radius: 2em; background-color:#ffcc66;"><i class="fa fa-star-o" aria-hidden="true"></i>북마크<br></div>

	<div id="na" class="col-md-3" style="border-radius: 2em; background-color:#ff0066;"><i class="fa fa-thumbs-o-down" aria-hidden="true"></i>싫어요<br></div>

	<div id="watingroom" class="col-md-3" style="background-color: #cc66ff; border-radius: 2em;">대기열넣을곳
	<br/></div>	
</div>

</html>
