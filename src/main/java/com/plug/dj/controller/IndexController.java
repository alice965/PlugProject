package com.plug.dj.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.plug.dj.model.MemberDao;
import com.plug.dj.model.TestDao;


@Controller
public class IndexController {

	@RequestMapping({ "/", "/index" })
	public ModelAndView rootHandle() {
		ModelAndView mav = new ModelAndView("t_expr");
			mav.addObject("section", "index");
		return mav;
	}
	@RequestMapping("/test")
	public ModelAndView testHandle() {
		ModelAndView mav = new ModelAndView("t_expr");
			mav.addObject("section", "test");
		return mav;
	}
	
	@GetMapping("/testcheckbox")
	@RequestMapping(path = "/testcheckbox", method = RequestMethod.GET)
	public ModelAndView testChkGetHandle(Map map) {
		ModelAndView mav = new ModelAndView("t_expr");
			mav.addObject("section", "testcheckbox");
		return mav;
	}
	@Autowired
	TestDao tDao;
	@PostMapping("/testcheckbox")
	@RequestMapping(path = "/testcheckbox", method = RequestMethod.POST)
	public String testChkGPostHandle(@RequestParam Map param, ModelMap map, HttpSession session) throws SQLException {
		System.out.println("ÆÄ¶÷:"+param);
		int rst = tDao.save(param);
		if (rst == 1) {
			map.put("section", "/testcheckbox");
			return "redirect:/testcheckbox";
		}
		map.put("rst1", rst);
		return "/testcheckbox";
	}
} 
