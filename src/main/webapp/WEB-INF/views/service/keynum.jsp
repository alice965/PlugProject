<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
    <div class="row">
	<div class="col-md-6 col-md-offset-3">
	<h2>������ȣ �Է�</h2><br/>
		<form action="/service/keynum" method="post">
		<div class="form-group" align="center">
			<h5>������ȣ�� �Է����ּ���. </h5>
		<div class="form-group">
			<input type="text" name="uuid" tabindex="1" class="form-control" placeholder="������ȣ" 
			value="" autocomplete="off" id="id"/>
		</div>
		<br/>
		<button type="submit" id="submit">������ȣ �Է�</button>
		<div align="right">
		<a href="/" tabindex="5">�޴�ȭ������ ���ư���</a>
		</div>
		</div>	
		</form>
	</div>
	</div>
</div>