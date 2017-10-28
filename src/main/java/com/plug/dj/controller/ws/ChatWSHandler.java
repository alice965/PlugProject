package com.plug.dj.controller.ws;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

@Component("chatws")

public class ChatWSHandler extends TextWebSocketHandler {
	List<WebSocketSession> list ;
	@Autowired
	ObjectMapper mapper;
	
	@PostConstruct //�� ���� init-method
	public void chatWSInit() {
		System.out.println("ChatWsHandler..chatInit");
		list= new ArrayList<WebSocketSession>();
	}
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("afterConnectionEstablished");
		System.out.println("session??" + session);
		list.add(session);
		//Ŀ�ؼ��� ���涧 ī��Ʈ ���� ��.
		String json = String.format("{\"mode\":\"join\", \"cnt\":%d ,\"user\" : \"%s\"}", list.size(),
				"�����" + session.getId());
			//System.out.println(json +" at afterConnectionEstablished." );
		for(WebSocketSession wss : list) {
			if(wss != session) {
				wss.sendMessage(new TextMessage(json));
			} 
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionClosed");
		list.remove(session);
		String json = String.format("{\"mode\":\"exit\", \"cnt\":%d ,\"user\" : \"%s\"}", list.size(),"�����" + session.getId());
			//System.out.println(json + " at afterConnectionEstablished.");
		for (WebSocketSession wss : list) {
				wss.sendMessage(new TextMessage(json));
		}
		
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("handleTextMessage");
		//System.out.println("message?????????" +message);
		
		Map map = new HashMap<>();
		map.put("mode", "chat");
		map.put("sender", "����� :"+session.getId());
		map.put("msg", message.getPayload());
		map.put("cnt", list.size());
	
		String json = mapper.writeValueAsString(map);
			//System.out.println(json);
		
		for(WebSocketSession wss: list) {
			wss.sendMessage(new TextMessage(json));
		}
		
		
		//String m = message.getPayload();
		//String id = session.getId(); //HttpSession ID�� �ƴϰ�, �ڵ����� 1�� ���� ����
		
		
		////////// �׽�Ʈ �ڵ� /////////////////
		
//		String receiveMessage=message.getPayload(); 				// Ŭ���̾�Ʈ���� ���� �޽��� 
//		
//		String [] arrMessage=receiveMessage.split(",");
//		String id=arrMessage[1];
//		String nickname=arrMessage[2];
//		
//		boolean enter = receiveMessage.startsWith("userinfo,");		//����ڿ��Լ� ���� �޽����� "userinfo,"�� �����ϴ°�
//		
//		
//		if(enter) {
//			Map map = new HashMap<>();
//			map.put("mode", "info");
//			map.put("id", id);
//			map.put("nickname", nickname);
//		
//			String json = mapper.writeValueAsString(map);
//				//System.out.println(json);
//			
//			for(WebSocketSession wss: list) {
//				wss.sendMessage(new TextMessage(json));
//			}
//			
//		}else {
//			Map map = new HashMap<>();
//			map.put("mode", "chat");
//			map.put("sender", "����� :"+session.getId());
//			map.put("msg", message.getPayload());
//			map.put("cnt", list.size());
//		
//			String json = mapper.writeValueAsString(map);
//				//System.out.println(json);
//			
//			for(WebSocketSession wss: list) {
//				wss.sendMessage(new TextMessage(json));
//			}
//			
//			
//			//String m = message.getPayload();
//			//String id = session.getId(); //HttpSession ID�� �ƴϰ�, �ڵ����� 1�� ���� ����
//		}
		
		
		//////////�׽�Ʈ�ڵ� ��///////////////////////
	}

}
