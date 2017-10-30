<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="container">
    	<div class="row">
			<div class="col-md-5" align="center">
			<h1>YOUTUBE PLAYLIST</h1>
			<h4><b>사용하는 법</b><br/></h4>
			<h5>1. 원하는 채널의 재생목록에 들어갑니다.<br/> 
			2. 재생목록의 src값을 복사합니다.<br/>
			3. 아래 입력 창에 붙여넣기 합니다.<br/>
			※최대 50개의 최신 동영상을 불러올 수 있습니다.</h5>
			<input type="text" id="playlist" placeholder="재생목록 아이디 입력..">
			<!-- 방에서 추가한 것이 아닐 경우도 생각해야함.. 방 번호를 알아와서 추가하는 경우.. c:if 태그 사용하기 -->
			<input type="text" id="num" placeholder="${num }" value="${num }">
			<button id="send">재생목록 뽑기</button>
			<h3>가져온 재생목록</h3>
			<div class="col-lg-8" id="video-container">
			</div>
			<hr/>		
			</div>
			<div class="col-md-7">
			<h3>동영상 재생</h3>
			<button id="play">동영상 재생하기</button>
				<div class="panel-body">
					<div class="row">
					</div>
				</div>
			</div>
			</div>
</div>


<script>
var playlistId;
var count;
var num;

document.getElementById("send").onclick = function() {
	num = document.getElementById("num").value;
	var playlist = document.getElementById("playlist").value;
	var xhr = new XMLHttpRequest();
	xhr.open("get", "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId="+playlist+
			"&key=AIzaSyBf7YiIAKxOXVlpZoeo2HRx5YlhjYrsW-I&maxResults=50", true);
	xhr.send();
	xhr.onreadystatechange = function(){
		if(this.readyState==4){
			var obj = JSON.parse(this.responseText);	   			
		    var playlistItems = obj.items;
		    var html = "";
		    if (playlistItems) {
				for(idx in obj.items) {
					var snippet = obj.items[idx].snippet;
						html +=  "<div align=\"left\" class=\"col-lg-5\"><img src=\"" + snippet.thumbnails.medium.url + 
						"\" style=\"width:100px; height:75px\"></div><div style=\"width:385px; height:130px\" align=\"right\">"
						+ '<br/>' + idx + ". " + snippet.title + "<br/><br/>" + "채널 아이디 : " + snippet.channelId + "<br/><hr/></div>";
				
				html += "동영상 추가하기 : <a href=\"/video/add?video_title=" + snippet.title
				+ "&video_id=" + snippet.resourceId.videoId 
				+ "&channel_url=" +  snippet.channelId 
				+ "&num=" + num + "\">" + "추가하기</a>" + "<hr/>";
				}	
				
				document.getElementById("video-container").innerHTML = html;
		    } else {
		      $('#video-container').html('Sorry you have no uploaded videos');
		    }
	}
	}	
}

</script>