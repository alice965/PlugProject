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
	
	@PostConstruct //빈 설정 init-method
	public void chatWSInit() {
		System.out.println("ChatWsHandler..chatInit");
		list= new ArrayList<WebSocketSession>();
	}
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		///////////닉네임 얻어오기 위한  코드/////////////
		Map<String, Object> sessionWhat = session.getAttributes();
		String userId=(String)sessionWhat.get("auth_id");
		
		Map mmap=mDao.readOneById(userId);
		System.out.println("채팅방에서 가져올 정보"+mmap);
		String nickname = (String) mmap.get("NICKNAME");
		////////////닉네임 얻어오기 끝////////////////
		
		list.add(session); //리스트에 세션을 모두 넣어둠. size하면 현재 세션이 나옴.
		
			
		///////////////프사를 출력해봅시다///////////////////////////
		
		//화면으로 보낼 json 정의
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
///////////닉네임 얻어오기 위한  코드/////////////
		Map<String, Object> sessionWhat = session.getAttributes();
		String userId=(String)sessionWhat.get("auth_id");
		
		Map mmap=mDao.readOneById(userId);
		String nickname = (String) mmap.get("NICKNAME");
		////////////닉네임 얻어오기 끝////////////////
		
		list.remove(session);
		String json = String.format("{\"mode\":\"exit\", \"cnt\":%d ,\"user\" : \"%s\"}", list.size(), nickname);
		for (WebSocketSession wss : list) {
				wss.sendMessage(new TextMessage(json));
		}
		
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		///////////닉네임 얻어오기 위한  코드/////////////
		Map<String, Object> sessionWhat = session.getAttributes();
		String userId=(String)sessionWhat.get("auth_id");
		
		Map mmap=mDao.readOneById(userId);
		String nickname = (String) mmap.get("NICKNAME");
		////////////닉네임 얻어오기 끝////////////////
		
		Map map = new HashMap<>();
		map.put("mode", "chat");
		map.put("sender", nickname);
		map.put("msg", message.getPayload());
		map.put("cnt", list.size());
	
		String json = mapper.writeValueAsString(map);
		
		for(WebSocketSession wss: list) {
			wss.sendMessage(new TextMessage(json));
		}
		
		
		//String m = message.getPayload();
		//String id = session.getId(); //HttpSession ID는 아니고, 자동으로 1씩 증가 설정
		
		
		////////// 테스트 코드 /////////////////
		
//		String receiveMessage=message.getPayload(); 				// 클라이언트에서 받은 메시지 
//		
//		String [] arrMessage=receiveMessage.split(",");
//		String id=arrMessage[1];
//		String nickname=arrMessage[2];
//		
//		boolean enter = receiveMessage.startsWith("userinfo,");		//사용자에게서 받은 메시지가 "userinfo,"로 시작하는가
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
//			map.put("sender", "사용자 :"+session.getId());
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
//			//String id = session.getId(); //HttpSession ID는 아니고, 자동으로 1씩 증가 설정
//		}
		
		
		//////////테스트코드 끝///////////////////////
	}

}

