package com.plug.dj.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
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
	public ModelAndView ProfileHandle(HttpSession session, Model model) {
		String id=(String) session.getAttribute("auth_id");
		Map profilelist = memberDao.readLatestProfileById(id);
		ModelAndView mav = new ModelAndView("t_expr");
		mav.addObject("section", "/my/profile");
		mav.addObject("profile", profilelist);
		System.out.println("profilelist : " + profilelist);

		return mav;
	}

	@PostMapping("/profile")
	public String ProfilePostHandle(@RequestParam Map map, HttpSession session, Model model) {
		try {
			String id = (String) session.getAttribute("auth_id");
			//null설정해주기 위해서 map에서 get해서 따로 저장해주기.
			String gender = (String)map.get("gender");
			String[] genre = (String[]) map.get("genre");
			System.out.println(Arrays.toString(genre));
			map.put("id", id);
			map.put("gender", gender);
			map.put("genre", Arrays.toString(genre));
			System.out.println(map);
			memberDao.updateOneDetail(map);
			return "redirect:/my/profile";
		} catch (Exception e) {
			e.printStackTrace();	
			return "t_expr";
		}
	}
	
	

	@GetMapping("/mybooth")
	public ModelAndView BoothHandle(HttpSession session, Model model) {
		String id=(String) session.getAttribute("auth_id");
		Map profilelist = memberDao.readLatestProfileById(id);
		ModelAndView mav = new ModelAndView("t_expr");
		mav.addObject("section", "/my/mybooth");
		mav.addObject("profile", profilelist);
		System.out.println("profilelist : " + profilelist);

		return mav;
	}

	@PostMapping("/mybooth")
	public String BoothPostHandle(@RequestParam Map map, HttpSession session, Model model) {
		try {
			String id = (String) session.getAttribute("auth_id");
			//null설정해주기 위해서 map에서 get해서 따로 저장해주기.
			String gender = (String)map.get("gender");
			String[] genre = (String[]) map.get("genre");
			System.out.println(Arrays.toString(genre));
			map.put("id", id);
			map.put("gender", gender);
			map.put("genre", Arrays.toString(genre));
			System.out.println(map);
			memberDao.updateOneDetail(map);
			return "redirect:/my/mybooth";
		} catch (Exception e) {
			e.printStackTrace();	
			return "t_expr";
		}
	}
	
	@GetMapping("/alarm")
	public ModelAndView AlarmHandle(HttpSession session, Model model) {
		String id=(String) session.getAttribute("auth_id");
		Map profilelist = memberDao.readLatestProfileById(id);
		ModelAndView mav = new ModelAndView("t_expr");
		mav.addObject("section", "/my/alarm");
		mav.addObject("profile", profilelist);
		System.out.println("profilelist : " + profilelist);

		return mav;
	}

	@PostMapping("/alarm")
	public String AlarmPostHandle(@RequestParam Map map, HttpSession session, Model model) {
		try {
			String id = (String) session.getAttribute("auth_id");
			//null설정해주기 위해서 map에서 get해서 따로 저장해주기.
			String gender = (String)map.get("gender");
			String[] genre = (String[]) map.get("genre");
			System.out.println(Arrays.toString(genre));
			map.put("id", id);
			map.put("gender", gender);
			map.put("genre", Arrays.toString(genre));
			System.out.println(map);
			memberDao.updateOneDetail(map);
			return "redirect:/myalarm";
		} catch (Exception e) {
			e.printStackTrace();	
			return "t_expr";
		}
	}
	
	
	
	@SuppressWarnings("rawtypes")
	@PostMapping("/pic_update")
	public ModelAndView profilePostHandle(@RequestParam(name = "profile") MultipartFile f, HttpSession session)
			throws InterruptedException {
		String id = (String) session.getAttribute("auth_id");
		String nickname = (String) session.getAttribute("auth_nickname");
		boolean rst = false;
		String fmt = sdf.format(System.currentTimeMillis());

		String fileName = nickname + "_" + fmt + 
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
			Map data = new HashMap<>();
			data.put("id", id);
			data.put("url", "/profiles/" + fileName);
			memberDao.updateOneProfile(data);
			System.out.println(data);
		}

		ModelAndView mav = new ModelAndView("redirect:/my/profile");
		mav.addObject("rst", rst);

		return mav;
	}
}

