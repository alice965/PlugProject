<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- 채팅 프사 사이즈를 위한 스타일 정의 -->
<style>
.thumnail {
	width: 30px;
	height: 30px;
	border-radius: 50%;
	margin-top: -4px;
}
.chatbox {
	height:auto;
	display:inline-block;
	padding:10px;
	margin:3px;
	background-color: gray;
	border-radius: 7%;
}
.chatbox_right{
	margin-left:40%
}
.chatbox_me{
	height:auto;
	display:inline-block;
	padding:10px;
	margin:3px;
	background-color: yellow;
	border-radius: 7%;
}
</style>
<!-- http://1004lucifer.blogspot.kr/2015/04/youtube-player-api.html -->

<!--부스 타이틀 영역  -->
<div>
	<div id="booth_name" align="center" style="color: #292F33;"
		align="left">
		<i class="fa fa-heart" aria-hidden="true"
			style="font-size: 15px; color: #c94c4c;"></i> ${one.GENRE } <br /> <i
			class="fa fa-tags" aria-hidden="true"
			style="font-size: 15px; color: #92a8d1;"></i> ${one.CONTENT }
		<h1>
			<b><i>${one.TITLE }</i></b>
		</h1>
		<br />
	</div>
	<div id="booth_info" style="background-color: #292F33; color: #CCD6DD;">
		<div class="row">
			<div class="col-md-1"></div>
			<!-- 방장 닉네임 -->
			<div class="col-md-2">
				<h4>
					&nbsp; <i class="fa fa-headphones fa-lg" aria-hidden="true"
						style="font-size: 20px; color: #55ACEE;"></i> ${one.NICKNAME }
				</h4>
			</div>
			<!-- 참여자 수 -->
			<div class="col-md-2">
				<h4>
					&nbsp; <i class="fa fa-users fa-lg" aria-hidden="true"
						style="font-size: 20px; color: #55ACEE;"></i> ${one.COUNT }
				</h4>
			</div>

			<div class="col-md-4">
				<h4>
					<button type="button"
						style="font-size: 15px; color: #292F33; background-color: #FFFFFF; width: 75px"
						class="btn btn-md" onclick="playYoutube();">Play</button>

					<button type="button"
						style="font-size: 15px; color: #292F33; background-color: #FFFFFF; width: 75px"
						class="btn btn-md" onclick="stopYoutube();">Stop</button>
					<!-- 유투브 중지하고 처음으로 -->
				</h4>
			</div>
			
			<div class="col-md-3" align="left">
				<i class="fa fa-retweet" aria-hidden="true"><small> 첫 추가 후에는 F5버튼을 눌러 업로드를 완료합니다!</small></i>
				<br/>
				<i class="fa fa-exclamation-triangle" aria-hidden="true"><small> 저작권문제로 재생이 안되는 해당 동영상들은 삭제해야합니다.</small></i>
			</div>
		</div>
	</div>
</div>

