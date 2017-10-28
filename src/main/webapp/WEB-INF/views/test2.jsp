<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
    	<div class="row">
			<div class="col-md-6 col-md-offset-3">
			<h1>YOUTUBE CHANNEL</h1>
			<h4><b>사용하는 법</b><br/></h4>
			<h5>1. 원하는 채널에 들어갑니다.<br/> 
			2. 주소창에서 https://www.youtube.com/channel/ 뒤에 있는 아이디값을 복사합니다.<br/>
			3. 아래 입력 창에 붙여넣기 합니다.<br/>
			※최대 50개의 최신 동영상을 불러올 수 있습니다.</h5>
			<input type="text" id="channelId" placeholder="채널 아이디 입력..">
			<button id="send">재생목록 뽑기</button>
			<button id="prev-button">◀</button>|<button id="next-button">▶</button>
			<hr/>		
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-12" id="video-container">
						</div>
					</div>
				</div>
			</div>

		</div>
</div>
<hr/>


<script>
var playlistId;

document.getElementById("send").onclick = function() {
	var channelId = document.getElementById("channelId").value;
	var xhr = new XMLHttpRequest();
	xhr.open("get", "https://www.googleapis.com/youtube/v3/channels?part=contentDetails&id="+channelId+"&key=AIzaSyBf7YiIAKxOXVlpZoeo2HRx5YlhjYrsW-I", true);
	xhr.send();
	xhr.onreadystatechange = function(){
		if(this.readyState==4){
			var obj = JSON.parse(this.responseText);
			playlistId = obj.items[0].contentDetails.relatedPlaylists.uploads; 
			window.alert(playlistId);
			
			requestVideoPlaylist(playlistId);
		}
	}
}
	
function requestVideoPlaylist(playlistId) {	
	var xhr2 = new XMLHttpRequest();
	xhr2.open("get", "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId="+ playlistId + 
			"&maxResults=50&key=AIzaSyBf7YiIAKxOXVlpZoeo2HRx5YlhjYrsW-I", true);
	xhr2.send();
	xhr2.onreadystatechange = function(){
		if(this.readyState==4){
			var obj2 = JSON.parse(this.responseText);	   			
		    var playlistItems = obj2.items;
		    var html = "";
		    if (playlistItems) {
				for(idx in obj2.items) {
					var snippet = obj2.items[idx].snippet;
					//window.alert(obj2.items[idx]);
					//window.alert(snippet.title);
						html += idx + ".노래 제목 : " + snippet.title + "<br/>";
						//html += "채널 아이디 : " + snippet.channelId + "<br/>";
						html += "<img src=\"" + snippet.thumbnails.medium.url + "\" style=\"width:300px; height:170px\"><br/>";
						html += "동영상 보러가기 : <a href=\"https://www.youtube.com/watch?v=" + snippet.resourceId.videoId + "\">" + "보러가기</a>" + "<hr/>";
				}	
				document.getElementById("video-container").innerHTML = html;
		     // $.each(playlistItems, function(index, item) {//for문인듯..
		     //   displayResult(item.snippet);
		     // });
		    } else {
		      $('#video-container').html('Sorry you have no uploaded videos');
		    }
		}
	}
}


</script>

<!-- 
document.getElementById("send").onclick = function() {
	var channelId = document.getElementById("channelId").value;
	var xhr = new XMLHttpRequest();
	var target;
	xhr.open("get", "https://www.googleapis.com/youtube/v3/channels?part=contentDetails&id="+channelId+"&key=AIzaSyBf7YiIAKxOXVlpZoeo2HRx5YlhjYrsW-I", true);
	xhr.send();
	xhr.onreadystatechange = function(){
		if(this.readyState==4){
			var obj = JSON.parse(this.responseText);
			target = obj.items[0].contentDetails.relatedPlaylists.uploads; 
			window.alert(target);
		}
			 //target에 변경한 channelId를 집어넣으면 밑에서 재생목록 뽑을 수 있음.
			var xhr2 = new XMLHttpRequest();
			xhr2.open("get", "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId="+ target + 
					"&key=AIzaSyBf7YiIAKxOXVlpZoeo2HRx5YlhjYrsW-I", true);
			xhr2.send();
			xhr2.onreadystatechange = function(){
				if(this.readyState==4){
					var obj2 = JSON.parse(this.responseText);
					var html = "";
					for(idx in obj2.items) {
						var snippet = obj2.items[idx].snippet;
						//window.alert(obj2.items[idx]);
						//window.alert(snippet.title);
							html += "노래 제목 : " + snippet.title + "<br/>";
							//html += "채널 아이디 : " + snippet.channelId + "<br/>";
							html += "<img src=\"" + snippet.thumbnails.medium.url + "\" style=\"width:300px; height:170px\"><br/>";
							html += "동영상 보러가기 : <a href=\"https://www.youtube.com/watch?v=" + snippet.resourceId.videoId + "\">" + "보러가기</a>" + "<hr/>";
					}
					document.getElementById("rst").innerHTML = html;
					console.log(obj2);
				}
			}	
		}
	} 
 -->