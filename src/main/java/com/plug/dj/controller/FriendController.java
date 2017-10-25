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

import com.fasterxml.jackson.databind.ObjectMapper;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
@Controller
@RequestMapping("/friend")
public class FriendController {
	@Autowired
	ObjectMapper mapper;
	
	@Autowired
	com.plug.dj.model.FriendDao fDao; 
		
	
	@GetMapping("/check")
	@RequestMapping(path = "/check", method = RequestMethod.GET)
	public String FriendCheckGetHanle(Map map, @RequestParam Map param, HttpSession session) {
		map.put("section", "friend/check");
		param.put("one", session.getAttribute("auth_id") );
		Map data=new HashMap();
		Map pmap = mapper.convertValue(param, Map.class);
		
		data=fDao.readOne(param);
		System.out.println("data : " + data);
		
		if(data.get("OTHER").equals(pmap.get("other"))) {
			return "redirect:/friend/exist?other="+data.get("OTHER");
		}else {
			return "redirect:/friend/add?other="+data.get("OTHER");
		}
	}
	@GetMapping("/exist")
	@RequestMapping(path = "/exist", method = RequestMethod.GET)
	public String FriendExitGetHanle(Map map, @RequestParam Map param, HttpSession session) {
		param.put("one", session.getAttribute("auth_id") );
		map.put("section", "friend/exist");
		Map data=new HashMap();
		data=fDao.readOne(param);
		map.put("data", data);
		
		return "t_pop";
	}
	
	@GetMapping("/add")
	@RequestMapping(path = "/add", method = RequestMethod.GET)
	public String FriendAddGetHanle(Map map, @RequestParam Map param, HttpSession session) {
		//화면 출력
		map.put("section", "friend/add");
		//세션 아이디 가져와서 파라미터 추가
		param.put("one", session.getAttribute("auth_id") );
		//add 페이지에 넘길 데이터 세팅
		Map data=new HashMap();
		data=fDao.readOne(param);
		map.put("data", data);
		return "t_pop";
	}
	
	@PostMapping("/add")
	@RequestMapping(path = "/add", method = RequestMethod.POST)
	public String PlayAddPostHandle(@RequestParam Map param, ModelMap map, HttpSession session) throws SQLException {
		param.put("one", session.getAttribute("auth_id") );
		System.out.println("param? : "+param);
		int rst = fDao.add(param);
		if (rst == 1) {
			map.put("section", "/friend/add");
			return "redirect:/friend/add";
		}
		map.put("rst1", rst);
		return "/friend/add";
	}
}
