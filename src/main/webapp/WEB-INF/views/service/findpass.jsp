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
	<h2>��й�ȣ ã��</h2><br/>
		<form action="/service/findpass" method="post">
		<div class="form-group" align="center">
			<h5>ã���� �ϴ� ��й�ȣ�� �̸����� �Է����ּ���. </h5>
		<div class="form-group">
			<input type="email" name="id" tabindex="1" class="form-control" placeholder="Email" value="" 
			autocomplete="off" id="id"/>
		</div>
		<br/>
		<button type="submit" id="submit">�ӽú�й�ȣ ����</button>
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