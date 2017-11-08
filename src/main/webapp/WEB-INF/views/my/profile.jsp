<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="container" >
    	<div class="row">
			<div class="col-md-4" align="center">
					<div class="panel-body">
					<div class="row">
						<c:choose>
						<c:when test="${empty profile.URL }">
						<img id="pre" src="/profiles/default.png" class="img-thumbnail" alt="기본이미지"
						style="width: 70%; height: 30%; border-radius: 10%;" />
						</c:when>
						<c:otherwise>
						<img id="pre" src="${profile.URL }" alt="사용자프로필"
						style="width: 70%; height: 30%; border-radius: 10%;" />
						</c:otherwise>
						</c:choose>
			
						<form action="/my/pic_update" method="post" enctype="multipart/form-data">
						<input id="profile" type="file" name="profile" style="display: none"><br/>
						<button type="submit" class="sbt" id="sbt">적용</button>
						<button type="button" class="bt" onclick="javascript:location.reload()">취소</button>
						</form>
					
					</div>
					</div>
				</div>
				<div class="col-md-5">
					<h1>PROFILE</h1>
					<div class="panel-body">
					<div class="row">
						<div class="form-group">
						<b>EMAIL</b><br/>
						<input type="email" name="id" tabindex="1" 
						class="form-control" value="${auth.ID }" readonly id="id"/> <!-- readonly 혹은 disabled -> 수정 안됨. -->
						</div>
						<div class="form-group">
						<b>NICKNAME</b><br/>
						<input type="text" name="nickname" tabindex="2" 
						class="form-control" value="${auth.NICKNAME }" readonly required id="nickname"/>
						</div>
						
						<form action="/my/profile" method="post" autocomplete="off" id="form">
						<div class="form-group">
						<b>GENDER</b><br/>
						<input type="radio" name="gender" value="male" id="male"
						 <c:if test="${'male' eq profile.GENDER}">checked</c:if>> Male
 					    <input type="radio" name="gender" value="female" id="female"
 					     <c:if test="${'female' eq profile.GENDER}">checked</c:if>> Female
						<span id="gender_rst"> </span>
						</div>
						<div>
						<b>BIRTH</b><br/>
						<div class="form-group">
						<select name="birth" id="birth">
						<c:forEach var="i" begin="0" end="${2016-1900}">
  			    			<option value="${2016-i}" <c:if test="${2016-i eq profile.BIRTH }">selected</c:if>>${2016-i}</option>
							<!--  <c:if test="${2016-i eq birth }">selected</c:if> -->
						</c:forEach>
						</select>
						</div>
			 			<b>GENRE</b><br/>
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
						</div>
						<div class="form-group" align="center">
						<input type="submit" id="sbt" value="변경">
						<div align="right">
						<a href="/my/changepass" tabindex="5">비밀번호 변경 | </a>
						<a href="/my/out" tabindex="5">회원탈퇴</a>
						</div>
						</div>
						</form>	
						<small>업데이트 날짜 : <fmt:formatDate
													value="${profile.REGDATE}" pattern="yyyy.MM.dd" /></small>
					</div>
					</div>
			</div>
			</div>
</div>

<script>
	document.getElementById("male").onblur = function() {
		document.getElementById("gender_rst").innerHTML = document.getElementById("male").value;

	}
	document.getElementById("female").onblur = function() {
		document.getElementById("gender_rst").innerHTML = document.getElementById("female").value;

	}
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
	//프로필 이미지 클릭시 파일 선택 창 띄우도록
	document.getElementById("pre").onclick = function() {
		document.getElementById("profile").click();
	}
	document.getElementById("profile").onchange = function() {
		var reader = new FileReader();
		reader.onload = function(e) {
			console.log(e.target.result);
			document.getElementById("pre").src = e.target.result;
		}
		reader.readAsDataURL(this.files[0]);
	}

</script>


