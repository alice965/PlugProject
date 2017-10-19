package com.plug.dj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/myplay")
public class myPlayController {
	@RequestMapping("/myplaylist")
	public ModelAndView rootHandle() {
		ModelAndView mav = new ModelAndView("t_expr");
			mav.addObject("section", "/myplay/myplaylist");
		return mav;
	}
}
