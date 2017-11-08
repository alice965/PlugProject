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
	
	//��й�ȣ ã�� : ������ȣ ������
	@PostMapping("/findpass")
	public ModelAndView findPostHandle(@RequestParam(name="id") String id, Model model) throws AddressException, MessagingException{
		ModelAndView mav = new ModelAndView("t_expr");
		System.out.println("�������� �̸��� : " + id);
		if(memberDao.checkById(id) >= 1){ //�̹� ���̵� �ִ� ���..
			String uuid = UUID.randomUUID().toString();
			String auth_str = uuid.toString().substring(0,8);
			MimeMessage msg = sender.createMimeMessage();
			msg.setRecipient(RecipientType.TO, new InternetAddress(id));
			msg.setSubject("PLUG.DJ�ӽú�й�ȣ");
			String text = "�ӽ� ��й�ȣ�Դϴ�. ��й�ȣ�� �������ּ���.\n";
			text += auth_str;
			msg.setText(text, "UTF-8", "html");
			sender.send(msg);
			
			Map map = new HashMap<>();
			map.put("id", id);
			map.put("auth_str", auth_str);
			memberDao.findPass(map); //auth_str�� ��й�ȣ ����..
			
			mav.setViewName("redirect:/my/changepass");
		}else{ 
			System.out.println("�ǵ�� ���� ����");
			mav.addObject("checkId", "false"); //���̵� ���� ���
			mav.addObject("section", "/service/findpass");
		}
		
		return mav;
	}
}
