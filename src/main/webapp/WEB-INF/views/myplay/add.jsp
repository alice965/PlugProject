<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <input class="w3-input w3-border w3-sand" name="title" type="text"></p>
    <p>      
    <label class="w3-text-blue"><b>설명</b></label>
    <input class="w3-input w3-border w3-sand" name="content" type="text"></p>
 	<p>
 	
 	<!-- 장르 선택 -->
 	<label class="w3-text-blue"><b>장르</b></label> <br>
 	<input type="button" class="w3-grey w3-tiny w3-border-grey w3-button w3-round-xlarge" value="전체선택" onclick="checkboxSelectQue(1,'chk[]')" />
	<input type="button" value="전체해제" onclick="checkboxSelectQue(2,'chk[]')" />
	<input type="button" value="선택반전" onclick="checkboxSelectQue(3,'chk[]')" />
	<br />
	<label><input class="w3-check" type="checkbox" name="chk[]" value="1" />&nbsp 팝/재즈 &nbsp</label>
	<label><input class="w3-check" type="checkbox" name="chk[]" value="2" />&nbsp 하우스/클럽 &nbsp</label>
	<label><input class="w3-check" type="checkbox" name="chk[]" value="3" />&nbsp 발라드 &nbsp</label>
	<label><input class="w3-check" type="checkbox" name="chk[]" value="4" />&nbsp 댄스 &nbsp</label>
	<label><input class="w3-check" type="checkbox" name="chk[]" value="5" />&nbsp 랩/힙합 &nbsp</label>
	<label><input class="w3-check" type="checkbox" name="chk[]" value="6" />&nbsp R&B/Soul &nbsp</label>
	<label><input class="w3-check" type="checkbox" name="chk[]" value="7" />&nbsp 인디음악 &nbsp</label>
	<label><input class="w3-check" type="checkbox" name="chk[]" value="8" />&nbsp 일렉트로니카 &nbsp</label>
	<label><input class="w3-check" type="checkbox" name="chk[]" value="9" />&nbsp 락/메탈&nbsp</label>
	<label><input class="w3-check" type="checkbox" name="chk[]" value="10" />&nbsp 클래식/기타 &nbsp</label>
	  
	<br /><br />
 	
 	<script>
		function checkboxSelectQue(n,obj) {
		    var i;
		    var chk = document.getElementsByName(obj);
		    var tot = chk.length;
		    for (i = 0; i < tot; i++) {
		        if (n == 1) chk[i].checked = true;
		        if (n == 2) chk[i].checked = false;
		        if (n == 3) chk[i].checked = !chk[i].checked;
		    }
		}
		 
		function checkboxSelectCount(obj) {
		    var i, sum=0, tag=[], str="";
		    var chk = document.getElementsByName(obj);
		    var tot = chk.length;
		    for (i = 0; i < tot; i++) {
		        if (chk[i].checked == true) {
		            tag[sum] = chk[i].value;
		            sum++;
		        }
		    }
		    str += "선택갯수 : "+sum;
		    if(tag.length > 0) str += "\n값 : "+tag.join(",");
		    alert(str);
		}
</script>
    <button class="w3-btn w3-blue" type="submit">등록</button>
	<button class="w3-btn w3-blue" type="button" onclick="javascript:location.href='/myplay/list'">취소</button>
  </form>
	</div>
</div>