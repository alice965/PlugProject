<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form name="form1" method="post" onSubmit="return false;">
		<input type="text" id="search_box"><button onClick="fnGetList();">가져오기</button>
</form>
<div id="get_view"></div>


<script>
function fnGetList(){
	var $getval = $("#search_box").val();
	if($getval==""){
		alert("검색어를 입력하세요.");
		$("#search_box").focus();
		return;
	}
	$("#video-container1").empty();

var TargetUrl = "https://www.googleapis.com/youtube/v3/search?part=snippet&order=relevance"
	+ "&q="+ encodeURIComponent($getval) +"&key=AIzaSyBf7YiIAKxOXVlpZoeo2HRx5YlhjYrsW-I&maxResults=50";

$.ajax({
	type: "POST",
	url: TargetUrl,
	dataType: "jsonp",
	success: function(jdata) {
		//console.log(jdata);
		var html = "";
		$(jdata.items).each(function(i){ //items반복문으로 돔.
				html += "<div class=\"row\"><div align=\"left\" class=\"col-xs-1\">"
					+ i
					+ "</div><div align=\"left\" class=\"col-xs-3\"><img src=\"" + this.snippet.thumbnails.medium.url + 
		"\" style=\"width:120px; height:70px\"></div><div align=\"left\" class=\"col-xs-8\">"
					+ '<br/>' + this.snippet.title + "<br/>";
				
					html += "동영상 추가하기 : <a href=\"/video/add?video_title="
						+ this.snippet.title
						+ "&image="
						+ this.snippet.thumbnails.medium.url
						+ "&video_id="
						+ this.id.videoId
						+ "&channel_url="
						+ this.snippet.channelId
						//+ "&num="
						//+ num
						+ "\">"
						+ "추가하기</a>"
						+ "<hr/></div></div>";	
					document.getElementById("get_view").innerHTML = html;
			});
		},
		error:function(xhr, textStatus) {
			console.log(xhr.responseText);
			alert("지금은 시스템 사정으로 인하여 요청하신 작업이 이루어지지 않았습니다.\n잠시후 다시 이용하세요.[2]");
			return;
		}
	});
}

</script>