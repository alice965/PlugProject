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
			System.out.println("비밀번호 변경 : " + b);
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
		if(feedback.length()>=1){  //null이 아닐 때 메일로 피드백내용 보냄.
			MimeMessage msg = sender.createMimeMessage();
			msg.setRecipient(RecipientType.TO, new InternetAddress("csrom0128@gmail.com"));
			msg.setSubject("Plug.Dj.Feedback");
			String text = "<h1>탈퇴회원의 피드백 내용입니다.</h1>";
			text += feedback;
			text += "<a href=\"http://192.168.10.81\">사이트 이동</a>";
			msg.setText(text, "UTF-8", "html");
			System.out.println("피드백 내용 있음");
			
			sender.send(msg);
		}else{
			System.out.println("피드백 내용 없음");
		}
		map.put("flag", "false"); //회원탈퇴시 flag값을 false로 바꿈.
		session.setAttribute("auth", null); //방문자로 바꿔주고
		 Cookie c = new Cookie("keep", "회원탈퇴"); //사용자의 아이디(이메일)를 넣어서 
		 				//생성했던 keep쿠키를 회원탈퇴 내용을 넣어서 덮어씀(시간을 0으로)
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
