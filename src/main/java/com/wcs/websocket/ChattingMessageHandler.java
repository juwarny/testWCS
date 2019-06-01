package com.wcs.websocket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.wcs.domain.Chatting;
import com.wcs.domain.ChattingRoom;
import com.wcs.domain.Member;
import com.wcs.repository.ChattingRepository;

@RestController
@RequestMapping("/chatting/*")
public class ChattingMessageHandler {
	private final static String SEND_TO = "/realtime/message";
	private final static String MAPPING_NAME = "/chat";
	
	@Autowired
	ChattingRepository repo;
	
	 @MessageMapping(MAPPING_NAME)
	 @SendTo(SEND_TO)
	 public ChattingMessage talk(ChattingMessage message) throws Exception {
		 	
		 Chatting chat = new Chatting();
		 ChattingRoom chroom = new ChattingRoom();
		 Member member = new Member();
		 
		 chroom.setChrno(message.getChrno());
		 chat.setChroom(chroom);
		 
		 chat.setContext(message.getContext());
		 
		 member.setUid(message.getUid());
		 chat.setMember(member);
		 
		 repo.save(chat);
		 		 
		 return message;
	 }
	    
	    
}
