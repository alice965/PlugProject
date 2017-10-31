<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<style>
th {
	border-bottom: 1px solid;
	text-align: left;
}

th, td {
	padding: 10px;
}

input {
	font-family: 맑은 고딕;
	padding: 3px;
}
button {
	padding: 7px;
}
</style>
<div align="center">
	<h2>Alarm List</h2>
	<table style="width: 80%">
		<thead>
			<tr>
			
			
				<th style="width: 10%"><input type="checkbox" name="chk_info" value="HTML">전체선택 </th>
				<th style="width: 10%">알림번호</th>
				<th style="width: 65%">알람내용</th>
				<th style="width: 15%">알람일시</th>
			</tr>
		</thead>

	</table>


</div>


