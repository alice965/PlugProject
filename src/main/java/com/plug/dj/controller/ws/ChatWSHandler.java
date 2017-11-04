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
	
	@Autowired
	com.plug.dj.model.MemberDao mDao; 
	
	@PostConstruct //�� ���� init-method
	public void chatWSInit() {
		System.out.println("ChatWsHandler..chatInit");
		list= new ArrayList<WebSocketSession>();
	}
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		///////////�г��� ������ ����  �ڵ�/////////////
		Map<String, Object> sessionWhat = session.getAttributes();
		String userId=(String)sessionWhat.get("auth_id");
		
		Map mmap=mDao.readOneById(userId);
		System.out.println("ä�ù濡�� ������ ����"+mmap);
		String nickname = (String) mmap.get("NICKNAME");
		////////////�г��� ������ ��////////////////
		
		list.add(session); //����Ʈ�� ������ ��� �־��. size�ϸ� ���� ������ ����.
		
			
		///////////////���縦 ����غ��ô�///////////////////////////
		
		
		//ȭ������ ���� json ����
		String json = String.format("{\"mode\":\"join\", \"cnt\":%d ,\"user\" : \"%s\"}", list.size(),
				nickname);
		for(WebSocketSession wss : list) {
			if(wss != session) {
				wss.sendMessage(new TextMessage(json));
			} 
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
///////////�г��� ������ ����  �ڵ�/////////////
		Map<String, Object> sessionWhat = session.getAttributes();
		String userId=(String)sessionWhat.get("auth_id");
		
		Map mmap=mDao.readOneById(userId);
		String nickname = (String) mmap.get("NICKNAME");
		////////////�г��� ������ ��////////////////
		
		list.remove(session);
		String json = String.format("{\"mode\":\"exit\", \"cnt\":%d ,\"user\" : \"%s\"}", list.size(), nickname);
		for (WebSocketSession wss : list) {
				wss.sendMessage(new TextMessage(json));
		}
		
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		///////////�г��� ������ ����  �ڵ�/////////////
		Map<String, Object> sessionWhat = session.getAttributes();
		String userId=(String)sessionWhat.get("auth_id");
		
		Map mmap=mDao.readOneById(userId);
		String nickname = (String) mmap.get("NICKNAME");
		////////////�г��� ������ ��////////////////
		
		/////���縦 ������ ���� �ڵ�//////////
		String url=(String) mmap.get("URL");
		
		Map map = new HashMap<>();
		map.put("mode", "chat");
		map.put("sender", nickname);
		map.put("msg", message.getPayload());
		map.put("cnt", list.size());
		map.put("url", url);
	
		String json = mapper.writeValueAsString(map);
		
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

