package com.plug.dj.controller;

import java.util.Map;

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

import com.plug.dj.model.MemberDao;

@Controller
@RequestMapping("/service")
public class ServiceController {
	@Autowired
	MemberDao memberDao;
	@Autowired
	JavaMailSender sender;

	@GetMapping("/changepass")
	public String changeGetHandle(Model model) {
		model.addAttribute("section", "/service/changepass");
		return "t_expr";
	}  
	
	@PostMapping("/changepass")
	public String changePostHandle(@RequestParam Map map, HttpSession session, Model model) {
		try {
			System.out.println(map);
			String now = (String)map.get("now");
			String change = (String)map.get("change");
			if(now.equals(change)){
			model.addAttribute("same","1");
			model.addAttribute("section", "/service/changepass");
			return "t_expr";
			}else{
			String id = (String) session.getAttribute("auth_id");
			map.put("id", id);
			boolean b = memberDao.updatePass(map);
			System.out.println("��й�ȣ ���� : " + b);
			return "redirect:/my/profile";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("tempchangepass", "1");
			model.addAttribute("section", "/service/changepass");
			return "t_expr";
		}
	}
	
	@GetMapping("/out")
	public String outGetHandle(Model model) {
		model.addAttribute("section", "/service/out");
		return "t_expr";
	} 
	
	@PostMapping("/out")
	public String outPostHandle(@RequestParam Map map, HttpSession session, 
			HttpServletResponse response, Model model) {
		try{
			map.put("id", (String)session.getAttribute("auth_id"));
		System.out.println(map);
		String feedback = (String)map.get("feedback");
		if(feedback.length()>=1){  //null�� �ƴ� �� ���Ϸ� �ǵ�鳻�� ����.
			MimeMessage msg = sender.createMimeMessage();
			msg.setRecipient(RecipientType.TO, new InternetAddress("csrom0128@gmail.com"));
			msg.setSubject("Plug.Dj.Feedback");
			String text = "<h1>Ż��ȸ���� �ǵ�� �����Դϴ�.</h1>";
			text += feedback;
			text += "<a href=\"http://192.168.10.81\">����Ʈ �̵�</a>";
			msg.setText(text, "UTF-8", "html");
			System.out.println("�ǵ�� ���� ����");
			
			sender.send(msg);
		}else{
			System.out.println("�ǵ�� ���� ����");
		}
		map.put("flag", "false"); //ȸ��Ż��� flag���� false�� �ٲ�.
		session.setAttribute("auth", null); //�湮�ڷ� �ٲ��ְ�
		 Cookie c = new Cookie("keep", "ȸ��Ż��"); //������� ���̵�(�̸���)�� �־ 
		 				//�����ߴ� keep��Ű�� ȸ��Ż�� ������ �־ ���(�ð��� 0����)
		 c.setMaxAge(0) ;
		 c.setPath("/");
		 response.addCookie(c);	 
		memberDao.updateOutFlag(map);
		return "redirect:/";
		}catch(Exception e){
			e.printStackTrace();
			model.addAttribute("section", "/service/out");
			return "t_expr";
		}
	}
	
}
