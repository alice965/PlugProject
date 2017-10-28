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
			    <div id="chat" class="tab-pane fade in active">
			    	<!-- 채팅 영역 -->
						<div style="padding:3px; overflow-y:scroll; word-break: break-all; width: 95%; height: 52%; background-color: #D5D5D5; font-size:10pt;" align="left"  id="log">
						</div>
						<div id="cnt"></div>
						<input type="text" id="chat_input_field" style="width:95%;  margin-top: 5px; padding:4px;" placeholder="여기에 메시지를 입력하세요" />
			    </div>
		   </div>
	</div> 
   
	

</div> <!-- /row -->


<div style="background-color:yellow">
	<div id="na" class="col-md-3" style="border-radius: 2em; background-color:#66ff99;"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i>좋아요<br></div>

	<div id="book" class="col-md-3" style="border-radius: 2em; background-color:#ffcc66;"><i class="fa fa-star-o" aria-hidden="true"></i>북마크<br></div>

	<div id="na" class="col-md-3" style="border-radius: 2em; background-color:#ff0066;"><i class="fa fa-thumbs-o-down" aria-hidden="true"></i>싫어요<br></div>

	<div id="watingroom" class="col-md-3" style="background-color: #cc66ff; border-radius: 2em;">대기열넣을곳
	<br/></div>	
</div>



<script>
	//세션 아이디, 닉네임을 소켓으로 보내기
	window.onload =function(){
		
	}
	
	//채팅 영역 웹소켓 부분
	document.getElementById("chat_input_field").onchange=function(){
		if(this.value.length != 0){
			ws.send(this.value);
			this.value="";
		}
	}
	var ws = new WebSocket("ws://192.168.219.102/ws/chat");
	
	ws.onopen = function(e){
		document.getElementById("log").innerHTML += "<p><b>---DJ 채팅방에 오신 것을 환영합니다.----</b></p>";
		ws.send("userinfo,"+"${one.ID }"+","+ "${one.NICKNAME }" );
		var obj = JSON.parse(e.data);
		document.getElementById("cnt").innerHTML = "<small>[ " + obj.cnt+ " ] 명</small>";
	}
	ws.onmessage = function(a){
		console.log("a : "+a.data);
		var obj = JSON.parse(a.data);
			document.getElementById("cnt").innerHTML = "<small>[ " + obj.cnt+ " ] 명</small>";
		if(obj.mode == "join"){
			var html = obj.user + "채팅방 입장 <br>";
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
	$("#chattab").trigger("click");
</script>
