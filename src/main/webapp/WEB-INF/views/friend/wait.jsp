<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<div class="w3-container w3-teal">
	<h4>친구추가</h4>
</div>
<div class="w3-container"> <br>
친구 신청이 승인 대기중입니다.<br><br>
</div>

<button class="w3-btn w3-blue" type="submit"  onclick="javascript:back()">목록으로</button>
<button class="w3-btn w3-blue" type="button" onclick="javascript:window.close()">취소</button>
<script>
	function back() {
		opener.location.href="/friend/list?src=wait";
		window.close();
	}

</script>