<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="w3-container w3-teal">
	<h4>친구추가</h4>
</div>    <br>
<form action="/friend/add" method="post">
   <b> ${data.nickname} </b>(${data.other}) 님을 친구 추가 하시겠습니까? <br><br>
   <input type="hidden" name="other" value="${data.other}">
    
<button class="w3-btn w3-blue" type="submit" onclick="window.open('/friend/list')">추가</button>
<button class="w3-btn w3-blue" type="button" onclick="javascript:window.close()">취소</button>
</form>

    
  
