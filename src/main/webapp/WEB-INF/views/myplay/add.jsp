<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="sub-top">
		<h2 class="text-center">나의 플레이 리스트</h2>
	</div>
<div class="container">
	
	<div align="center">
		<div style="width: 90%; line-height: 30px;">
			<hr />
			<div class="w3-card-4">
	  <div class="w3-container w3-blue">
	    <h3>플레이 리스트 만들기</h3> 
	  </div>
	  <br>
	  <form style="text-align:left" class="w3-container" id="form"  action="/myplay/add" method="post" enctype="multipart/form-data">
	    <p>      
	    <label class="w3-text-blue"><b>방 제목</b></label>
	    <input class="w3-input w3-border w3-sand" name="title" type="text"></p>
	    <p>      
	    <label class="w3-text-blue"><b>설명</b></label>
	    <input class="w3-input w3-border w3-sand" name="content" type="text"></p>
	 	<p>
	 	
	 	<!-- 장르 선택 -->
	 	<label class="w3-text-blue"><b>장르</b></label> 
		<div style="background-color:white; text-align:left;">
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
		</div>
		<hr>
		<!-- 부스 대표 이미지 업로드-->
		<label class="w3-text-blue"><b>부스 이미지</b></label><br>
			<!-- 미리보기 영역 -->
			<img id="pre" src="/images/booth/default.jpg" alt="기본이미지" style="width: 300px; height: 300px; border-radius: 10%; margin-bottom: 10px;" /> 
			<input id="boothpic" type="file" name="boothpic" ><br/> <!-- 파라미터boothpic -->
		
		
		<!--폼 버튼 -->
		<input type="button" class="w3-btn w3-blue" id="submitbtn" value="등록"> <!-- type="submit" -->
		<button class="w3-btn w3-blue" type="button" onclick="javascript:location.href='/myplay/list'">취소</button>
	
	</form>	<br /><br />
	</div>
	</div>
</div> 
</div>
<!-- container -->

<script>
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