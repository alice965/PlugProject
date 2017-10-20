<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="sub-top">
	<h2 class="text-center">나의 플레이 리스트</h2>
</div>

<div align="center">
	<div style="width: 90%; line-height: 30px;">
		<hr />
		<div class="w3-card-4">
  <div class="w3-container w3-blue">
    <h3>플레이 리스트 만들기</h3> 
  </div>
  <br>
  <form class="w3-container" action="/myplay/add" method="post">
    <p>      
    <label class="w3-text-blue"><b>방 제목</b></label>
    <c:choose>
    	<c:when test="${map.NAME eq null }">
						<input type="text" name="name"/>
				 	</c:when>
				 	<c:otherwise>
				 		<input type="text" name="name" value="${map.NAME}"/>
				 	</c:otherwise>
   		 <input class="w3-input w3-border w3-sand" name="title" type="text">
    </c:choose>
    </p>
    
    <!-- 선호 장르 선택 -->
    <p>      
    <label class="w3-text-blue"><b>설명</b></label>
    <input class="w3-input w3-border w3-sand" name="content" type="text">
    </p>
 	<p>
 	<label class="w3-text-blue"><b>장르</b></label> <br>
  	<input class="w3-check" type="checkbox" checked="checked">
  	<label>팝</label>
  	</p>
	<p>
	<input class="w3-check" type="checkbox">
	<label> 재즈</label>
	</p>
	<p>
	<input class="w3-check" type="checkbox" >
	<label>클래식</label>
	</p>
 
    <button class="w3-btn w3-blue" type="submit">등록</button>
	<button class="w3-btn w3-blue" type="button" onclick="javascript:location.href='/myplay/list'">취소</button>
  </form>
	</div>
</div>