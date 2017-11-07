<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
<!------------------------ 검색바를 위한 스타일 시트 정의------------------  -->
<!-- https://bootsnipp.com/snippets/featured/advanced-dropdown-search -->

.dropdown.dropdown-lg .dropdown-menu {
    margin-top: -1px;
    padding: 6px 20px;
}
.input-group-btn .btn-group {
    display: flex !important;
}
.btn-group .btn {
    border-radius: 0;
    margin-left: -1px;
}
.btn-group .btn:last-child {
    border-top-right-radius: 4px;
    border-bottom-right-radius: 4px;
}
.btn-group .form-horizontal .btn[type="submit"] {
  border-top-left-radius: 4px;
  border-bottom-left-radius: 4px;
}
.form-horizontal .form-group {
    margin-left: 0;
    margin-right: 0;
}
.form-group .form-control:last-child {
    border-top-left-radius: 4px;
    border-bottom-left-radius: 4px;
}

@media screen and (min-width: 768px) {
    #adv-search {
        width: 300px;
        margin: 0 auto;
    }
    .dropdown.dropdown-lg {
        position: static !important;
    }
    .dropdown.dropdown-lg .dropdown-menu {
        min-width: 300px;
    }
    .searcharrow{
    height: 34px;}
}

	.toptxt{
		font-size: 15px;
		color :gray;
	}
	.searchbtn{
		margin-top:8px;
	}
</style>

<!-- ----------------------검색바를 위한 스타일 시트 정의 끝------------------ -->
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
  	<!-- 로그인/아웃 메뉴 구분 -->
		<div class="row" style="text-align:right; padding-right:5%">
				<c:choose>
					<c:when test="${empty auth }">
							<span class="toptxt">방문객님 환영합니다 &nbsp;&nbsp;</span>
					</c:when>
						<c:otherwise>
							<span  class="toptxt">${auth.NICKNAME }(${auth.ID })님 안녕하세요 &nbsp;&nbsp;</span>
						</c:otherwise>
				</c:choose>
			</div>
		
		<!--  -->
    <div class="navbar-header">
     <a class="navbar-brand" href="/index" style="font-size: 25px; margin-top:-10px;">Plug.DJ</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="/booth/boothmain?page=1&mode=normal">DJ Booth</a></li>
      <li><a href="/myplay/list?page=1">My Booth</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">쪽지함 <span class="caret"></span></a>
        <ul class="dropdown-menu">
			<li><a href="/memo/receivelist/">받은 쪽지함</a></li>
			<li><a href="/memo/sendlist/">보낸 쪽지함</a></li>
		</ul>
      </li>
    </ul>
    <!-- location.href="/booth/boothmain?mode=search&title="+keyword; -->
    <form class="navbar-form navbar-left" id="searchid" action="/booth/boothmain">
      <div class="form-group navbar-form navbar-left">
    	<input type="hidden" name="mode" value="search"/>
        <input type="text" id="searchval" name="title" value="${keyword}" class="form-control" placeholder="부스 검색">
      </div>
      <button type="submit" id="searchbtn" class="btn btn-default searchbtn">Search</button>
    </form>
    <ul class="nav navbar-nav navbar-right">
    	<c:choose>
			<c:when test="${empty auth }">
      				<li><a href="/login"><span class="glyphicon glyphicon-log-in"></span> Log in</a></li>
					<li><a href="/join"><span class="glyphicon glyphicon-user"></span> Join</a></li>
			</c:when>
			<c:otherwise>
      				<li><a href="/logout"><span class="glyphicon glyphicon-log-out"></span> Log Out</a></li>
					<li><a href="/" class="dropdown-toggle toptxt"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"><span class="glyphicon glyphicon-user"></span> My Page<span class="caret"></span></a>
							<ul class="dropdown-menu">
									<li><a href="/my/profile">나의 정보</a></li>
									<li><a href="/myplay/list">나의 부스</a></li>
									<li><a href="/friend/list">친구 관리</a></li>
							</ul>
					</li>
			</c:otherwise>
		</c:choose>
      
    </ul>
  </div>
</nav>

<script>
//  검색 버튼 클릭시 스크립트
$("#searchid").submit(function() {
	// window.alert("??");
    var keyword=$("#searchval").val();
   
    if(keyword.length==0) {
    	 alert("검색어를 입력해주세요");
    	 return false;
    }else{
//	    location.href="/booth/boothmain?mode=search&title="+keyword;
//	    $("#searchval").val=keyword;
    	return true;
    }
});


</script>
