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
	<div class="col-md-8" style="min-height: 65%; background-color: black;">
		<p>영상이 들어갈 위치</p>
	</div>

		<!-- 오른쪽 영역 (채팅과 재생목록 -->
	<div class="col-md-4"  	style="min-height: 40%; min-width: 20%; background-color: #6699ff; border-radius: 2em;">
		
			<!-- 탭 영역 -->
		  <ul class="nav nav-tabs">
			    <li class="active"><a data-toggle="tab" href="#chat" id="chattab">채팅창</a></li>
			    <li><a data-toggle="tab" href="#people">채팅참여자</a></li>
			    <li><a data-toggle="tab" href="#plist">재생목록</a></li>
		  </ul>
		
		<!-- 탭  클릭시 펼쳐지는 페이지 -->
		  <div class="tab-content">
	    	<!-- 채팅 영역 -->
			    <div id="chat" class="tab-pane fade in active">
						<div id="log" style="padding:3px; overflow-y:scroll; word-break: break-all; width: 95%; height: 52%; background-color: #D5D5D5; font-size:10pt;" align="left">
						</div>
						<div id="cnt"></div>
						<input type="text" id="chat_input_field" style="width:95%;  margin-top: 5px; padding:4px;" placeholder="여기에 메시지를 입력하세요" />
			    </div> <!-- /chat -->
			    
			 <!-- 재생 목록 -->
			    <div id="plist" class="tab-pane fade in active">
						<div id="playlist" style="padding:3px; overflow-y:scroll; word-break: break-all; width: 95%; height: 52%; background-color: #D5D5D5; font-size:10pt;" align="left">
							<input type="text" id="search_box" style="width:95%;  margin-top: 5px; padding:4px;" placeholder="가수나 곡명을 입력해서 재생목록에 추가해보세요" />
							<div id="get_view"></div>
							<div id="nav_view"></div>
							
							<div id="selectList">asdf</div>
							<hr>
							<!-- 재생중인 곡 목록 출력 -->
							<i class="fa fa-refresh fa-spin" style="font-size:14px"></i><b>Dua Lipa - Be The One (Official Music Video)</b> <br>
							<i class="fa fa-angle-right" style="font-size:14px;color:grey"></i>Dua Lipa - Begging (Album Visual)
						</div>
			    </div> <!-- /chat -->
		   </div><!-- 탭 콘텐트 클래스 끝 -->
	</div> <!-- 오른쪽 영역 태그 끝 -->
   
	

</div> <!-- /row -->

<!-- 하단 좋아요 싫어요 부분 -->
<div style="background-color:yellow">
	<div id="like" class="col-md-3" style="border-radius: 2em; background-color:#66ff99;"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i>좋아요<br></div>
	<div id="book" class="col-md-3" style="border-radius: 2em; background-color:#ffcc66;"><i class="fa fa-star-o" aria-hidden="true"></i>북마크<br></div>
	<div id="dislike" class="col-md-3" style="border-radius: 2em; background-color:#ff0066;"><i class="fa fa-thumbs-o-down" aria-hidden="true"></i>싫어요<br></div>
	<div id="watingroom" class="col-md-3" style="background-color: #cc66ff; border-radius: 2em;">대기열넣을곳
	<br/></div>	
</div>



<script>
///////재생목록 탭 영역 스크립트///////
	
	//검색 인풋박스 키업하면 리스트 가져옴
	$( "#search_box" ).keyup(function() {
		fnGetList()
	});
	
	//리스트 가져오는 스크립트
	function fnGetList(sGetToken){
	var $getval = $("#search_box").val();
	if($getval==""){
		alert("검색어를 입력하세요.");
		$("#search_box").focus();
		return;
	}
	$("#get_view").empty();
	$("#nav_view").empty()


	var sTargetUrl = "https://www.googleapis.com/youtube/v3/search?part=snippet&order=relevance"
						+ "&q="+ encodeURIComponent($getval) +"&key=AIzaSyBf7YiIAKxOXVlpZoeo2HRx5YlhjYrsW-I";
	if(sGetToken){
		sTargetUrl += "&pageToken="+sGetToken;
	}
	$.ajax({
		type: "POST",
		url: sTargetUrl,
		dataType: "jsonp",
		success: function(jdata) {
			console.log(jdata);

			$(jdata.items).each(function(i){
				//console.log(this.snippet.channelId);
				$("#get_view").append("<p class='box'><a href='https://youtu.be/"
						+this.id.videoId+"' target='_blank'><img src='"
						+this.snippet.thumbnails.default.url+"'><span><p>"
						+this.snippet.title+"</p></span></a></p>"
				+"<a href=\"/video/add?video_title=" + this.snippet.title
				+ "&video_id=" + this.id.videoId
				+ "&channel_url=\"test\">" + "목록에 추가</a>");
				// +  this.snippet.channelId +
				////////
			}).promise().done(function(){
				if(jdata.prevPageToken){
					$("#nav_view").append("<a href='javascript:fnGetList(\""
							+jdata.prevPageToken+"\");'><이전페이지></a>");
				}
				if(jdata.nextPageToken){
					$("#nav_view").append("<a href='javascript:fnGetList(\""
							+jdata.nextPageToken+"\");'><다음페이지></a>");
				}
			});
		},
		error:function(xhr, textStatus) {
			console.log(xhr.responseText);
			alert("지금은 시스템 사정으로 인하여 요청하신 작업이 이루어지지 않았습니다.\n잠시후 다시 이용하세요.[2]");
			return;
		}
	});
}
//리스트 가져오는 스크립트 끝!	
	
	
/////// 채팅 영역 스크립트///////
	
	//채팅 영역 웹소켓 부분
	document.getElementById("chat_input_field").onchange=function(){
		if(this.value.length != 0){
			ws.send(this.value);
			this.value="";
		}
	}
	var ws = new WebSocket("ws://192.168.10.82/ws/chat");
	
	ws.onopen = function(e){
		document.getElementById("log").innerHTML += "<p><b>---DJ 채팅방에 오신 것을 환영합니다.----</b></p>";
		//ws.send("userinfo,"+"${one.ID }"+","+ "${one.NICKNAME }" );
		var obj = JSON.parse(e.data);
		document.getElementById("cnt").innerHTML = "<small>[ " + obj.cnt+ " ] 명</small>";
	}
	ws.onmessage = function(a){
		console.log("a : "+a.data);
		var obj = JSON.parse(a.data);
			document.getElementById("cnt").innerHTML = "<small>[ " + obj.cnt+ " ] 명</small>";
		if(obj.mode == "join"){
			var html = obj.user + "님께서 채팅방에 입장하셨습니다. <br>";
		}else if(obj.mode =="exit"){
			var html = "<b>[ "+obj.user+ "]</b>님이 퇴장하셨습니다.<br>" ;
		}else if(obj.mode=="info"){
			
		}
		else{
			var html = "<b>[ "+obj.sender+ "]</b>"+obj.msg +"<br>" ;
		}
		
		document.getElementById("log").innerHTML += html;
		document.getElementById("log").scrollTop = document.getElementById("log").scrollHeight;
		
	}
	//페이지 오픈시 채팅탭이 클릭된 상태로 만들기
	$("#chattab").trigger("click");
</script>
