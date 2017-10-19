package com.plug.dj.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	@RequestMapping(path = "/add", method = RequestMethod.POST)
	public String boardAddPostHandle(@RequestParam Map param, ModelMap map, HttpSession session) throws SQLException {
		param.put("id", session.getAttribute("auth_id"));
		int rst = playlistDao.add(param);
		if (rst == 1) {
			map.put("section", "myplay/list");
			return "redirect:/myplay/list";
		}
		map.put("rst1", rst);

		return "/myplay/add";
	}
}
