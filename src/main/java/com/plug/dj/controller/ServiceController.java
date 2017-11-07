package com.plug.dj.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.plug.dj.model.MemberDao;

@Controller
@RequestMapping("/service")
public class ServiceController {
	@Autowired
	MemberDao memberDao;
	@Autowired
	JavaMailSender sender;

	@GetMapping("/findpass")
	public String findGetHandle(Model model){
		model.addAttribute("section", "/service/findpass");
		return "t_expr";		
	}
	
	//비밀번호 찾기 : 인증번호 보내기
	@PostMapping("/findpass")
	public ModelAndView findPostHandle(@RequestParam(name="id") String id, Model model) throws AddressException, MessagingException{
		ModelAndView mav = new ModelAndView("t_expr");
		System.out.println("인증받을 이메일 : " + id);
		if(memberDao.checkById(id) >= 1){ //이미 아이디가 있는 경우..
			String uuid = UUID.randomUUID().toString();
			String auth_str = uuid.toString().substring(0,8);
			MimeMessage msg = sender.createMimeMessage();
			msg.setRecipient(RecipientType.TO, new InternetAddress(id));
			msg.setSubject("PLUG.DJ임시비밀번호");
			String text = "임시 비밀번호입니다. 비밀번호를 변경해주세요.\n";
			text += auth_str;
			msg.setText(text, "UTF-8", "html");
			sender.send(msg);
			
			Map map = new HashMap<>();
			map.put("id", id);
			map.put("auth_str", auth_str);
			memberDao.findPass(map); //auth_str로 비밀번호 변경..
			
			mav.addObject("haveId", "true"); //아이디가 있을 경우
			mav.addObject("section", "/my/changepass");
		}else{ 
			System.out.println("피드백 내용 없음");
			mav.addObject("checkId", "false"); //아이디가 없을 경우
			mav.addObject("section", "/service/findpass");
		}
		
		return mav;
	}
	
	@GetMapping("/keynum")
	public String keyGetHandle(Model model){
		model.addAttribute("section", "/service/keynum");
		return "t_expr";		
	}
	

	

	
}