<!-- 메인 영역 -->
<div class="row">

	<!-- 왼쪽 영역 (영상 플레이) -->
	<div class="col-md-8" style="min-height: 60%; background-color: black;">
		<div id="Iframe"></div>
		<!-- 유투브 플레이 -->
		<c:if test="${!empty video }">
			<c:forEach var="list" items="${video }">
				<input type="hidden" value="${list.VIDEO_ID }" id="video_list" />
			</c:forEach>
		</c:if>
	</div>

	<!-- 오른쪽 영역 (채팅과 재생목록 -->
	<div class="col-md-4" style="min-height: 50%; min-width: 10%;">
		<!-- 탭 영역 -->
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#chat"
				id="chattab">채팅창</a></li>
			<li><a data-toggle="tab" href="#vlist">재생목록</a></li>
		</ul>

		<!-- 탭  클릭시 펼쳐지는 페이지 -->
		<div class="tab-content">
			<!-- 채팅 영역 -->
			<div id="chat" class="tab-pane fade in active">
				<div id="log"
					style="padding: 3px; overflow-x: hidden; overflow-y: scroll; word-break: break-all; width: 95%; height: 50%; background-color: #CCD6DD; font-size: 10pt;"
					align="left"></div>
				<div id="cnt"></div>
				<input type="text" id="chat_input_field"
					style="width: 95%; margin-top: 5px; padding: 4px;"
					placeholder="여기에 메시지를 입력하세요" />
			</div>
			<!-- /chat -->


			<!-- 재생목록 -->
			<div id="vlist" class="tab-pane fade">
				<div id="videolist"
					style="padding: 3px; overflow-x: hidden; overflow-y: scroll; word-break: break-all; width: 95%; height: 50%; background-color: #CCD6DD; font-size: 10pt;"
					align="center">

					<div class="tab-content">
						<div id="videolist" class="tab-pane fade in active">
							<div class="dropdown">
								<div class="dropdown-toggle" data-toggle="dropdown">
									<h4>
										<b>재생목록 추가하기<span class="caret"></span></b>
									</h4>
								</div>

								<ul class="dropdown-menu" style="left: 33%;">
									<li><a class="btn btn-default" data-target="#modal-1"
										data-toggle="modal">키워드로 갖고오기</a><input type="hidden"></li>
									<li><a class="btn btn-default" data-target="#modal-2"
										data-toggle="modal">재생목록 갖고오기</a><input type="hidden"></li>
									<li><a class="btn btn-default" data-target="#modal-3"
										data-toggle="modal">채널에서 갖고오기</a><input type="hidden"></li>
								</ul>
							</div>
							<i class="fa fa-retweet" aria-hidden="true" style="color: black;"><b><small> 
							새로고침 버튼으로 업데이트를 확인하세요!</small></i><br/>
							<small> 
							(PLAY버튼을 누르면 업데이트된 재생목록이 새롭게 반영됩니다!)</small></b></i>
							
							<button type="button" id="newList">새로고침</button>	
						</div>
					</div>
					<hr />


					<!-- 재생목록 갖고오기 : 재생목록 없을 경우 -->
					<c:if test="${!empty nolist }">
						<b style="color: #c94c4c">재생목록이 없습니다.</b>
						<br />
					</c:if>
					<c:if test="${!empty video }">
						<div id="mylist">
							<c:forEach var="obj" items="${video }" begin="0" step="1"
								varStatus="status">
								<div class="row">
									<div align="center" class="col-xs-1" style="left: 3%">
										<input type="checkbox" name="video_num" class="vi"
											value="${obj.VIDEO_NUM }" />
									</div>
									<div align="left" class="col-xs-3">
										<!-- xs가 제일 작은 사이즈. -->
										<img src="${obj.IMAGE}" style="width: 110px; height: 70px">
									</div>
									<div class="col-xs-8" align="left">
										<b>${status.count}. ${obj.VIDEO_TITLE}</b> <br /> <small>
											추가한 사람 : ${obj.ADD_ID } (${obj.ADD_NICKNAME }) <br /> 추가한 날짜
											: <fmt:formatDate value="${obj.ADDDATE}" pattern="yyyy.MM.dd" />
											<!-- 이부분은 그냥 FORMAT으로 사용하자.. -->
										</small> <br />
									</div>
								</div>
								<hr />
							</c:forEach>
						</div>
						<button type="button" id="delete">삭제하기</button>
						<!-- 삭제할 시 submit으로 변경해주도록 script에서 설정 -->
					</c:if>


				</div>
			</div>
		</div>
	</div>
	<!-- 컨테이너 종료 태그 -->

	<!-- modal1 -->
	<div class="modal fade" id="modal-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content"
				style="overflow-x: hidden; overflow-y: scroll; max-height: 600px;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title"><b>키워드로 갖고오기</b></h3>
				</div>

				<div class="modal-body" style="background-color: #92a8d1;">
					<div class="well">
						<h4>
							<b>HOW TO USE?</b><br />
						</h4>
						<h6>
							● 찾고자하는 키워드를 입력창에 검색합니다.<br/> ※ 최대 50개의 재생목록 동영상을 불러올 수 있습니다.
						</h6>
						<!-- 방에서 추가한 것이 아닐 경우도 생각해야함.. 방 번호를 알아와서 추가하는 경우.. c:if 태그 사용하기 -->
						<form name="form1" method="post" onSubmit="return false;">
							<input type="text" id="search_box" placeholder="검색어 입력.." style="width:300px">
							<input type="hidden" id="num1" placeholder="${num }"
								value="${num }" style="width: 100px" disabled>
							<button onClick="fnGetList();">가져오기</button>
						</form>
					</div>
					<div class="well">
						<!-- 우물효과를 줌 -->
						<h4>LIST</h4>
						<div id="video-container1"></div>
					</div>
				</div>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
	<!-- modal1종료 -->
	<!-- modal2 -->
	<div class="modal fade" id="modal-2" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content"
				style="overflow-x: hidden; overflow-y: scroll; max-height: 600px;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title"><b>재생목록에서 갖고오기</b></h3>
				</div>

				<div class="modal-body" style="background-color: #92a8d1;">
					<div class="well">
						<h4>
							<b>HOW TO USE?</b><br/>
						</h4>
						<h6>
							1. YouTube에서 원하는 재생목록에 들어갑니다.<br /> 2. 주소창에서 'list=' 뒷 부분을 복사합니다.<br/> 3. 아래
							입력 창에 붙여넣기 합니다.<br /> ※최대 50개의 재생목록 동영 상을 불러올 수 있습니다.<br/><br/>
							EX) 주소창 : https://www.youtube.com/watch?v=ZsYwEV_ge4Y<br/>             
							           &list=PLNSKpl7JCPswwj_fWkfixq5L7QeZJA4Ot
						</h6>
						<input type="text" id="playlist" placeholder="ex)PLNSKpl7JCPswwj_fWkfixq5L7QeZJA4Ot" style="width:400px">
						<!-- 방에서 추가한 것이 아닐 경우도 생각해야함.. 방 번호를 알아와서 추가하는 경우.. c:if 태그 사용하기 -->
						<input type="hidden" id="num2" placeholder="${num }" value="${num }"
							style="width: 100px" disabled>
						<button onClick="fnGetList2();">가져오기</button>
					</div>
					<div class="well">
						<h4>LIST</h4>
						<div id="video-container2"></div>
					</div>
				</div>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
	<!-- modal2종료 -->
	<!-- modal3 -->
	<div class="modal fade" id="modal-3" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content"
				style="overflow-x: hidden; overflow-y: scroll; max-height: 600px;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title"><b>채널에서 갖고오기</b></h3>
				</div>

				<div class="modal-body" style="background-color: #92a8d1;">
					<div class="well">
						<h4>
							<b>HOW TO USE?</b><br />
						</h4>
						<h6>
							1. YouTube에서 원하는 채널에 들어갑니다.<br/> 2. 주소창에서 'channel/' 뒷 부분을 복사합니다.
							<br/> 3. 아래 입력 창에 붙여 넣기 합니다.<br/> ※최대 50개의
							재생목록 동영상을 불러올 수 있습니다.<br/><br/>
							EX) 주소창 : https://www.youtube.com/channel/UCweOkPb1wVVH0Q0Tlj4a5Pw
						</h6>
						<input type="text" id="channelId" placeholder="ex)UCweOkPb1wVVH0Q0Tlj4a5Pw" style="width:400px">
						<input type="hidden" id="num3" placeholder="${num }" value="${num }"
							style="width: 100px" disabled>
						<button onClick="fnGetList3();">가져오기</button>
					</div>
					<div class="well">
						<h4>LIST</h4>
						<div id="video-container3"></div>
					</div>
				</div>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
	<!-- modal3종료 -->

