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
	public String joinGetHandle(Model model) {
		model.addAttribute("section", "join");
		return "t_expr";
	}  

	@PostMapping("/join")
	public String joinPostHandle(@RequestParam Map map, HttpSession session, Model model) {
		try {
			session.setAttribute("auth", map);
			session.setAttribute("auth_id", map.get("id"));
			session.setAttribute("auth_nickname", map.get("nickname"));
			System.out.println(map);
			boolean b = memberDao.addOne(map);
			return "redirect:/";
			
		} catch (Exception e) {
			int countid = memberDao.checkById((String)map.get("id"));
			int countnick = memberDao.checkByNickname((String)map.get("nickname"));
			System.out.println( countid + ".." + countnick);
			
			if(countid >= 1 && countnick >= 1 ){
				model.addAttribute("alertid", "���� �������� �ֽ��ϴ�.");
				System.out.println("���� ������");
				model.addAttribute("alertnick", "���� �г����� �ֽ��ϴ�.");	
				System.out.println("���� �г���");
			}else if(countid >=1){
				model.addAttribute("alertid", "���� �������� �ֽ��ϴ�.");
				System.out.println("���� ������");
			}else{
				model.addAttribute("alertnick", "���� �г����� �ֽ��ϴ�.");	
				System.out.println("���� �г���");
			}

			model.addAttribute("temp", "1");
			model.addAttribute("section", "join");
			return "t_expr";
		}
	}
}
