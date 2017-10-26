<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<html>
<div style="background-color: #6699ff;">
	<div id="booth_name">부스이름이 들어갈 곳</div>
	<div id="booth_host">부스의 호스트이름이 들어갈 곳</div>
</div>




<div class="col-md-9" style="min-height: 65%; background-color: black;">

	<p>영상이 들어갈 위치</p>
</div>
<p></p>
<div class="col-md-3" id="chat_message"
	style="min-height: 65%; min-width: 300px; background-color: #6699ff; border-radius: 2em;">
	<p>채팅이 들어갈 위치</p>


	<div id="chat_input" class="" style="min-width: 300px;">
		<form class="chat_input_form" onsubmit="return false">
			<input id="chat_input_field" type="text" value="" autocomplete="off"
				placeholder="여기에 메시지를 입력하세요" maxlength="256">
		</form>
	</div>

</div>

<div style="background-color:yellow">
	<div id="na" class="col-md-3" style="border-radius: 2em; background-color:#66ff99;">좋아요<br></div>

	<div id="book" class="col-md-3" style="border-radius: 2em; background-color:#ffcc66;">북마크<br></div>

	<div id="na" class="col-md-3" style="border-radius: 2em; background-color:#ff0066;">싫어요<br></div>

	<div id="watingroom" class="col-md-3" style="background-color: #cc66ff; border-radius: 2em;">대기열넣을곳
	<br/></div>	
</div>

</html>

<script>
	//var url=location.hostname;
	//var ws = new WebSocket("ws://"+url+"/ws/booth");
	var ws = new WebSocket("ws://192.168.219.103/ws/booth");
	ws.onopen = function(e) {
		var obj = JSON.parse(e.data);
		console.log(obj);
	}
</script>