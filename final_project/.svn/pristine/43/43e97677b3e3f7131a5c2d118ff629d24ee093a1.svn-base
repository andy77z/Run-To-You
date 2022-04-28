package kr.or.ddit.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.or.ddit.login.mapper.LoginMapper;

public class EchoHandler extends TextWebSocketHandler {
	private static final Logger logger = 
			LoggerFactory.getLogger(EchoHandler.class);
	
	List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	Map<String, WebSocketSession> userSessions = new HashMap<>();
	
	@Autowired
	LoginMapper loginMapper;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		if(userSessions.get(message.getPayload()) != null) {
			//userId에 원래 웹세션값이 저장되어 있다면 update
			userSessions.replace(message.getPayload(), session);
		} else {
			//userId에 웹세션값이 없다면 put
			userSessions.put(message.getPayload(), session);
		}
		loginMapper.online(message.getPayload());
//		for(WebSocketSession sess: sessionList) {
//			sess.sendMessage(new TextMessage(session.getId()+": "+message.getPayload()));
//		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		for(String key:userSessions.keySet()) {
			if(userSessions.get(key).equals(session)){
				loginMapper.offline(key);
				userSessions.remove(key);
			}
		}
	}
}
