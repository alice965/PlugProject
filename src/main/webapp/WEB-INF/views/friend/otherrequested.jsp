<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<div class="w3-container w3-teal">
	<h4>친구추가</h4>
</div>
<div class="container" style="text-align:center">
<div class="w3-container"> <br>
		<b>상대방이 이미 친구 추가 신청을 하였습니다.</b> <br>
받은 친구 요청 목록에서 친구 신청을 수락하시면 친구로 추가됩니다.
<br>

</div>

<button class="w3-btn w3-blue" type="submit"  onclick="javascript:back()">받은 친구 요청 목록</button>
<button class="w3-btn w3-blue" type="button" onclick="javascript:window.close()">닫기</button>
</div>
<script>
	function back() {
		opener.location.href="/friend/list?src=otherrequested";
		window.close();
	}

</script>