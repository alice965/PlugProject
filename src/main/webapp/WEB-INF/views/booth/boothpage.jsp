<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- http://1004lucifer.blogspot.kr/2015/04/youtube-player-api.html -->

<!--부스 타이틀 영역  -->
<div style="background-color: #6699ff;">
	<div id="booth_name">
		<h2>${one.TITLE }</h2>
	</div>
	<div id="booth_info">
		<div class="row">

			<!-- 방장 닉네임 -->
			<div class="col-md-2">
				<h4>
					&nbsp; <i class="fa fa-headphones fa-lg" aria-hidden="true"
						style="font-size: 30px; color: gray;"></i> ${one.NICKNAME }
				</h4>
			</div>
			<!-- 참여자 수 -->
			<div class="col-md-2">
				<h4>
					&nbsp; <i class="fa fa-users fa-lg" aria-hidden="true"
						style="font-size: 30px; color: gray;"></i> ${one.COUNT }
				</h4>
			</div>
		</div>

	</div>
</div>

<!-- 메인 영역 -->
<div class="row">

	<!-- 왼쪽 영역 (영상 플레이) -->
	<div class="col-md-8" style="min-height: 65%; background-color: black;">
		<div id="Iframe"></div>
		<button type="button" onclick="playYoutube();">Play</button>
		<!-- 유투브 플레이 -->
		<c:if test="${!empty video }">
			<c:forEach var="list" items="${video }">
				<input type="hidden" value="${list.VIDEO_ID }" id="video_list" />
			</c:forEach>
		</c:if>
	</div>

	<!-- 오른쪽 영역 (채팅과 재생목록 -->
	<div class="col-md-4"
		style="min-height: 60%; min-width: 20%; background-color: #6699ff; border-radius: 2em;">
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
					style="padding: 3px; overflow-x: hidden; overflow-y: scroll; word-break: break-all; width: 95%; height: 55%; background-color: #D5D5D5; font-size: 10pt;"
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
					style="padding: 3px; overflow-x: hidden; overflow-y: scroll; word-break: break-all; width: 95%; height: 60%; background-color: #D5D5D5; font-size: 10pt;"
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
						</div>
					</div>
					<hr />

					<!-- 재생목록 갖고오기 : 재생목록 없을 경우 -->
					<c:if test="${!empty nolist }">
						<b style="color: red">재생목록이 없습니다.</b>
						<br />
					</c:if>
					<!-- 재생목록 갖고오기 : 재생목록 있을 경우 -->
					<c:if test="${!empty video }">
						<c:forEach var="obj" items="${video }">
							<div class="row">
								<div align="left" class="col-xs-4">
									<!-- xs가 제일 작은 사이즈. -->
									<img src="${obj.IMAGE}" style="width: 120px; height: 70px">
								</div>
								<div class="col-xs-8" align="left">
									${obj.VIDEO_TITLE} <br />
									<small> 추가한 사람 : ${obj.ADD_ID } (${obj.ADD_NICKNAME })
										<br /> 추가한 날짜 : <fmt:formatDate value="${obj.ADDDATE}"
											pattern="yyyy.MM.dd" />
									</small> <br />
								</div>
							</div>
							<hr />
						</c:forEach>
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
					<h3 class="modal-title">키워드로 갖고오기</h3>
				</div>

				<div class="modal-body">
					<div class="well">
						<h4>
							<b>HOW TO USE?</b><br />
						</h4>
						<h6>
							● 찾고자하는 키워드를 입력창에 검색합니다.<br /> ※최대 50개의 재생목록 동영상을 불러올 수 있습니다.
						</h6>
						<!-- 방에서 추가한 것이 아닐 경우도 생각해야함.. 방 번호를 알아와서 추가하는 경우.. c:if 태그 사용하기 -->
						<form name="form1" method="post" onSubmit="return false;">
							<input type="text" id="search_box" placeholder="검색어 입력..">
							<input type="text" id="num1" placeholder="${num }"
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
					<h3 class="modal-title">재생목록에서 갖고오기</h3>
				</div>

				<div class="modal-body">
					<div class="well">
						<h4>
							<b>HOW TO USE?</b><br />
						</h4>
						<h6>
							1. 원하는 채널의 재생목록에 들어갑니다.<br /> 2. 재생목록의 src값을 복사합니다.<br /> 3. 아래
							입력 창에 붙여넣기 합니다.<br /> ※최대 50개의 재생목록 동영상을 불러올 수 있습니다.
						</h6>
						<input type="text" id="playlist" placeholder="재생목록 아이디 입력..">
						<!-- 방에서 추가한 것이 아닐 경우도 생각해야함.. 방 번호를 알아와서 추가하는 경우.. c:if 태그 사용하기 -->
						<input type="text" id="num2" placeholder="${num }" value="${num }"
							style="width: 100px" disabled>
						<button id="send2">가져오기</button>
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
					<h3 class="modal-title">채널에서 갖고오기</h3>
				</div>

				<div class="modal-body">
					<div class="well">
						<h4>
							<b>HOW TO USE?</b><br />
						</h4>
						<h6>
							1. 원하는 채널에 들어갑니다.<br /> 주소창에서 https://www.youtube.com/channel/
							뒤에 있는 아이디값을 복사합니다.<br /> 3. 아래 입력 창에 붙여넣기 합니다.<br /> ※최대 50개의
							재생목록 동영상을 불러올 수 있습니다.
						</h6>
						<input type="text" id="channelId" placeholder="채널 아이디 입력..">
						<input type="text" id="num3" placeholder="${num }" value="${num }"
							style="width: 100px" disabled>
						<button id="send3">가져오기</button>
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






<!-- 하단 좋아요 싫어요 부분 -->
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
</div>

<script>

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

	function playYoutube() {
		// 플레이어 자동실행 (주의: 모바일에서는 자동실행되지 않음)
		player.playVideo();
		//console.log(player.getPlaylist());
		player.loadPlaylist({ 
		    'playlist': [ //오류가 뜰 수 있음.
		    	  <c:forEach var="t" items="${video }" varStatus="vs">
		  			'${t.VIDEO_ID }' <c:if test="${!vs.last }">,</c:if>
		  		 </c:forEach>
		      ],
		    'listType': 'playlist',
		    'index': 0,
		    'startSeconds': 0,
		    'suggestedQuality': 'large'
		});

	}

	/////// 채팅 영역 스크립트///////

	//채팅 영역 웹소켓 부분
	document.getElementById("chat_input_field").onchange = function() {
		if (this.value.length != 0) {
			ws.send(this.value);
			this.value = "";
		}
	}
	var ws = new WebSocket("ws://192.168.10.81/ws/chat");

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
			var html = "<b>[ " + obj.sender + "]</b>" + obj.msg + "<br>";
		}

		document.getElementById("log").innerHTML += html;
		document.getElementById("log").scrollTop = document
				.getElementById("log").scrollHeight;

	}
	//페이지 오픈시 채팅탭이 클릭된 상태로 만들기
	$("#chattab").trigger("click");

	//키워드로(target) 갖고오기===================================================================================================
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

		$
				.ajax({
					type : "POST",
					url : TargetUrl,
					dataType : "jsonp",
					success : function(jdata) {
						//console.log(jdata);
						var num = document.getElementById("num1").value;
						var html = "";
						$(jdata.items)
								.each(
										function(i) { //items반복문으로 돔.
											html += "<div class=\"row\"><div align=\"left\" class=\"col-xs-1\">"
													+ i
													+ "</div><div align=\"left\" class=\"col-xs-3\"><img src=\"" + this.snippet.thumbnails.medium.url + 
		"\" style=\"width:120px; height:70px\"></div><div align=\"left\" class=\"col-xs-8\">"
													+ '<br/>'
													+ this.snippet.title
													+ "<br/>";

											html += "동영상 추가하기 : <a href=\"/video/add?video_title="
													+ this.snippet.title
													+ "&image="
													+ this.snippet.thumbnails.medium.url
													+ "&video_id="
													+ this.id.videoId
													+ "&channel_url="
													+ this.snippet.channelId
													+ "&num="
													+ num
													+ "\">"
													+ "추가하기</a>"
													+ "<hr/></div></div>";
											document
													.getElementById("video-container1").innerHTML = html;
										});
					},
					error : function(xhr, textStatus) {
						console.log(xhr.responseText);
						alert("지금은 시스템 사정으로 인하여 요청하신 작업이 이루어지지 않았습니다.\n잠시후 다시 이용하세요.[2]");
						return;
					}
				});
	}

	//재생목록에서 갖고오기===================================================================================================
	document.getElementById("send2").onclick = function() {
		var num = document.getElementById("num2").value;
		var playlist = document.getElementById("playlist").value;
		if (playlist == "") {
			alert("재생목록 아이디를 입력하세요");
			$("#playlist").focus();
			return;
		}
		var xhr = new XMLHttpRequest();
		xhr
				.open(
						"get",
						"https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId="
								+ playlist
								+ "&key=AIzaSyBf7YiIAKxOXVlpZoeo2HRx5YlhjYrsW-I&maxResults=50",
						true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (this.readyState == 4) {
				var obj = JSON.parse(this.responseText);
				var playlistItems = obj.items;
				var html = "";
				if (playlistItems) {
					for (idx in obj.items) {
						var snippet = obj.items[idx].snippet;
						if (snippet.thumbnails != null) { //비공개동영상이 아닐경우만.
							//row가 한줄 한줄_img로 한 줄 한 줄 / xs가 제일 작은 사이즈(합이 12)
							html += "<div class=\"row\"><div align=\"left\" class=\"col-xs-1\">"
									+ idx
									+ "</div><div align=\"left\" class=\"col-xs-3\"><img src=\"" + snippet.thumbnails.medium.url + 
						"\" style=\"width:120px; height:70px\"></div><div align=\"left\" class=\"col-xs-8\">"
									+ '<br/>' + snippet.title + "<br/>";

							html += "동영상 추가하기 : <a href=\"/video/add?video_title="
									+ snippet.title
									+ "&image="
									+ snippet.thumbnails.medium.url
									+ "&video_id="
									+ snippet.resourceId.videoId
									+ "&channel_url="
									+ snippet.channelId
									+ "&num="
									+ num
									+ "\">"
									+ "추가하기</a>"
									+ "<hr/></div></div>";
						}

						document.getElementById("video-container2").innerHTML = html;
					}

				} else {
					$('#video-container2').html(
							'Sorry you have no uploaded videos');
				}
			}
		}
	}

	//채널에서 갖고오기===================================================================================================
	document.getElementById("send3").onclick = function() {
		var num = document.getElementById("num3").value;
		var channelId = document.getElementById("channelId").value;
		if (channelId == "") {
			alert("채널 아이디를 입력하세요");
			$("#channelId").focus();
			return;
		}
		var xhr = new XMLHttpRequest();
		xhr.open("get",
				"https://www.googleapis.com/youtube/v3/channels?part=contentDetails&id="
						+ channelId
						+ "&key=AIzaSyBf7YiIAKxOXVlpZoeo2HRx5YlhjYrsW-I", true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (this.readyState == 4) {
				var obj = JSON.parse(this.responseText); //채널아이디에서 playlistId값 얻어오기
				var playlistId = obj.items[0].contentDetails.relatedPlaylists.uploads;
				var xhr2 = new XMLHttpRequest();
				//console.log(playlistId);
				xhr2
						.open(
								"get",
								"https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId="
										+ playlistId
										+ "&maxResults=50&key=AIzaSyBf7YiIAKxOXVlpZoeo2HRx5YlhjYrsW-I",
								true);
				xhr2.send();
				xhr2.onreadystatechange = function() {
					if (this.readyState == 4) {
						var obj2 = JSON.parse(this.responseText);
						var playlistItems = obj2.items;
						var html = "";
						if (playlistItems) {
							for (idx in obj2.items) {
								var snippet = obj2.items[idx].snippet;
								if (snippet.thumbnails != null) { //비공개동영상이 아닐경우만.
									//row가 한줄 한줄_img로 한 줄 한 줄 / xs가 제일 작은 사이즈(합이 12)
									html += "<div class=\"row\"><div align=\"left\" class=\"col-xs-1\">"
											+ idx
											+ "</div><div align=\"left\" class=\"col-xs-3\"><img src=\"" + snippet.thumbnails.medium.url + 
								"\" style=\"width:120px; height:70px\"></div><div align=\"left\" class=\"col-xs-8\">"
											+ '<br/>' + snippet.title + "<br/>";

									html += "동영상 추가하기 : <a href=\"/video/add?video_title="
											+ snippet.title
											+ "&image="
											+ snippet.thumbnails.medium.url
											+ "&video_id="
											+ snippet.resourceId.videoId
											+ "&channel_url="
											+ snippet.channelId
											+ "&num="
											+ num
											+ "\">"
											+ "추가하기</a>"
											+ "<hr/></div></div>";
								}

								document.getElementById("video-container3").innerHTML = html;
							}

						} else {
							$('#video-container3').html(
									'Sorry you have no uploaded videos');
						}
					}
				}

			}
		}
	}
</script>
