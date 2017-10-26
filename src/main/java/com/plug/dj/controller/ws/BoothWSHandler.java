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
		//Ŭ���̾�Ʈ������ ������ �߻����� ��
		System.out.println("boothws:: afterConnectionEstablished");
		String msg="ȯ���մϴ�.";
		session.sendMessage(new TextMessage(msg));
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//Ŭ���̾�Ʈ ������ ������ ���� �Ǿ�����
		System.out.println("afterConnectionClosed");
		//��񿡼� ������ ���̵� ����, ī���� -1
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//Ŭ���̾�Ʈ�κ��� send�� �߻� ( ������ ���۹޾��� ��)
		System.out.println("handleTextMessage");
		String m = message.getPayload(); //������ �����Ų �� ��ܿ��� ���
		System.out.println("���ŵ� ���� : " + m);
	}
}
