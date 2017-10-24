<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div style="background-color:white;">
	<form action="/testcheckbox" method="post">
		선택하시오 <br>
		<input type="checkbox" name="genre" value="jazz"> 재즈
		<input type="checkbox" name="genre" value="pop"> 팝
		<input type="checkbox" name="genre" value="hiphop"> 힙합
		<input type="checkbox" name="genre" value="kpop"> 케이팝
		<br>
		<input type="submit" value="전송">
	</form>
</div>

