<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!------------------------ 검색바를 위한 스타일 시트 정의------------------  -->
<!-- https://bootsnipp.com/snippets/featured/advanced-dropdown-search -->
<style>

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

</style>

<!-- ----------------------검색바를 위한 스타일 시트 정의 끝------------------ -->
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<!-- 로그인/아웃 메뉴 구분 -->
		<div class="row">
			<div class="col-sm-7">
					<!-- 자리 확보를 위한 빈 공간 -->
			</div>
			<div class="col-sm-5">
				<c:choose>
					<c:when test="${empty auth }">
							<a href="/login">Log-In  </a>  /
							<a href="/join">Join</a>
					</c:when>
						<c:otherwise>
							<a href="/logout">Log Out  </a>  /
							<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"> 마이페이지<span class="caret"></span>
						</a>
								<ul class="dropdown-menu">
									<li><a href="/my/profile">나의 정보</a></li>
									<li><a href="/my/mybooth">나의 부스</a></li>
									<li><a href="/my/alarm">알리미</a></li>
								</ul>
						</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expended="false">
				<span class="sr-only"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/index" style="font-size: 25px; margin-top:-10px;">Plug.DJ</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapase-1" >
			<ul class="nav navbar-nav">
				<!-- 비회원메뉴 -->
				<li class="active"><a href="/booth/boothmain">DJ Booth<span	class="sr-only"></span></a></li>
				<li><a href="/myplay/list?page=1">My Booth</a></li>
				<li> <a href="#"  class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"> 쪽지함<span class="caret"></span>
					</a>
							<ul class="dropdown-menu">
								<li><a href="/memo/receivelist/">받은 쪽지함</a></li>
								<li><a href="/memo/sendlist/">보낸 쪽지함</a></li>
							</ul>
				</li>
				<!-- ----------------------검색 바----------------------------------------- -->
            <div class="input-group" id="adv-search" style="padding-top:10px;">
                <input type="text"  id="searchval" class="form-control" placeholder="부스를 검색해보세요" /> <!-- 네비 영역 검색 인풋창 searchval -->
                <div class="input-group-btn">
                    <div class="btn-group" role="group">
                        <div class="dropdown dropdown-lg">
                            <button type="button" class="btn btn-default dropdown-toggle searcharrow" data-toggle="dropdown" aria-expanded="false"><span class="caret"></span></button>
                            <div class="dropdown-menu dropdown-menu-right" role="menu">
                                <form class="form-horizontal" role="form">
                                  <div class="form-group">
                                    <label for="filter">Filter by</label>
                                    <select class="form-control">
                                        <option value="0" selected>부스 검색</option>
                                        <option value="1">신규 부스</option>
                                        <option value="2">조회수 높은 부스</option>
                                    </select>
                                  </div>
                                  <div class="form-group">
                                    <label for="contain">DJ 이름</label>
                                    <input class="form-control" type="text" />
                                  </div>
                                  <div class="form-group">
                                    <label for="contain">부스 이름</label>
                                    <input class="form-control" type="text" />
                                  </div>
                                  <button type="submit" class="btn btn-primary" > 
                                  		<span class="glyphicon glyphicon-search " aria-hidden="true">  		</span>
                                  </button>
                                </form>
                            </div>
                        </div>
                        <button type="button" class="btn btn-primary" id="searchbtn"><!-- 돋보기 모양 검색 버튼  searchbtn-->
                        	<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>
                    </div>
                </div>
            </div>
				<!-- ----------------------검색 바----------------------------------------- -->
			</ul>
			</div>
	</div>

	</li>
</ul>
</div>
</div>
</nav>

<script>
// 돋보기 모양 검색 버튼 클릭시 스크립트
$("#searchbtn").click(function() {
    var keyword=$("#searchval").val();
   alert(keyword);
});


</script>
