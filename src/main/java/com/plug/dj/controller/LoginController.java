package com.plug.dj.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.plug.dj.model.MemberDao;

@Controller
public class LoginController {
	@Autowired
	MemberDao memberDao;
	
	@GetMapping("/login")
	public String loginHandle(Model model) {
		model.addAttribute("section", "login");
		return "t_expr";
	}
	
	@PostMapping("/login")
	public ModelAndView sessionHandle(@RequestParam Map param, HttpSession session,  HttpServletResponse response,
			@RequestParam(name="redirect", required=false) String url) throws SQLException {
		ModelAndView mav = new ModelAndView();
		int t = memberDao.existOne(param);
		if (t == 1) {
			HashMap u = memberDao.readOneById((String)param.get("id"));
			System.out.println(t);
			session.setAttribute("auth", u);
			session.setAttribute("auth_id", u.get("ID"));
			session.setAttribute("auth_nickname", u.get("NICKNAME"));
			System.out.println("["+url+"]"+u.get("NICKNAME"));
			if((String)param.get("keep") != null){ //�α��� ���� üũ��.
			 Cookie c = new Cookie("keep", (String)u.get("ID")); //������� �̸��Ϸ� ��Ű ����.
			 c.setMaxAge(60*60*24*7) ;
			 c.setPath("/");
			 response.addCookie(c);
			}
			if(url != null) {
				mav.setViewName("redirect:"+url);
			}else {
				mav.setViewName("redirect:/");
			}
		} else {
			mav.setViewName("t_expr");
			mav.addObject("section", "login");
			mav.addObject("temp", "temp");
			/*
			mav.setViewName("redirect:/login");
			mav.addObject("mode", "f");
			*/
		}
		return mav;
	}
	
	@GetMapping("/logout")
	public String logoutHandle(HttpSession session, HttpServletResponse response){
		session.invalidate(); //������� ���� �ʱ�ȭ
		Cookie c = new Cookie("keep", ""); 
		c.setPath("/");
		c.setMaxAge(0);
		response.addCookie(c);
		return "redirect:/";
	}
}
