package com.plug.dj.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
@Controller
@RequestMapping("/myplay")
public class myPlayController {
	@Autowired
	com.plug.dj.model.PlayListDao playlistDao; 
	
	@RequestMapping("/list")
	public ModelAndView rootHandle() {
		ModelAndView mav = new ModelAndView("t_expr");
			mav.addObject("section", "/myplay/list");
		return mav;
	}
	
	@GetMapping("/add")
	public String addGetHanle(Map map) {
			map.put("section", "/myplay/add");
		return "t_expr";
	}
	
	@PostMapping("/add")
	public String addPost(@RequestParam Map param, Map model) {
		try {
			boolean r = playlistDao.add(param);
			model.put("rst", r);
			return "redirect:/playlist/list";
		}catch (Exception e) {
			model.put("rst", -1);
			model.put("section", "playlist/add");
			return "t_expr";
		}
	}
}
