package com.plug.dj.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.plug.dj.model.MemoDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
			System.out.println(e);
		}
		model.put("section", "memo/send");
		return "t_pop";
	}
	// ============================↑쪽지보내기

	// ============================↓쪽지불러오기

	@GetMapping("/show/{num}")
	public ModelAndView showHandle(@PathVariable String num) {
		ModelAndView mav = new ModelAndView("t_expr");
		mav.addObject("section", "memo/show");
		mav.addObject("one", memoDao.readOne(num));
		return mav;
	}

	
	@GetMapping("/sendlist")
	public ModelAndView sendListHandle() {
		ModelAndView mav = new ModelAndView("t_expr");
		mav.addObject("section", "memo/sendlist");
		mav.addObject("data", memoDao.SendList());
		return mav;
	}

	
	@GetMapping("/receivelist")
	public ModelAndView receiverListHandle() {
		ModelAndView mav = new ModelAndView("t_expr");
		mav.addObject("section", "memo/receivelist");
		mav.addObject("data", memoDao.ReceiveList());
		return mav;
	}
}
