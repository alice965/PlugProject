package com.plug.dj.controller;

import java.util.HashMap;
import java.util.List;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
@Controller
@RequestMapping("/myplay")
public class myPlayController {
	@Autowired
	com.plug.dj.model.PlayListDao playlistDao; 
	
	@RequestMapping("/list")
	public ModelAndView PlayListHandle()throws SQLException {
		List<Map> list = playlistDao.list();
		
		ModelAndView mav = new ModelAndView("t_expr");
		mav.addObject("section", "myplay/list");
		mav.addObject("list", list);
		return mav;
	}
	@GetMapping("/add")
	@RequestMapping(path = "/add", method = RequestMethod.GET)
	public String PlayaddGetHanle(Map map) {
			map.put("section", "/myplay/add");
		return "t_expr";
	}
	
	@PostMapping("/add")
	@RequestMapping(path = "/add", method = RequestMethod.POST)
	public String PlayAddPostHandle(@RequestParam Map param, ModelMap map, HttpSession session) throws SQLException {
		param.put("id", session.getAttribute("auth_id"));
		int rst = playlistDao.add(param);
		if (rst == 1) {
			map.put("section", "/myplay/list");
			return "redirect:/myplay/list";
		}
		map.put("rst1", rst);
		return "/myplay/add";
	}
	
	@RequestMapping(path="view/{num}")
	public ModelAndView PlayViewHandle(@PathVariable String num) throws SQLException{
		ModelAndView mav = new ModelAndView("t_expr");
		Map one=playlistDao.readOne(num);
		mav.addObject("section", "myplay/view");
		mav.addObject("one", one);
		
		return mav;
		}
	@RequestMapping(path="/delete/{num}")
	public String PlayDeleteHandle(@PathVariable String num) throws SQLException{
		int r=playlistDao.delete(num);
		return "redirect:/myplay/list";
		}
	
	@GetMapping("/edit")
	public String PlayEditGetHanle(Model model, @RequestParam(name="num") String num ) {
			Map map = playlistDao.readOne(num);
			model.addAttribute("section", "myplay/edit");
			model.addAttribute("map", map);
		return "t_expr";
	}
	
	@PostMapping("/edit")
	public String PlayEditPostHanle(@RequestParam Map param, Model model) {
		int r = playlistDao.edit(param);
		if(r==1) {
			model.addAttribute("section", "myplay/edit");
			return "t_expr";
		}
		return "t_expr";
	}
}
