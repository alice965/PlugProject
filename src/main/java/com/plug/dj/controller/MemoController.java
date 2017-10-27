package com.plug.dj.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;


import com.plug.dj.model.MemoDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/memo")
public class MemoController {
	@Autowired
	MemoDao memoDao;

	@GetMapping("/send")
	public String memoHandle(Map map) {
		map.put("section", "memo/send");
		return "t_pop";
	}
	

	@PostMapping("/send")
	public String addPost(@RequestParam Map param, Map model, HttpSession session) {
		try {
			param.put("sender", session.getAttribute("auth_id"));
			int r = memoDao.addNewMemo(param);


		} catch (Exception e) {
	
		}
		model.put("section", "memo/send");
		return "t_expr";
	}


	

}
