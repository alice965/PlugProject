package com.plug.dj.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.plug.dj.model.MemberDao;

@Controller
public class JoinController {
	@Autowired
	MemberDao memberDao;

	@GetMapping(path = "/join")
	public String joinGetHandle() {
		return "join";
	}

	@PostMapping("/join")
	public String joinPostHandle(@RequestParam Map map, HttpSession session, Model model) {
		try {
			boolean b = memberDao.addOne(map);
			int a = memberDao.existId(map);
			int a2 = memberDao.existNickname(map);
			if(a<1 && a2<1){
			session.setAttribute("auth", "on");
			return "redirect:/";
			}else{
			return "join";	
			}
		} catch (Exception e) {
			model.addAttribute("temp", map);
			return "join";
		}
	}

}
