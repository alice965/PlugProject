<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
    <div class="row">
	<div class="col-md-6 col-md-offset-3">
		<c:if test="${!empty checkId }">
			<script>
				alert("�ش� ���̵� �������� �ʽ��ϴ�.");
			</script>
		</c:if>	
	<h3><b>��й�ȣ ã��</b></h3><br/>
	<h6>���̵� �Է����ּ���. �ش� �������� �ӽ� ��й�ȣ�� ���۵˴ϴ�. </h6>
		<form action="/service/findpass" method="post">
		<div class="form-group" align="center">
		<div class="form-group">
			<input type="email" name="id" tabindex="1" class="form-control" placeholder="Email" value="" 
			autocomplete="off" id="id"/>
		</div>
		<br/>
		<button type="submit" id="submit">�����ϱ�</button>
		</div>	
		</form>
		
		<c:if test="${!empty haveId}"> <!-- �ش� ���̵� ������ ������.. �ٵ� alert������ ����..-->
			<script>
			alert("�ӽú�й�ȣ�� ���½��ϴ�.");
			</script>
		</c:if>
	
		<div align="right">
		<a href="/" tabindex="5">����ȭ������ ���ư���</a>
		</div>

	</div>
	</div>
</div>