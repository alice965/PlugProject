<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form name="form1" method="post" onSubmit="return false;">
		<input type="text" id="search_box"><button onClick="fnGetList();">가져오기</button>
	</form>
	<div id="get_view"></div>
	<div id="nav_view"></div>


<script>

$( "#search_box" ).keyup(function() {
	fnGetList()
	});


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
				$("#get_view").append("<p class='box'><a href='https://youtu.be/"+this.id.videoId+"' target='_blank'><img src='"+this.snippet.thumbnails.default.url+"'><span>"+this.snippet.title+"</span></a></p>");
			}).promise().done(function(){
				if(jdata.prevPageToken){
					$("#nav_view").append("<a href='javascript:fnGetList(\""+jdata.prevPageToken+"\");'><이전페이지></a>");
				}
				if(jdata.nextPageToken){
					$("#nav_view").append("<a href='javascript:fnGetList(\""+jdata.nextPageToken+"\");'><다음페이지></a>");
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

</script>