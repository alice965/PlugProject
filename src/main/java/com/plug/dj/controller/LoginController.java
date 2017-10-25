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
		param.put("flag", "true");
		int t = memberDao.existOne(param); //파라미터로 전송된 아이디와 비밀번호 일치하는 것 1개 있는지 확인.
		if (t == 1) {
			HashMap u = memberDao.readOneById((String)param.get("id")); //readOneById로 아이디와 닉네임을 setAttribute하기
			System.out.println(t);
			session.setAttribute("auth", u);
			session.setAttribute("auth_id", u.get("ID"));
			session.setAttribute("auth_nickname", u.get("NICKNAME"));
			System.out.println("["+url+"]"+u.get("NICKNAME"));
			if((String)param.get("keep") != null){ //로그인 유지 체크시.
			 Cookie c = new Cookie("keep", (String)u.get("ID")); //사용자의 이메일로 쿠키 만듬.
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
		session.invalidate(); //사용자의 세션 초기화
		Cookie c = new Cookie("keep", ""); 
		c.setPath("/");
		c.setMaxAge(0);
		response.addCookie(c);
		return "redirect:/";
	}
}