</div>
<!-- row종료 태그 -->

<!-- 하단 좋아요 싫어요 부분 
<div style="background-color: yellow">
	<div id="like" class="col-md-3"
		style="border-radius: 2em; background-color: #66ff99;">
		<i class="fa fa-thumbs-o-up" aria-hidden="true"></i>좋아요<br>
	</div>
	<div id="book" class="col-md-3"
		style="border-radius: 2em; background-color: #ffcc66;">
		<i class="fa fa-star-o" aria-hidden="true"></i>북마크<br>
	</div>
	<div id="dislike" class="col-md-3"
		style="border-radius: 2em; background-color: #ff0066;">
		<i class="fa fa-thumbs-o-down" aria-hidden="true"></i>싫어요<br>
	</div>
	<div id="watingroom" class="col-md-3"
		style="background-color: #cc66ff; border-radius: 2em;">
		대기열넣을곳 <br />
	</div>
</div> -->


<script>
/////// 채팅 영역 스크립트///////

//채팅 영역 웹소켓 부분
document.getElementById("chat_input_field").onchange = function() {
	if (this.value.length != 0) {
		ws.send(this.value);
		this.value = "";
	}
}
var ws = new WebSocket("ws://192.168.10.82/ws/chat");

ws.onopen = function(e) {
	document.getElementById("log").innerHTML += "<p><b>---DJ 채팅방에 오신 것을 환영합니다.----</b></p>";
	//ws.send("userinfo,"+"${one.ID }"+","+ "${one.NICKNAME }" );
	var obj = JSON.parse(e.data);
	document.getElementById("cnt").innerHTML = "<small>[ " + obj.cnt
			+ " ] 명</small>";
}
ws.onmessage = function(a) {
	console.log("a : " + a.data);
	var obj = JSON.parse(a.data);
	document.getElementById("cnt").innerHTML = "<small>[ " + obj.cnt
			+ " ] 명</small>";
	if (obj.mode == "join") {
		var html = obj.user + "님께서 채팅방에 입장하셨습니다. <br>";
	} else if (obj.mode == "exit") {
		var html = "<b>[ " + obj.user + "]</b>님이 퇴장하셨습니다.<br>";
	} else if (obj.mode == "info") {

	} else {
		if(obj.sender == "${auth.NICKNAME }"){
			var html = "<div class=\"chatbox_right\"><div class=\"chatbox_me\"><img src='"+obj.url+"' class=\"thumnail\"><b>[ " + obj.sender + "]</b>" + obj.msg + "<br></div></div><br>";
		}else{
			console.log(obj.user);
			console.log(obj.sender);
			var html = "<div class=\"chatbox\"><img src='"+obj.url+"' class=\"thumnail\"><b>["+obj.sender+"]</b>" + obj.msg + "<br></div><br>";
		}
	}

	document.getElementById("log").innerHTML += html;
	document.getElementById("log").scrollTop = document
			.getElementById("log").scrollHeight;

}
//페이지 오픈시 채팅탭이 클릭된 상태로 만들기
$("#chattab").trigger("click");
	//유투브 업로드
	//YOUTUBE API 업로드
	var tag = document.createElement('script');
	tag.src = "http://www.youtube.com/iframe_api";
	var firstScriptTag = document.getElementsByTagName('script')[0];
	firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

	/**
	 * onYouTubeIframeAPIReady 함수는 필수로 구현해야 한다.
	 * 플레이어 API에 대한 JavaScript 다운로드 완료 시 API가 이 함수 호출한다.
	 * 페이지 로드 시 표시할 플레이어 개체를 만들어야 한다.
	 */
	var player;
	var videolist = document.getElementById("video_list").value;
	function onYouTubeIframeAPIReady() {
		player = new YT.Player('Iframe', {
			height : '480', // <iframe> 태그 지정시 필요없음
			width : '1060', // <iframe> 태그 지정시 필요없음
			videoId : videolist, // <iframe> 태그 지정시 필요없음
			playerVars : { // <iframe> 태그 지정시 필요없음
				controls : '2'
			}
		});
	}

	function playYoutube(){
		var ar =[];

		$.ajax({
			"url" : "/video/F5",			
			"data": {
				"room_num" : ${one.NUM }
			 }
		}).done(function(rst){
			//console.log(rst);
			$(rst).each(
				function(i){
					//window.alert(this.VIDEO_ID);
  					ar.push(this.VIDEO_ID);
				});
			player.playVideo();		
			player.loadPlaylist({ 
			   	'playlist': ar,
			    'listType': 'playlist',
			    //'index': 0,
			    
			    //'startSeconds': 0,
			    'suggestedQuality': 'large'				
			});
		});
		
	}
	
    function stopYoutube() {  		
        player.seekTo(0, true);     // 영상의 시간을 0초로 이동시킨다.
        player.stopVideo();
    }

	//키워드로(target) 갖고오기==================================================================================
	function fnGetList() {
		var $getval = $("#search_box").val();
		if ($getval == "") {
			alert("검색어를 입력하세요.");
			$("#search_box").focus();
			return;
		}
		$("#video-container1").empty();

		var TargetUrl = "https://www.googleapis.com/youtube/v3/search?part=snippet&order=relevance"
				+ "&q="
				+ encodeURIComponent($getval)
				+ "&key=AIzaSyBf7YiIAKxOXVlpZoeo2HRx5YlhjYrsW-I&maxResults=50";

		$.ajax({
					type : "POST",
					url : TargetUrl,
					dataType : "jsonp",
					success : function(jdata) {
						//console.log(jdata);
						var num = document.getElementById("num1").value;
						var html = "";
					if(jdata.items){ //아무것도 없을 경우..(재생목록이 나오지 않는 경우)
						$(jdata.items)
								.each(
										function(i) { //items반복문으로 돔.
											if(!(this.id.videoId==undefined)){
											html += "<div class=\"row\"><div align=\"left\" class=\"col-xs-1\">";
											html += i+ "</div><div align=\"left\" class=\"col-xs-3\"><img src=\"";
											html += this.snippet.thumbnails.medium.url;
											html += "\" style=\"width:120px; height:70px\"></div><div align=\"left\" class=\"col-xs-8\">";
											html += '<br/>'+ this.snippet.title	+ "<br/>";

												//함수로 호출해주기 (문자는 홀따옴표로 묶기 ) _ 제목에 홀따옴표가 있는 경우 replace로 바꿔주기.
												var tr = this.snippet.title.replace(/'/g,"&lsquo;"); 
											html += "동영상 추가하기 : <a href=\"javascript:sendAddReq('"+tr+ "', " ; 
											html += "'"+ this.snippet.thumbnails.medium.url+ "', " ; 
											html += "'"+ this.id.videoId + "', " ; 
											html += "'"+ this.snippet.channelId+ "', " ; 
											html += "'"+ num+ "')";
											html += "\">추가하기</a><hr/></div></div>";
											}
										
										});
						document.getElementById("video-container1").innerHTML = html;
					}else{
						$('#video-container1').html('Sorry you have no uploaded videos');
					}
					},
					error : function(xhr, textStatus) {
						console.log(xhr.responseText);
						alert("지금은 시스템 사정으로 인하여 요청하신 작업이 이루어지지 않았습니다.\n잠시후 다시 이용하세요.");
						return;
					}
				});
	}
	
//재생목록에서 갖고오기=======================================================================================
function fnGetList2(){ //재생목록에서 갖고오기
	var num = $("#num2").val();
	var playlist = $("#playlist").val();
	if(playlist == ""){
			alert("재생목록 아이디를 입력하세요");
			$("#playlist").focus();
			return;
	}

	$("#video-container2").empty();

	var TargetUrl = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId="
		+ playlist + "&key=AIzaSyBf7YiIAKxOXVlpZoeo2HRx5YlhjYrsW-I&maxResults=50";
		$.ajax({
			type : "POST",
			url : TargetUrl,
			dataType : "jsonp",
			success : function(jdata) {
				//console.log(jdata);
				var html = "";
				//console.log(jdata.items);
				if(jdata.items){
					$(jdata.items).each(
						function(i) { //items반복문으로 돔.
							if(this.snippet.resourceId.videoId!=undefined){ //채널인 경우는 비디오아이디가 없으므로 뺌.
							html += "<div class=\"row\"><div align=\"left\" class=\"col-xs-1\">";
							html += i+ "</div><div align=\"left\" class=\"col-xs-3\"><img src=\"";
							html += this.snippet.thumbnails.medium.url;
							html += "\" style=\"width:120px; height:70px\"></div><div align=\"left\" class=\"col-xs-8\">";
							html += '<br/>'+ this.snippet.title	+ "<br/>";
	
							//함수로 호출해주기 (문자는 홀따옴표로 묶기 ) _ 제목에 홀따옴표가 있는 경우 replace로 바꿔주기.
							var tr = this.snippet.title.replace(/'/g,"&lsquo;"); 
							html += "동영상 추가하기 : <a href=\"javascript:sendAddReq('"+tr+ "', " ; 
							html += "'"+ this.snippet.thumbnails.medium.url+ "', " ; 
							html += "'"+ this.snippet.resourceId.videoId + "', " ; 
							html += "'"+ this.snippet.channelId+ "', " ; 
							html += "'"+ num+ "')";
							html += "\">추가하기</a><hr/></div></div>";
							}
											
						});
					//console.log(html);
					document.getElementById("video-container2").innerHTML = html;
				}else{
					$('#video-container2').html('Sorry you have no uploaded videos');
				}
				},
				error : function(xhr, textStatus) {
				console.log(xhr.responseText);
				alert("지금은 시스템 사정으로 인하여 요청하신 작업이 이루어지지 않았습니다.\n잠시후 다시 이용하세요.");
				return;
				}
			});
	}

//채널에서 갖고오기=========================================================================================
function fnGetList3(){ 
	var num = $("#num3").val();
	var channelId = $("#channelId").val();
	if(channelId == ""){
			alert("재생목록 아이디를 입력하세요");
			$("#channelId").focus();
			return;
	}
	$("#video-container3").empty();

	var ChannelUrl = "https://www.googleapis.com/youtube/v3/channels?part=contentDetails&id="+ channelId
		+ "&key=AIzaSyBf7YiIAKxOXVlpZoeo2HRx5YlhjYrsW-I";
	$.ajax({
		type : "POST",
		url : ChannelUrl,
		dataType : "jsonp",
		success:function(jdata){
		if(jdata.items[0]){
			var playlistId = jdata.items[0].contentDetails.relatedPlaylists.uploads;

			var TargetUrl = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId="
					+ playlistId + "&maxResults=50&key=AIzaSyBf7YiIAKxOXVlpZoeo2HRx5YlhjYrsW-I";
			//window.alert(TargetUrl);
		$.ajax({
			type : "POST",
			url : TargetUrl,
			dataType : "jsonp",
			success : function(jdata) {
				//console.log(jdata);
				var html = "";
				$(jdata.items).each(
					function(i) { //items반복문으로 돔.
						if(!(this.snippet.resourceId.videoId==undefined)){ //채널인 경우는 비디오아이디가 없으므로 뺌.
						html += "<div class=\"row\"><div align=\"left\" class=\"col-xs-1\">";
						html += i+ "</div><div align=\"left\" class=\"col-xs-3\"><img src=\"";
						html += this.snippet.thumbnails.medium.url;
						html += "\" style=\"width:120px; height:70px\"></div><div align=\"left\" class=\"col-xs-8\">";
						html += '<br/>'+ this.snippet.title	+ "<br/>";

						//함수로 호출해주기 (문자는 홀따옴표로 묶기 ) _ 제목에 홀따옴표가 있는 경우 replace로 바꿔주기.
						var tr = this.snippet.title.replace(/'/g,"&lsquo;"); 
						html += "동영상 추가하기 : <a href=\"javascript:sendAddReq('"+tr+ "', " ; 
						html += "'"+ this.snippet.thumbnails.medium.url+ "', " ; 
						html += "'"+ this.snippet.resourceId.videoId + "', " ; 
						html += "'"+ this.snippet.channelId+ "', " ; 
						html += "'"+ num+ "')";
						html += "\">추가하기</a><hr/></div></div>";
						}
										
					});
					document.getElementById("video-container3").innerHTML = html;
				},
				error : function(xhr, textStatus) {
				console.log(xhr.responseText);
				alert("지금은 시스템 사정으로 인하여 요청하신 작업이 이루어지지 않았습니다.\n잠시후 다시 이용하세요.");
				return;
				}
			});
		}else{
			$('#video-container3').html('Sorry you have no uploaded videos');
		}
		}
		});
	}
	//새로고침 버튼 클릭하면 재생목록 불러오기.
	$("#newList").click(function(){
		$.ajax({
			"url" : "/video/F5",
			"data": {
				"room_num" : ${one.NUM }
			 }
		}).done(function(rst){
				console.log(rst);
				var html = "";
				$(rst).each(
						function(i){
							html += "<div class=\"row\">";
							html += "<div align=\"center\" class=\"col-xs-1\" style=\"left: 3%\">";
							html += "<input type=\"checkbox\" name=\"video_num\" class=\"vi\" value=\"" + this.VIDEO_NUM + "\" />"; 
							html += "</div>";	
							
							html += "<div align=\"left\" class=\"col-xs-3\">";
							html += "<img src=\"" + this.IMAGE + "\" style=\"width: 110px; height: 70px\">";
							html += "</div>";
							
							html += "<div class=\"col-xs-8\" align=\"left\">";
							html += "<b>" + (i+1) + ". " + this.VIDEO_TITLE + "</b> <br/>";
							html += "<small>추가한 사람 : " + this.ADD_ID +" (" + this.ADD_NICKNAME + ")<br/>";
							
							html += "추가한 날짜 : " + this.FMT;
							html += "</small><br/>";
							html += "</div></div><hr/>";
						});
				document.getElementById("mylist").innerHTML = html;
		});
	});
	
	

	
	function sendAddReq(video_title, image, video_id, channel_url, num) {
		$.ajax({
			"url" : "/video/add",
			"data": {
			  	"video_title" : video_title,
			  	"image" :image, 
			  	"video_id" : video_id,
			  	"channel_url" : channel_url,
			  	"num": num
			 }
		}).done(function(rst){
			if(rst=="YYYY") {
				window.alert("등록이 완료되었습니다.");
			}else if(rst=="NNNN"){
				window.alert("이미 등록되어 있습니다.");
			}else{
				window.alert("등록 권한이 없습니다.");
			}
		});
		
	}
	
	//아무것도 선택 안하고 삭제버튼 눌렀을 때
	$("#delete").click(function() {
		var chk=$(".vi:checked").length;
		if(chk==0){
			alert("삭제할 비디오를 선택해주세요.");
		}
		else{
			var check = [];
			$(".vi:checked").each(function() {
				check.push($(this).val());
			});
			//window.alert(check +" / " +JSON.stringify(check));
			$.ajax({
				"url" : "/video/delete",
				"data" : {
					"room_num" : ${one.NUM },
					"video_num" : check				
				}
			}).done(function(rst){
				if(rst=="YYYY") {
					window.alert("삭제가 완료되었습니다.");
				}else{
					window.alert("삭제 권한이 없습니다.");
				}
			});
		}
	});
	
</script>
