<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!--부스 타이틀 영역  -->
<div style="background-color: #6699ff;">
	<div id="booth_name"><h2>${one.TITLE }</h2></div>
	<div id="booth_info">
		<div class="row">

			<!-- 방장 닉네임 -->
			<div class="col-md-2"> 
				<h4>&nbsp;
					<i class="fa fa-headphones fa-lg" aria-hidden="true" style="font-size:30px;color:gray;"></i> 
					${one.NICKNAME }
				</h4>
			</div>
			<!-- 참여자 수 -->
			<div class="col-md-2">
				<h4>&nbsp;
					<i class="fa fa-users fa-lg" aria-hidden="true" style="font-size:30px;color:gray;"></i> 
					${one.COUNT }
				</h4>
			</div>	
		</div>
		
	</div>
</div>

<!-- 메인 영역 -->
<div class="row">

	<!-- 왼쪽 영역 (영상 플레이) -->
	<div class="col-md-9" style="min-height: 65%; background-color: black;">
		<p>영상이 들어갈 위치</p>
	</div>

		<!-- 오른쪽 영역 (채팅과 재생목록 -->
	<div class="col-md-3"  	style="min-height: 65%; min-width: 300px; background-color: #6699ff; border-radius: 2em;">
		
			<!-- 탭 영역 -->
		  <ul class="nav nav-tabs">
			    <li class="active"><a data-toggle="tab" href="#chat">채팅창</a></li>
			    <li><a data-toggle="tab" href="#">채팅참여자</a></li>
			    <li><a data-toggle="tab" href="#slist">재생목록</a></li>
		  </ul>
		
		<!-- 재생목록 -->
		  <div class="tab-content">
			    <div id="playlist" class="tab-pane fade in active">
			    <div class="dropdown">
                <div class="dropdown-toggle" data-toggle="dropdown">
                	재생목록 추가하기<span class="caret"></span>
                </div>
                <ul class="dropdown-menu">
                <li><a href="#" class="popFriend">제목으로 갖고오기</a><input type="hidden"></li>
                <li><a href="/video/playlist/${one.NUM }" class="popMemo">채널에서 갖고오기</a><input type="hidden"></li>
                <li><a href="#" class="popMemo">재생목록 갖고오기</a><input type="hidden"></li>
                </ul>
                </div>
                
                <!-- 재생목록 갖고오기 : 재생목록 없을 경우 -->
				<c:if test="${!empty nolist }"> 
				<b style="color: red">재생목록이 없습니다.</b><br/>
				</c:if>
				<c:if test="${!empty video }">
				<c:forEach var="obj" items="${video }">
				<div align="left" class="col-lg-5">
				<img src="${obj.IMAGE}"  style="width:80px; height:55px"> 	
				</div>
				<div style="width:500px; height:130px" align="right">	
						${obj.VIDEO_TITLE} <br/>
						추가한 사람 : ${obj.ADD_ID } (${obj.ADD_NICKNAME }) <br/>
						추가한 날짜 : ${obj.ADDDATE } <br/>
				</div>
						<hr/>
				</c:forEach>
				</c:if>
				<!-- 재생목록 갖고오기 : 재생목록 있을 경우 -->

				
			    </div>
		   </div>
</div> <!-- 컨테이너 종료 태그 -->
   
	<!-- 채팅 영역 -->
	<div id="chat"  style="min-width: 300px;">
		<form class="chat_input_form" >
			<input id="chat_input_field" type="text" value="" autocomplete="off"
				placeholder="여기에 메시지를 입력하세요" maxlength="256">
		</form>
	</div>

</div> <!-- /row -->


<div style="background-color:yellow">
	<div id="na" class="col-md-3" style="border-radius: 2em; background-color:#66ff99;"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i>좋아요<br></div>

	<div id="book" class="col-md-3" style="border-radius: 2em; background-color:#ffcc66;"><i class="fa fa-star-o" aria-hidden="true"></i>북마크<br></div>

	<div id="na" class="col-md-3" style="border-radius: 2em; background-color:#ff0066;"><i class="fa fa-thumbs-o-down" aria-hidden="true"></i>싫어요<br></div>

	<div id="watingroom" class="col-md-3" style="background-color: #cc66ff; border-radius: 2em;">대기열넣을곳
	<br/></div>	
</div>

</html>
