<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="sub-top">
	<h2 class="text-center">My Booth</h2>
</div>

<div align="center">
	<div style="width: 90%; line-height: 30px;">
		<hr />
		<div class="w3-card-4">
  <div class="w3-container w3-blue">
    <h3>부스 수정하기</h3> 
  </div>
  <br>
  <form id="form"  style="text-align:left" class="w3-container" action="/myplay/edit/${map.NUM}" method="post" enctype="multipart/form-data">
  	<!-- 제목 수정 -->
    <p>      
	    <label class="w3-text-blue"><b>방 제목</b></label><small>&nbsp; &nbsp; * 20자 까지만 입력할 수 있습니다.</small>
	    <c:choose>
	    	<c:when test="${map.TITLE eq null }">
				<input class="w3-input w3-border w3-sand txtfilter"  type="text" name="title" maxlength="20" />
			</c:when>
			<c:otherwise>
				<input class="w3-input w3-border w3-sand txtfilter" type="text" name="title" value="${map.TITLE}"/>
			</c:otherwise>
	    </c:choose>
    </p>
    <!-- 방 설명 수정 -->
    <p> 
	    <label class="w3-text-blue"><b>설명</b></label><small>&nbsp; &nbsp; * 35자 까지만 입력할 수 있습니다.</small>
    	<c:choose>
	    	<c:when test="${map.CONTENT eq null }">
				<input class="w3-input w3-border w3-sand txtfilter"   type="content" name="content" maxlength="35"/>
			</c:when>
			<c:otherwise>
				<input class="w3-input w3-border w3-sand txtfilter" type="text" name="content"  maxlength="35" value="${map.CONTENT}"/>
			</c:otherwise>
  	  </c:choose>     
    </p>
    
    <!-- 선호 장르 수정 -->
 	<p>
 	<label class="w3-text-blue"><b>장르</b></label> <br>
 			<label><input class="w3-check" type="checkbox" name="checkAll" id="checkAll">전체 선택 </label><small>&nbsp;&nbsp; * 하나 이상의 장르를 선택해주세요</small><br>
			<label><input class="w3-check gr" type="checkbox" name="genre" value="하우스/클럽">하우스/클럽 </label>
			<label><input class="w3-check gr" type="checkbox" name="genre" value="팝/재즈">팝/재즈 </label>
			<label><input class="w3-check gr" type="checkbox" name="genre" value="발라드">발라드 </label>
			<label><input class="w3-check gr" type="checkbox" name="genre" value="댄스">댄스 </label>
			<label><input class="w3-check gr" type="checkbox" name="genre" value="랩/힙합">랩/힙합 </label>
			<label><input class="w3-check gr" type="checkbox" name="genre" value="RnB/Soul">RnB/Soul </label>
			<label><input class="w3-check gr" type="checkbox" name="genre" value="인디음악">인디음악 </label>
			<label><input class="w3-check gr" type="checkbox" name="genre" value="일렉트로니카">일렉트로니카 </label>
			<label><input class="w3-check gr" type="checkbox" name="genre" value="락/메탈">락/메탈 </label>
			<label><input class="w3-check gr" type="checkbox" name="genre" value="클래식/기타">클래식/기타</label>
			<br>
			
			<hr>
		<!-- 부스 대표 이미지 업로드-->
		<label class="w3-text-blue"><b>부스 이미지</b></label><br>
			<!-- 미리보기 영역 -->
			<img id="pre" src="${map.URL}" alt="기본이미지" style="width: 300px; height: 300px; border-radius: 10%; margin-bottom: 10px;" /> 
			<input id="boothpic" type="file" name="boothpic" ><br/> <!-- 파라미터boothpic -->
			<input type="hidden" name="url"  value="${map.URL}"><br/> <!-- 파라미터boothpic -->
		
		
		<!--폼 버튼 -->
		<input type="button" class="w3-btn w3-blue" id="submitbtn" value="수정"> <!-- type="submit" -->
		<button class="w3-btn w3-blue" type="button" onclick="javascript:location.href='/myplay/list'">취소</button>
	</form>
 
	</div>
</div>
<script>
//페이지 오픈시 체크박스 값 세팅
$(document).ready(function() {
	$(".gr").each(function() {
		<c:forEach var="obj" items="${arrGenre}">
		if("${obj}".trim()==$(this).val()){
			$(this).prop("checked", true);
		}
		</c:forEach>
	})
});
//전체선택 체크박스 클릭시 선택과 반전 상태
$("#checkAll").click(function(){
	if($("#checkAll").is(":checked")){
		$(".gr").prop("checked", true);
	}else{
		$(".gr").prop("checked", false);
	}
});
//체크박스 하나라도 해제할 경우, 전체선택 체크박스 선택 해제
//전체 체크박스의 갯수를 구한 다음, 체크 상태가 전체 체크박스 갯수와 다를 경우 선택 해제
var size=$(".gr").length;
$(".gr").click(function(){
	if($("input[name='genre']:checked").length==size){
		$("#checkAll").prop("checked", true);		
	}else{
		$("#checkAll").prop("checked", false);		
	}
});
//전송버튼 클릭시 이벤트
$("#submitbtn").click(function() {
	var chk=$(".gr:checked").length;
	if(chk==0){
		alert("장르가 선택되지 않았습니다. \n 하나 이상의 장르를 선택해주세요");}
	else{
		$("#form").submit();
	}
	
});

	//파일처리 관련 스크립트
	document.getElementById("pre").onclick = function() {
		document.getElementById("boothpic").click();
	}
	document.getElementById("boothpic").onchange = function() {
		var reader = new FileReader();
		reader.onload = function(e) {
			console.log(e.target.result);
			document.getElementById("pre").src = e.target.result;
		}
		reader.readAsDataURL(this.files[0]);
	}

</script>