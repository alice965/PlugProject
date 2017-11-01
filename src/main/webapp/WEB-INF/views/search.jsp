<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- 상단 점보트론  -->
<div class="sub-top">
	<h2 class="text-center">검색</h2>
</div>

<!-- 컨테이너 시작  -->
<div class="container" style="margin-top:10px;">

<!-- 검색 옵션 패널 부분 -->
  <div class="panel-group" >
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title"> 
          <a data-toggle="collapse" href="#collapse1">검색 옵션&nbsp;&nbsp;&nbsp;<i class="fa fa-chevron-down" aria-hidden="true"></i> </a>
        </h4>
      </div>
      <div id="collapse1" class="panel-collapse collapse">
      <!-- 검색 조건 영역 시작 -->
        <div class="panel-body">
        	
      </div>
      <!-- 검색 조건 영역 끝 -->
    </div>
  </div>
 </div>
<!-- 검색 결과 출력 부분 -->
<p>총 <b>${cnt }</b> 개의 부스가 등록되어 있습니다.</p>
 <div class="table-responsive">          
  <table class="table  table-hover">
    <thead>
      <tr class="success">
        <th>#</th>
        <th>부스 이름</th>
        <th>DJ </th>
        <th>생성일</th>
        <th>참여자수</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>1</td>
        <td>Anna</td>
        <td>Pitt</td>
        <td>35</td>
        <td>123123</td>
      </tr>
    </tbody>
  </table>
  </div>





<!-- 컨테이너 종료 -->
</div>


