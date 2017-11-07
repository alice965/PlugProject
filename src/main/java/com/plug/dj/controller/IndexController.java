package com.plug.dj.controller;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.plug.dj.model.BoothDao;
import com.plug.dj.model.TestDao;


@Controller
public class IndexController {
	@Autowired
	TestDao tDao;
	
	@Autowired
	BoothDao bDao;
	
	@RequestMapping({ "/", "/index" })
	public ModelAndView rootHandle() {
		ModelAndView mav = new ModelAndView("t_expr");
			mav.addObject("section", "index");
			List<Map> list = bDao.newFour();
			mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping("/test")
	public ModelAndView testHandle() {
		ModelAndView mav = new ModelAndView("t_expr");
			mav.addObject("section", "test");
		return mav;
	}
	@RequestMapping("/test2")
	public ModelAndView test2Handle() {
		ModelAndView mav = new ModelAndView("t_expr");
			mav.addObject("section", "test2");
		return mav;
	}
	
	@RequestMapping("/modal")
	public ModelAndView modal2Handle() {
		ModelAndView mav = new ModelAndView("t_expr");
			mav.addObject("section", "modal");
		return mav;
	}
	
@GetMapping("/testcheckbox")
	@RequestMapping(path = "/testcheckbox", method = RequestMethod.GET)
	public ModelAndView testChkGetHandle(Map map) {
		ModelAndView mav = new ModelAndView("t_expr");
			mav.addObject("section", "testcheckbox");
			
		return mav;
	}

	@PostMapping("/testcheckbox")
	@RequestMapping(path = "/testcheckbox", method = RequestMethod.POST)
	public ModelAndView testChkGPostHandle(
			@RequestParam(value="genre",required=false) String[] genre, 
			@RequestParam(value="num",required=false) String num,
			ModelMap map, HttpSession session) throws SQLException {
		
		ModelAndView mav = new ModelAndView("t_expr");
		mav.addObject("section", "testcheckbox");
		
		//사용자에게서 받은 체크박스 값을 디비에 저장
		String str = Arrays.toString(genre);		
		String genreval=(str.substring(1,str.length()-1)).trim();
//		System.out.println("트림됬나"+genreval);
//		int rst = tDao.save(genreval);
//		System.out.println("rst : "+rst);
		
		//디비에 있는 값을 체크박스에 표시
		Map tmap = tDao.readOne(num);
		System.out.println(tmap);
		String genre1=(String) tmap.get("GENRE");
		String[] arrGenre=(genre1).split(",");
		System.out.println("arrGenre??"+ Arrays.toString(arrGenre));
		
		map.addAttribute("arrGenre", arrGenre);	
		
		
		return mav;
	}
	
} 
