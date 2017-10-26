<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>JSON 처리</h2>
<hr/>
<button id="send">AJAX 요청</button>
<input type="text" id="url">
<div id="rst">

</div>
<script>

document.getElementById("send").onclick = function() {
	var url = document.getElementById("url").value;
	var xhr2 = new XMLHttpRequest();
	var target = "";
	xhr2.open("get", "https://www.googleapis.com/youtube/v3/channels?part=contentDetails&id="+url+"&key=AIzaSyBf7YiIAKxOXVlpZoeo2HRx5YlhjYrsW-I", true);
	xhr2.send();
	xhr2.onreadystatechange = function(){
		if(this.readyState==4){
			var obj2 = JSON.parse(this.responseText);
			console.log(obj2);
			//target = obj.items.contentDetails.relatedPlaylists.uploads;
			//window.alert(target);
		}
	}
	
	//var target = document.getElementById("url").value;
	//window.alert(target);
	var xhr = new XMLHttpRequest();
	xhr.open("get", "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=UURzzwLpLiUNIs6YOPe33eMg&key=AIzaSyBf7YiIAKxOXVlpZoeo2HRx5YlhjYrsW-I", true);
	xhr.send();
	xhr.onreadystatechange = function(){
		if(this.readyState==4){
			var obj = JSON.parse(this.responseText);
			var html = "";
			for(idx in obj.items) {
				var snippet = obj.items[idx].snippet;
				//window.alert(obj.items[idx]);
				//window.alert(snippet.title);
					html += "제목 : " + snippet.title + "<br/>";
					html += "채널 아이디 : " + snippet.channelId + "<br/>";
					html += "<img src=\"" + snippet.thumbnails.medium.url + "\" style=\"width:300px; height:170px\"><br/>";
					html += "동영상 보러가기 : <a href=\"https://www.youtube.com/watch?v=" + snippet.resourceId.videoId + "\">" + "보러가기</a>" + "<hr/>";
			}
			document.getElementById("rst").innerHTML = html;
			console.log(obj);
		}
	}
}
</script>