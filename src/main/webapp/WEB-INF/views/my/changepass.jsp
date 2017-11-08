<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- //자바스크립트나 css에서 쓰기 위해 id필요하고, name은 파라미터 위해 필요  -->
<div class="container">
    	<div class="row">
			<div class="col-md-6 col-md-offset-3">
			<h2>비밀번호 변경</h2>
			<div class="panel-body">
			<c:if test="${!empty nowpasserror }">
			<b style="color: red">로그인 실패 요인..</b><br/>
			<b style="color:red">현재 비밀번호가 일치하지 않습니다.</b><br/>
			</c:if>
			<c:if test="${!empty same }"> <!-- 앞서 joincontroller에서 오류가 나면 temp에 값을 넣음. temp가 비어있지 않다면 => join 실패. -->
			<b style="color:red">비밀번호 변경 실패 요인.. </b><br/>
			<b style="color:red">현재 비밀번호와 같습니다.</b><br/>
			</c:if>
			<c:if test="${!empty tempchangepass }"> <!-- 현재 비밀번호와 다를 경우.. -->
			<b style="color:red">비밀번호 변경 실패.. </b><br/>
			</c:if>
			<br/>
				<form action="/my/changepass" method="post" autocomplete="off" id="form">
				<div class="form-group">
				<input type="password" name="now" tabindex="1" class="form-control" 
				placeholder="현재 비밀번호" value="" required id="now"/>
				</div>
				<div class="form-group">
				<input type="password" name="change" tabindex="2" class="form-control" 
				placeholder="변경할 비밀번호" value="" required id="change"/>
				</div>
				<div class="form-group"><!-- name쓰면 파라미터로 전달됨. -->
				<input type="password" id="change_con" tabindex="2" class="form-control" 
				placeholder="변경할 비밀번호 " required/><br/>
				<small> 변경할 비밀번호 일치여부: <span id="change_rst"></span></small>
				</div>
				<div class="form-group">
				<div class="row">
				<div align="center">
				<button type="submit" id="sbt" tabindex="4">변경</button>
				</div>
				</div>
				</div>
				</form>
			</div>
			</div>
		</div>
</div>
<script>
	document.getElementById("change_con").onblur = function() {
	if (document.getElementById("change").value == document.getElementById("change_con").value) {
		document.getElementById("change_rst").innerHTML = "<b style=\"color:blue\">일치합니다</b>";
		document.getElementById("sbt").disabled = false;
	} else {
		document.getElementById("change_rst").innerHTML = "<b style=\"color:red\">불일치합니다. 다시 확인해주세요.</b>";
		document.getElementById("sbt").disabled = true;
	}
}
	//비밀번호 유효성 체크 : 영문,숫자,특수문자 혼합하여 8자리~20자리 이내.(비밀번호 표준)
	$("#sbt").click(function(){
		 var pw = document.getElementById("change").value;
		 var num = pw.search(/[0-9]/g);
		 var eng = pw.search(/[a-z]/ig);
		 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		 
			 if( (pw.length < 8 || pw.length > 20) 
				 || (num < 0 || eng < 0 || spe < 0 )
				 || (pw.search(/\s/) != -1)
				){
				if((pw.length < 8 || pw.length > 20)&&(num < 0 || eng < 0 || spe < 0 )){
					alert("영문, 숫자, 특수문자를 조합하여\n8자리 ~ 20자리 이내로 입력해주세요.");
				}else if(pw.length < 8 || pw.length > 20){
					alert("8자리 ~ 20자리 이내로 입력해주세요.");
				}else if(num < 0 || eng < 0 || spe < 0 ){
					alert("영문, 숫자, 특수문자를 혼합하여 입력해주세요.");
			 	}
			 
			 	if(pw.search(/\s/) != -1){
				 	alert("비밀번호는 공백없이 입력해주세요.");
			 	}
			 document.getElementById("sbt").disabled = true;
			 $("#change").val('');
			 $("#change_con").val('');
			 $("#change").focus();
		 	}
		document.getElementById("sbt").disabled = false;
		});
</script>
    