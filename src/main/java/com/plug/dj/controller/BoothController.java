package com.plug.dj.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.WebSocketSession;

import com.plug.dj.controller.ws.BoothWSHandler;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
@Controller
@RequestMapping("/booth")
public class BoothController {
	@Autowired
	com.plug.dj.model.BoothDao BoothDao; 
	@Autowired
	BoothWSHandler boothws;
	
	@RequestMapping(path="view")
	public ModelAndView BoothViewHandle(WebSocketSession session) throws SQLException{
		ModelAndView mav = new ModelAndView("t_expr");
		mav.addObject("section", "booth/view");
		return mav;
		}
	
	@RequestMapping("/list")
	public ModelAndView BoothListHandle(@RequestParam(name="page", defaultValue="1" ) int page, @RequestParam Map param)throws SQLException {
		ModelAndView mav = new ModelAndView("t_expr");
		List<Map> list = BoothDao.listAll();
		mav.addObject("section", "/booth/list");
		mav.addObject("list", list);
		mav.addObject("cnt", list.size());
		
		return mav;
	}
	
	
	@RequestMapping("/list_copy")
	public ModelAndView BoothListCopyHandle(@RequestParam(name="page", defaultValue="1" ) int page, @RequestParam Map param)throws SQLException {
		ModelAndView mav = new ModelAndView("t_expr");
		List<Map> list = BoothDao.listAll();
		mav.addObject("section", "/booth/list_copy");
		mav.addObject("list", list);
		mav.addObject("cnt", list.size());
		
		return mav;
	}
	
	@RequestMapping("/listJSON")
	public ModelAndView BoothListJSONHandle(HttpSession session)throws SQLException {
		String id=(String) session.getAttribute("auth_id");
		List<Map> list = BoothDao.listAll();
		System.out.println("list : "+ list);		
		ModelAndView mav = new ModelAndView("json");
		mav.addObject("section", "/booth/listJSON");
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(path="boothpage/{num}")
	public ModelAndView BoothPageHandle(@PathVariable String num) throws SQLException{
		ModelAndView mav = new ModelAndView("t_expr");
		Map one=BoothDao.readOne(num);
		BoothDao.increaseCnt(num);
		System.out.println("one???"+one);
		mav.addObject("section", "booth/boothpage");
		mav.addObject("one", one);
		
		return mav;
		}
	
}
