<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="sub-top">
	<h2 class="text-center">친구 관리</h2>
</div>
<br>
<br>
<div class="w3-container">
	<!-- 탭 영역 -->
	<div class="w3-row">
		<a href="javascript:void(0)" onclick="openPage(event, 'flist');">
			<div
				class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding">친구
				리스트</div>
		</a> <a href="javascript:void(0)" onclick="openPage(event, 'rlist');">
			<div
				class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding">받은
				친구 요청</div>
		</a> <a href="javascript:void(0)" onclick="openPage(event, 'slist');">
			<div
				class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding">보낸
				친구 요청</div>
		</a>
	</div>

	<!-- 페이지 영역 -->
	<!-- 친구 리스트 영역 -->
	<div id="flist" class="w3-container tabPage" style="display: block">
		<h3>친구 리스트</h3>
		<div class="col-xs-7">
			총 <b>${cntListFrd}</b> 명의 친구가 등록되어 있습니다.
		</div>
		<p></p>
		<table class="w3-table-all" style="width: 95%" id="list">
			<thead>
				<tr class="w3-Blue">
					<th style="width: 30%">닉네임</th>
					<th style="width: 30%">아이디</th>
					<th style="width: 10%">친구추가일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="obj" items="${listFriend }">
					<tr>
						<td>${obj.NICKNAME }</td>
						<td>${obj.ID }</td>
						<td>${obj.ADDATE }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- 받은 친구 요청 영역 -->
	<div id="rlist" class="w3-container tabPage" style="display: none">
		<h3>받은 친구 요청</h3>
		<div class="col-xs-7">
			총 <b>${cntListReq }</b> 건의 친구 요청이 있습니다.
		</div>
		<table class="w3-table-all" style="width: 95%" id="list">
			<thead>
				<tr class="w3-Blue">
					<th style="width: 30%">닉네임</th>
					<th style="width: 30%">아이디</th>
					<th style="width: 20%">친구 신청일</th>
					<th style="width: 20%">친구 수락</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="obj" items="${listReq }">
					<tr>
						<td>${obj.NICKNAME }</td>
						<td>${obj.OTHER }</td>
						<td>${obj.REQDATE }</td>
						<td><button class=\ "w3-buttonw3-blackw3-round-xxlarge\" >친구
								수락</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

<!-- 보낸 친구 요청 영역 -->

<div id="slist" class="w3-container tabPage" style="display: none">
	<h3>보낸 친구 요청</h3>
</div>





</div>


<script>
	function openPage(evt, tabName) {
		var i, x, tablinks;
		x = document.getElementsByClassName("tabPage");
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none";
		}
		tablinks = document.getElementsByClassName("tablink");
		for (i = 0; i < x.length; i++) {
			tablinks[i].className = tablinks[i].className.replace(
					" w3-border-red", "");
		}
		document.getElementById(tabName).style.display = "block";
		evt.currentTarget.firstElementChild.className += " w3-border-red";
	}
</script>
