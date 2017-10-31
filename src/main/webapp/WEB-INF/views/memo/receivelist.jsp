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
	<h2>받은쪽지</h2>
	<table style="width: 80%">
		<thead>
			<tr>
				<th style="width: 10%">쪽지번호</th>
				<th style="width: 55%">쪽지제목</th>
				<th style="width: 15%">보낸이</th>
				
				<th style="width: 20%">보낸날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="obj" items="${data }">
				<tr>
					<td><a href="/product/show/${obj.NUM}">${obj.NAME }</a> <small>(<fmt:formatNumber
								value="${obj.GAB }" pattern="#,##0.00" />일 남음)
					</small></td>
					<td id="p_${obj.NUM }"><fmt:formatNumber value="${obj.SPRICE }" pattern="#,###" /></td>
					<td><fmt:formatNumber value="${obj.EPRICE }" pattern="#,###" /></td>
					<td><c:if test="${!empty obj.ENDDATE }">~<fmt:formatDate
								value="${obj.ENDDATE }" pattern="yyyy.MM.dd" />
						</c:if></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>


</div>


