package com.plug.dj.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.plug.dj.model.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/my")
public class MyController {
	@Autowired
	MemberDao memberDao;
	@Autowired
	ServletContext application;
	@Autowired
	SimpleDateFormat sdf;

	@GetMapping("/profile")
	public String loginHandle(Model model) {
		model.addAttribute("section", "my/profile");
		return "t_expr";
	}

	@PostMapping("/profile")
	public String ProfilePostHandle(@RequestParam Map map, HttpSession session, Model model) {
		try {
			System.out.println(map.values());
			return "redirect:/";
		} catch (Exception e) {
			e.printStackTrace();
			return "t_expr";
		}
	}
	@SuppressWarnings("rawtypes")
	@PostMapping("/pic_update")
	public ModelAndView profilePostHandle(@RequestParam(name = "profile") MultipartFile f, HttpSession session)
			throws InterruptedException {
		System.out.println(f);
		boolean rst = false;
		
		ModelAndView mav = new ModelAndView("redirect:/my/profile");
		mav.addObject("rst", rst); //¿Ö?

		return mav;
	}
	/*
	@SuppressWarnings("rawtypes")
	@PostMapping("/profile")
	public ModelAndView profilePostHandle(@RequestParam Map map, HttpSession session)
			//@RequestParam(name = "profile") MultipartFile f
			throws InterruptedException {
		System.out.println(map);
		String id = (String) session.getAttribute("auth_id");
		boolean rst = false;
		String fmt = sdf.format(System.currentTimeMillis());
		MultipartFile f = (MultipartFile) map.get("profile");

		String fileName = id + "_" + fmt + 
				f.getOriginalFilename().substring(f.getOriginalFilename().lastIndexOf("."));
		try {
			if (f.isEmpty())
				throw new Exception();
			File dst = new File(application.getRealPath("/profiles"), fileName);
			f.transferTo(dst);
			rst = !rst;
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (rst) {
			map.replace("url", "/profiles/" + fileName);
			memberDao.addProfile(map);
		}

		ModelAndView mav = new ModelAndView("redirect:/my/profile");
		mav.addObject("rst", rst);

		return mav;
	}
	*/
}

