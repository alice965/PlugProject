package com.plug.dj.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
			map.put("flag", "true");
			map.put("url", "/profiles/default.png");
			System.out.println(map);
			boolean b = memberDao.addOne(map);
			return "redirect:/login";
			
		} catch (Exception e) {
			int countid = memberDao.checkById((String)map.get("id"));
			int countnick = memberDao.checkByNickname((String)map.get("nickname"));
			System.out.println( countid + ".." + countnick);
			
			if(countid >= 1 && countnick >= 1 ){
				model.addAttribute("alertid", "같은 계정명이 있습니다.");
				System.out.println("같은 계정명");
				model.addAttribute("alertnick", "같은 닉네임이 있습니다.");	
				System.out.println("같은 닉네임");
			}else if(countid >=1){
				model.addAttribute("alertid", "같은 계정명이 있습니다.");
				System.out.println("같은 계정명");
			}else{
				model.addAttribute("alertnick", "같은 닉네임이 있습니다.");	
				System.out.println("같은 닉네임");
			}

			model.addAttribute("temp", "1");
			model.addAttribute("section", "join");
			return "t_expr";
		}
	}
}
