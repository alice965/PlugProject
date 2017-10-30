<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="container">
    	<div class="row">
			<div class="col-md-5" align="center">
			<h1>YOUTUBE PLAYLIST</h1>
			<h4><b>����ϴ� ��</b><br/></h4>
			<h5>1. ���ϴ� ä���� �����Ͽ� ���ϴ�.<br/> 
			2. �������� src���� �����մϴ�.<br/>
			3. �Ʒ� �Է� â�� �ٿ��ֱ� �մϴ�.<br/>
			���ִ� 50���� �ֽ� �������� �ҷ��� �� �ֽ��ϴ�.</h5>
			<input type="text" id="playlist" placeholder="������ ���̵� �Է�..">
			<!-- �濡�� �߰��� ���� �ƴ� ��쵵 �����ؾ���.. �� ��ȣ�� �˾ƿͼ� �߰��ϴ� ���.. c:if �±� ����ϱ� -->
			<input type="text" id="num" placeholder="${num }" value="${num }">
			<button id="send">������ �̱�</button>
			<h3>������ ������</h3>
			<div class="col-lg-8" id="video-container">
			</div>
			<hr/>		
			</div>
			<div class="col-md-7">
			<h3>������ ���</h3>
			<button id="play">������ ����ϱ�</button>
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
						+ '<br/>' + idx + ". " + snippet.title + "<br/><br/>" + "ä�� ���̵� : " + snippet.channelId + "<br/><hr/></div>";
				
				html += "������ �߰��ϱ� : <a href=\"/video/add?video_title=" + snippet.title
				+ "&video_id=" + snippet.resourceId.videoId 
				+ "&channel_url=" +  snippet.channelId 
				+ "&num=" + num + "\">" + "�߰��ϱ�</a>" + "<hr/>";
				}	
				
				document.getElementById("video-container").innerHTML = html;
		    } else {
		      $('#video-container').html('Sorry you have no uploaded videos');
		    }
	}
	}	
}

</script>