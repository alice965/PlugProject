package com.plug.dj.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
@RequestMapping("/myplay")
public class myPlayController {
	@Autowired
	com.plug.dj.model.PlayListDao productDao; 
	
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
			int r = productDao.addNew(param);
			model.put("rst", r);
			return "redirect:/product/all";
		}catch (Exception e) {
			model.put("rst", -1);
			model.put("section", "product/add");
			return "t_expr";
		}
	}
}
