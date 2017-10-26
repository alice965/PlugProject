package com.plug.dj.controller.ws;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component("boothws")
public class BoothWSHandler extends TextWebSocketHandler{
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//클라이언트측에서 연결이 발생했을 때
		System.out.println("boothws:: afterConnectionEstablished");
		String msg="환영합니다.";
		session.sendMessage(new TextMessage(msg));
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//클라이언트 측에서 연결이 해제 되었을때
		System.out.println("afterConnectionClosed");
		//디비에서 입장한 아이디 삭제, 카운터 -1
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//클라이언트로부터 send가 발생 ( 데이터 전송받았을 때)
		System.out.println("handleTextMessage");
		String m = message.getPayload(); //웹소켓 센드시킨 거 당겨오는 기능
		System.out.println("수신된 내용 : " + m);
	}
}
