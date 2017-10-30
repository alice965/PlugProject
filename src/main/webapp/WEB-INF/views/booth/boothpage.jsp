<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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

		
		<!-- 재생목록 -->
		<div id="plist" class="tab-pane fade in active" >
		<div id="playlist" style="padding:3px; overflow-y:scroll; word-break: break-all; width: 95%; height: 52%; background-color: #D5D5D5; font-size:10pt;" align="center">
						
			<div class="tab-content">
			<div id="playlist" class="tab-pane fade in active">
			    <div class="dropdown" >
                <div class="dropdown-toggle" data-toggle="dropdown">
                	<h4><b>재생목록 추가하기<span class="caret"></span></b></h4>
                </div>
                
                <ul class="dropdown-menu" style="left:33%;">
                <li><a href="#" class="popFriend">제목으로 갖고오기</a
                ><input type="hidden"></li>
                <li><a href="/video/playlist/${one.NUM }" class="popMemo">채널에서 갖고오기</a><input type="hidden"></li>
                <li><a href="#" class="popMemo">재생목록 갖고오기</a><input type="hidden"></li>
                </ul>
                </div>
            </div>
            </div>
              <hr/>  
                
                <!-- 재생목록 갖고오기 : 재생목록 없을 경우 -->
				<c:if test="${!empty nolist }"> 
				<b style="color: red">재생목록이 없습니다.</b><br/>
				</c:if>
				<c:if test="${!empty video }">
				<c:forEach var="obj" items="${video }">
				<div align="left" class="col-lg-3">
				<img src="${obj.IMAGE}"  style="width:80px; height:55px"> 	
				</div>
				<div style="width:380px; height:55px" align="right">	
						${obj.VIDEO_TITLE} <br/>
						추가한 사람 : ${obj.ADD_ID } (${obj.ADD_NICKNAME }) <br/>
						추가한 날짜 : <fmt:formatDate value="${obj.ADDDATE}" pattern="yyyy.MM.dd" />
						  <br/>
				</div>
						<hr/>
				</c:forEach>
				</c:if>
				<!-- 재생목록 갖고오기 : 재생목록 있을 경우 -->
		</div>
		</div>
	</div>		
	</div> <!-- 컨테이너 종료 태그 -->
</div> <!-- row종료 태그 -->
   

<!-- 하단 좋아요 싫어요 부분 -->
<div style="background-color:yellow">
	<div id="like" class="col-md-3" style="border-radius: 2em; background-color:#66ff99;"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i>좋아요<br></div>
	<div id="book" class="col-md-3" style="border-radius: 2em; background-color:#ffcc66;"><i class="fa fa-star-o" aria-hidden="true"></i>북마크<br></div>
	<div id="dislike" class="col-md-3" style="border-radius: 2em; background-color:#ff0066;"><i class="fa fa-thumbs-o-down" aria-hidden="true"></i>싫어요<br></div>
	<div id="watingroom" class="col-md-3" style="background-color: #cc66ff; border-radius: 2em;">대기열넣을곳
	<br/></div>	
</div>
	
<script>
/////// 채팅 영역 스크립트///////
	
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
