<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<h1>JOIN
			<!-- modal로 주의사항 보이도록. -->
			<a data-target="#modal"
				data-toggle="modal" style="color:red; font-size:10pt"><i class="fa fa-hand-o-right" aria-hidden="true"></i>
				주의사항</a><input type="hidden">
			</h1>							
			<div class="modal fade" id="modal" role="dialog">
			<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content" style="background-color: #92a8d1;">
				<div class="modal-body" style="background-color: #92a8d1;">
					<div class="well">
						<h3>
						<i class="fa fa-exclamation-circle" aria-hidden="true" style="color: #292F33"><b> 회원가입시 주의사항</b></i>
							<br/>
						</h3>
							<i class="fa fa-commenting-o" aria-hidden="true" style="color: #292F33"><b> 계정명</b></i> <br/>
							-비밀번호를 찾을 때 해당아이디로 이메일이 보내지므로,<br/> 현재 사용중인 계정을 입력해주세요. <br/>
							<br/>
							<i class="fa fa-commenting-o" aria-hidden="true" style="color: #292F33"><b> 닉네임</b></i>   <br/>
							-닉네임에 공백 또는 특수문자를 넣을 수 없습니다. <br/>
							-닉네임은 변경이 불가능합니다. <br/>
							<br/>	
							<i class="fa fa-commenting-o" aria-hidden="true" style="color: #292F33"><b> 비밀번호</b></i>  <br/>
							-숫자, 문자, 특수문자를 조합하여 8자 ~ 20자 이내로 조합해주세요. <br/>
							-공백을 넣을 수 없습니다. 
					</div>
				</div>
				<br/>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
	
			<div class="panel-body">
				<div class="row">
					<div class="col-lg-12">
						<c:if test="${!empty temp }">
							<b style="color: red">[회원가입 실패 요인] </b>
							<br />
							<c:if test="${!empty alertid }">
								<!-- 앞서 joincontroller에서 오류가 나면 temp에 값을 넣음. temp가 비어있지 않다면 => join 실패. -->
								<b style="color: red">같은 계정명이 있습니다.</b>
								<br />
							</c:if>
							<c:if test="${!empty alertnick }">
								<b style="color: red">같은 닉네임이 있습니다.</b>
								<br />
							</c:if>
							<br />
						</c:if>
						<form action="/join" method="post" autocomplete="off" id="form">
							<div class="form-group">
								<input type="email" name="id" tabindex="1" class="form-control"
									placeholder="Email" value="" required id="id" />
							</div>
							<div class="form-group">
								<input type="text" name="nickname" tabindex="1"
									class="form-control" placeholder="Nickname" value="" required
									id="nickname" />
							</div>
							<div class="form-group">
								<input type="password" name="pass" tabindex="2"
									class="form-control" placeholder="Password" required id="pass" />
							</div>
							<div class="form-group">
								<!-- name쓰면 파라미터로 전달됨. -->
								<input type="password" id="pass_con" tabindex="2"
									class="form-control" placeholder="Confirm Password" required />
								<br /> <span id="pass_rst"></span>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-sm-6 col-sm-offset-3">
										<button type="submit" name="sbt" id="sbt" tabindex="4"
											class="form-control btn btn-register">Register Now</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	document.getElementById("pass_con").onblur = function() {
	if (document.getElementById("pass").value == document.getElementById("pass_con").value) {
		document.getElementById("pass_rst").innerHTML = "<b style=\"color:blue\">일치합니다</b>";
		document.getElementById("sbt").disabled = false;
	} else {
		document.getElementById("pass_rst").innerHTML = "<b style=\"color:red\">불일치합니다</b>";
		document.getElementById("sbt").disabled = true;
	}
}
	
	//비밀번호 유효성 체크 : 영문,숫자,특수문자 혼합하여 8자리~20자리 이내.(비밀번호 표준)
	$("#sbt").click(function(){
		 var pw = document.getElementById("pass").value;
		 var num = pw.search(/[0-9]/g);
		 var eng = pw.search(/[a-z]/ig);
		 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		 
		 var nickname = document.getElementById("nickname").value;
		 var nickspe = nickname.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		 
		 console.log(nickname + ".." + (nickname.search(/\s/) != -1) + ".." +  (nickspe>0));

		 
		 if((nickname.search(/\s/) != -1) || (nickspe>0) ){ //공백 또는 특수문자가 있으면 안됨.
			 alert("닉네임에 공백 또는 특수문자가 있는지 확인해주세요.");
			 document.getElementById("sbt").disabled = true;
			 $("#nickname").val('');
			 $("#pass").val('');
			 $("#pass_con").val('');
			 $("#nickname").focus();
		 }else{ 
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
			 $("#pass").val('');
			 $("#pass_con").val('');
			 $("#pass").focus();
		 	}
		 }
		document.getElementById("sbt").disabled = false;
		});
</script>