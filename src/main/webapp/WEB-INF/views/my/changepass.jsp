<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- //�ڹٽ�ũ��Ʈ�� css���� ���� ���� id�ʿ��ϰ�, name�� �Ķ���� ���� �ʿ�  -->
<div class="container">
    	<div class="row">
			<div class="col-md-6 col-md-offset-3">
			<h2>��й�ȣ ����</h2>
			<div class="panel-body">
			<c:if test="${!empty nowpasserror }">
			<b style="color: red">�α��� ���� ����..</b><br/>
			<b style="color:red">���� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.</b><br/>
			</c:if>
			<c:if test="${!empty same }"> <!-- �ռ� joincontroller���� ������ ���� temp�� ���� ����. temp�� ������� �ʴٸ� => join ����. -->
			<b style="color:red">��й�ȣ ���� ���� ����.. </b><br/>
			<b style="color:red">���� ��й�ȣ�� �����ϴ�.</b><br/>
			</c:if>
			<c:if test="${!empty tempchangepass }"> <!-- ���� ��й�ȣ�� �ٸ� ���.. -->
			<b style="color:red">��й�ȣ ���� ����.. </b><br/>
			</c:if>
			<br/>
				<form action="/my/changepass" method="post" autocomplete="off" id="form">
				<div class="form-group">
				<input type="password" name="now" tabindex="1" class="form-control" 
				placeholder="���� ��й�ȣ" value="" required id="now"/>
				</div>
				<div class="form-group">
				<input type="password" name="change" tabindex="2" class="form-control" 
				placeholder="������ ��й�ȣ" value="" required id="change"/>
				</div>
				<div class="form-group"><!-- name���� �Ķ���ͷ� ���޵�. -->
				<input type="password" id="change_con" tabindex="2" class="form-control" 
				placeholder="������ ��й�ȣ " required/><br/>
				<small> ������ ��й�ȣ ��ġ����: <span id="change_rst"></span></small>
				</div>
				<div class="form-group">
				<div class="row">
				<div align="center">
				<button type="submit" id="sbt" tabindex="4">����</button>
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
		document.getElementById("change_rst").innerHTML = "<b style=\"color:blue\">��ġ�մϴ�</b>";
		document.getElementById("sbt").disabled = false;
	} else {
		document.getElementById("change_rst").innerHTML = "<b style=\"color:red\">����ġ�մϴ�. �ٽ� Ȯ�����ּ���.</b>";
		document.getElementById("sbt").disabled = true;
	}
}
</script>
    