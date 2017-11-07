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
	<!-- 탭 영역 -->
<div class="container">

  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#flist" id="f_list">친구 리스트</a></li>
    <li><a data-toggle="tab" href="#rlist"  id="r_list">받은 친구 요청</a></li>
    <li><a data-toggle="tab" href="#slist"  id="s_list">보낸 친구 요청</a></li>
  </ul>

  <div class="tab-content">
    <div id="flist" class="tab-pane fade in active">
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
					<th style="width: 20%">친구추가일</th>
					<th style="width: 15%">삭제</th>
				</tr>
			</thead>
			<tbody>
			<!-- 컨트롤러에서 받은 아이디가 onenick과 일치하는지 체크 -->
				<c:forEach var="obj" items="${listFriend }">
			<c:choose>
					<c:when test="${obj.ONE eq sid}">
						<tr>
						<td>${obj.OTHERNICK }</td>
						<td>${obj.OTHER }</td>
						<td>
							<fmt:formatDate value="${obj.ADDDATE}" pattern="yyyy.MM.dd" />
						</td>
						<td>
							<button class="deleteFriend">삭제</button> 
								<input type="hidden"	value="${obj.OTHER }"> 
								<input type="hidden" 	value="${obj.ONE }">
						</td>
					</tr>
					</c:when>
					<c:otherwise>
						<tr>
						<td>${obj.ONENICK }</td>
						<td>${obj.ONE }</td>
						<td>
							<fmt:formatDate value="${obj.ADDDATE}" pattern="yyyy.MM.dd" />
						</td>
						<td>
							<button class="deleteFriend">삭제</button> 
								<input type="hidden"	value="${obj.ONE}"> 
								<input type="hidden" 	value="${obj.OTHER}">
						</td>
						</tr>
					</c:otherwise>
			</c:choose>
				</c:forEach>
				
			<!-- ------------ -->
			</tbody>
		</table>
    </div>
    <div id="rlist" class="tab-pane fade">
      <h3>받은 친구 요청</h3>
      <div class="col-xs-7">
			총 <b>${cntListRcv }</b> 건의 친구 요청을 받았습니다.
		</div>
		<table class="w3-table-all" style="width: 95%" id="list">
			<thead>
				<tr class="w3-Blue">
					<th style="width: 30%">닉네임</th>
					<th style="width: 30%">아이디</th>
					<th style="width: 20%">친구 신청일</th>
					<th style="width: 20%">승인/거절</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="obj" items="${listRcv }">
					<tr>
						<td>${obj.ONENICK }</td>
						<td>${obj.ONE }</td>
						<td>
							<fmt:formatDate value="${obj.REQDATE}" pattern="yyyy.MM.dd" />
						</td>
						<td>
							<button class="accept">승인</button> 
								<input type="hidden"	value="${obj.ONE}"> 
								<input type="hidden"	value="${obj.OTHER}">

							<button class="deny">거절</button> 
								<input type="hidden"	value="${obj.ONE }"> 
								<input type="hidden" 	value="${obj.OTHER }">
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
    </div>
    <div id="slist" class="tab-pane fade">
      <h3>보낸 친구 요청</h3>
      <div class="col-xs-7">
			총 <b>${cntListReq }</b> 건의 친구 요청을 보냈습니다.
		</div>
		<table class="w3-table-all" style="width: 95%" id="list">
			<thead>
				<tr class="w3-Blue">
					<th style="width: 30%">닉네임</th>
					<th style="width: 30%">아이디</th>
					<th style="width: 20%">친구 신청일</th>
					<th style="width: 20%">취소</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="obj" items="${listReq }">
					<tr>
						<td>${obj.OTHERNICK }</td>
						<td>${obj.OTHER }</td>
						<td>
							<fmt:formatDate value="${obj.REQDATE}" pattern="yyyy.MM.dd" />
						</td>
						<td>
							<button class="delete">취소</button> 
								<input type="hidden"	value="${obj.ONE }"> 
								<input type="hidden" 	value="${obj.OTHER }">
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
    </div>
  </div>
</div>
	
<!--받은 요청인 경우,  해당 탭으로 열린 상태로 오픈  -->
<!-- wait.jsp에서 src로 파라미터를 넘김 -->

<c:choose>
	<c:when test="${param.src eq 'exist' }">	<!-- 이미 친구인경우 -->
		<script>
				$("#f_list").trigger("click");
		</script>
	</c:when>
	<c:when test="${param.src eq 'requested' }">
		<script>
				$("#s_list").trigger("click");
		</script>
	</c:when>
	<c:when test="${param.src eq 'otherrequested' }">
		<script>
				$("#r_list").trigger("click");
		</script>
	</c:when>


</c:choose>

<script>
//친구삭제 스크립트
$(".deleteFriend").on(
		"click",
		function() {
			var r = confirm("친구를 삭제하시겠습니까?");
			if (r == true) {
				location.href = '/friend/delete?one='
						+ $(this).next().val() + '&other='
						+ $(this).next().next().val();
			} 
		});
	//친구요청 취소 스크립트
	$(".delete").on(
			"click",
			function() {
				var r = confirm("친구요청을 취소하시겠습니까?");
				if (r == true) {
					location.href = '/friend/delete?one='
							+ $(this).next().val() + '&other='
							+ $(this).next().next().val();
				} else {
				}
			});
	//친구승인 스크립트
	$(".accept").on(
			"click",
			function() {
				var r = confirm("친구요청을 수락하시겠습니까?");
				if (r == true) {
					location.href = '/friend/accept?one='
							+ $(this).next().val() + '&other='
							+ $(this).next().next().val();
				} else {
				}
			});
	//친구 거절 스크립트
	$(".deny").on(
			"click",
			function() {
				var r = confirm("친구요청을 거절하시겠습니까?");
				if (r == true) {
					location.href = '/friend/delete?one='
							+ $(this).next().val() + '&other='
							+ $(this).next().next().val();
				} else {
				}
			});
</script>
