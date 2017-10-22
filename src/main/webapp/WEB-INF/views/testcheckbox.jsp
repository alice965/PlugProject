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
	<input type="hidden" id="val" name="values">
	<input type="submit" value="전송" onclick="test_chkbox()">
	<div id="strval"></div>
</form>

<form action="/testcheckbox" method="post">
</form>

</div>

<script>
	function test_chkbox(){
		var values=document.getElementsByName("genre");
		var arr= new Array();
		console.log(values);
		for(var i=0; i<values.length; i++){
			if(values[i].checked){
				console.log(values[i].value);
				arr.push(values[i].value);
			}
		}
		console.log(arr);
		document.getElementById("strval").innerHTML=arr;
		console.log(document.getElementById("strval").innerHTML);
		document.getElementById("val").val=arr;
		console.log("밸류 : "+document.getElementById("val").val);
	}

</script>