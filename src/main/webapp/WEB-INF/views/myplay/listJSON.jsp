<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
[
	<c:forEach var="i" items="${list}" varStatus="vs">
	{
		"num" : ${i.NUM},
		"regdate" : "<fmt:formatDate value="${i.REGDATE}" pattern="yyyy.MM.dd" />",
		"count" : ${i.COUNT}
	}
		<c:if test="${!vs.last }">,</c:if>
	</c:forEach>

]
