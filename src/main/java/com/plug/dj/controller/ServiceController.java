package com.plug.dj.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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

	@GetMapping("/changepass")
	public String ChangegetHandle(Model model) {
		model.addAttribute("section", "/service/changepass");
		return "t_expr";
	}  
	
	@PostMapping("/changepass")
	public String joinPostHandle(@RequestParam Map map, HttpSession session, Model model) {
		try {
			System.out.println(map);
			String now = (String)map.get("now");
			String change = (String)map.get("change");
			if(now.equals(change)){
			model.addAttribute("same","1");
			model.addAttribute("section", "/service/changepass");
			return "t_expr";
			}else{
			String id = (String)session.getAttribute("auth");
			boolean b = memberDao.updatePass(id);
			System.out.println("비밀번호 변경 : " + b);
			return "redirect:/my/profile";
			}
			
		} catch (Exception e) {
			model.addAttribute("tempchangepass", "1");
			model.addAttribute("section", "/service/changepass");
			return "t_expr";
		}
	}
}
