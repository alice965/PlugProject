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
						<img id="pre" src="/profiles/default.png" class="img-thumbnail" alt="�⺻�̹���"
						style="width: 70%; height: 30%; border-radius: 10%;" />
						</c:when>
						<c:otherwise>
						<img id="pre" src="${profile.URL }" alt="�����������"
						style="width: 70%; height: 30%; border-radius: 10%;" />
						</c:otherwise>
						</c:choose>
			
						<form action="/my/pic_update" method="post" enctype="multipart/form-data">
						<input id="profile" type="file" name="profile" ><br/>
						<button type="submit" class="sbt" id="sbt">����</button>
						<button type="button" class="bt" onclick="javascript:location.reload()">���</button>
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
						class="form-control" value="${auth.ID }" readonly id="id"/> <!-- readonly Ȥ�� disabled -> ���� �ȵ�. -->
						</div>
						<div class="form-group">
						<b>NICKNAME</b><br/>
						<input type="text" name="nickname" tabindex="2" 
						class="form-control" value="${auth.NICKNAME }" required id="nickname"/>
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
						<label><input class="w3-check" type="checkbox" name="genre" value="�Ͽ콺/Ŭ��">�Ͽ콺/Ŭ�� </label>
						<label><input class="w3-check" type="checkbox" name="genre" value="��/����">��/���� </label>
						<label><input class="w3-check" type="checkbox" name="genre" value="�߶��">�߶�� </label>
						<label><input class="w3-check" type="checkbox" name="genre" value="��">�� </label>
						<label><input class="w3-check" type="checkbox" name="genre" value="��/����">��/���� </label>
						<label><input class="w3-check" type="checkbox" name="genre" value="R&B/Soul">R&B/Soul </label>
						<label><input class="w3-check" type="checkbox" name="genre" value="�ε�����">�ε����� </label>
						<label><input class="w3-check" type="checkbox" name="genre" value="�Ϸ�Ʈ�δ�ī">�Ϸ�Ʈ�δ�ī </label>
						<label><input class="w3-check" type="checkbox" name="genre" value="��/��Ż">��/��Ż </label>
						<label><input class="w3-check" type="checkbox" name="genre" value="Ŭ����/��Ÿ">Ŭ����/��Ÿ</label>
						<br>
						</div>
						<div class="form-group" align="center">
						<input type="submit" id="sbt" value="����">
						<div align="right">
						<a href="/service/changepass" tabindex="5">��й�ȣ ���� | </a>
						<a href="/service/out" tabindex="5">ȸ��Ż��</a>
						</div>
						</div>
						</form>	
						<small>������Ʈ ��¥ : </small> ${profile.REGDATE }
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


