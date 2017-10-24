<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container" >
    	<div class="row">
			<div class="col-md-4" align="center">
					<div class="panel-body">
					<div class="row">
					
						<div style="height: 200px; width: 200px;">
						<img id="pre" src="/profiles/default.png" class="img-thumbnail" alt="기본이미지"
						style="width: 100%; height: 100%; border-radius: 10%;" />
						</div>
						<form action="/my/pic_update" method="post" enctype="multipart/form-data">
						<input id="profile" type="file" name="profile"/><br/>
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
					
						<form action="/my/profile" method="post" autocomplete="off" id="form">
						<div class="form-group">
						<b>NICKNAME</b><br/>
						<input type="text" name="nickname" tabindex="1" 
						class="form-control" value="${auth.NICKNAME }" required id="nickname"/>
						</div>
						<div class="form-group">
						<b>GENDER</b><br/>
						<input type="radio" name="gender" value="male" id="male"> Male
 					    <input type="radio" name="gender" value="female" id="female"> Female
						<span id="gender_rst"></span>
						</div>
						<div>
						<b>BIRTH</b><br/>
						<div class="form-group">
						<select name="birth" id="birth">
						<c:forEach var="i" begin="0" end="${2016-1900}">
  			    			<option value="${2016-i}">${2016-i}</option>
							<!--  <c:if test="${2016-i eq birth }">selected</c:if> -->
						</c:forEach>
						</select>
						</div>
						<b>GENRE</b><br/>
						<label><input class="w3-check" type="checkbox" name="genre" value="하우스/클럽">하우스/클럽 </label>
						<label><input class="w3-check" type="checkbox" name="genre" value="팝/재즈">팝/재즈 </label>
						<label><input class="w3-check" type="checkbox" name="genre" value="발라드">발라드 </label>
						<label><input class="w3-check" type="checkbox" name="genre" value="댄스">댄스 </label>
						<label><input class="w3-check" type="checkbox" name="genre" value="랩/힙합">랩/힙합 </label>
						<label><input class="w3-check" type="checkbox" name="genre" value="R&B/Soul">R&B/Soul </label>
						<label><input class="w3-check" type="checkbox" name="genre" value="인디음악">인디음악 </label>
						<label><input class="w3-check" type="checkbox" name="genre" value="일렉트로니카">일렉트로니카 </label>
						<label><input class="w3-check" type="checkbox" name="genre" value="락/메탈">락/메탈 </label>
						<label><input class="w3-check" type="checkbox" name="genre" value="클래식/기타">클래식/기타</label>
						<br>
						</div>
						<div class="form-group" align="center">
						<input type="submit" id="sbt" value="변경">
						</div>
						</form>	
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
</script>


