<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="w3-container w3-teal">
	<h4>친구추가</h4>
</div>    <br>
<div class="container" style="text-align:center">
<c:choose>
	<c:when test="${sid eq  data.OTHER}">
		${data.ONENICK} </b>(${data.ONE}) 님은<br> 이미 등록된 친구입니다. <br>
			   등록일 : ${data.REQDATE}
	</c:when>
	<c:otherwise>
		${data.OTHERNICK} </b>(${data.OTHER}) 님은<br> 이미 등록된 친구입니다. <br>
			   등록일 : ${data.REQDATE}
	</c:otherwise>
</c:choose>
<br>    <br> 
<button class="w3-btn w3-blue" type="button" onclick="javascript:back()">친구 목록</button>
<button class="w3-btn w3-blue" type="button" onclick="javascript:window.close()">닫기</button>

</div>

 <script>
	function back() {
		opener.location.href="/friend/list?src=exist";
		window.close();
	}

</script>   
  
