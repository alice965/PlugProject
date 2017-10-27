<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="w3-container w3-teal">
	<h4>친구추가</h4>
</div>    <br>
   <b> ${data.OTHERNICK} </b>(${data.OTHER}) 님은 이미 등록된 친구입니다. <br>
   등록일 : ${data.REQDATE}
   <br><br>
    
<button class="w3-btn w3-blue" type="button" onclick="javascript:back()">친구 목록</button>
<button class="w3-btn w3-blue" type="button" onclick="javascript:window.close()">닫기</button>

 <script>
	function back() {
		opener.location.href="/friend/list?src=pop";
		window.close();
	}

</script>   
  
