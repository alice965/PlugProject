<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
test

<script>
var url=location.hostname;
	var ws = new WebSocket("ws://"+url+"/ws/booth");
	//var ws = new WebSocket("ws://192.168.219.103/ws/booth");
	ws.onopen = function(e){
		var obj = JSON.parse(e.data);
		console.log(obj);
	}

</script>