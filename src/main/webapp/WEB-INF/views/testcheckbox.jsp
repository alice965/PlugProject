<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form action="/testcheckbox" method="post">
	<input type="text" class="get" name="num"  > 
	<input type="submit" value="전송">   
</form>   

	<div style="background-color:white;">
		<form action="/testcheckbox" method="post">
			<input type="checkbox" name="checkAll" id="checkAll">전체 선택 <br>
			<input type="checkbox" class="gr" name="genre" value="jazz"> 재즈
			<input type="checkbox" class="gr" name="genre" value="pop"> 팝
			<input type="checkbox" class="gr" name="genre" value="hiphop"> 힙합
			<input type="checkbox" class="gr" name="genre" value="kpop"> 케이팝
			<br>
			<input type="submit" value="전송">
		</form>
	</div>

<script>
//페이지 오픈시 값 세팅
$(document).ready(function() {
	$(".gr").each(function() {
		<c:forEach var="obj" items="${arrGenre}">
		if("${obj}".trim()==$(this).val()){
			$(this).prop("checked", true);
		}
		</c:forEach>
	})
});

//전체선택 체크박스 클릭시 선택과 반전 상태
$("#checkAll").click(function(){
	if($("#checkAll").is(":checked")){
		$(".gr").prop("checked", true);
	}else{
		$(".gr").prop("checked", false);
	}
});
//체크박스 하나라도 해제할 경우, 전체선택 체크박스 선택 해제
//전체 체크박스의 갯수를 구한 다음, 체크 상태가 전체 체크박스 갯수와 다를 경우 선택 해제
var size=$(".gr").length;
$(".gr").click(function(){
	if($("input[name='genre']:checked").length==size){
		$("#checkAll").prop("checked", true);		
	}else{
		$("#checkAll").prop("checked", false);		
	}
});

 


</script>

