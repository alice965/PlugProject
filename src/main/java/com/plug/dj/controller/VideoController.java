package com.plug.dj.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.plug.dj.model.BoothDao;
import com.plug.dj.model.VideoDao;

@Controller
@RequestMapping("/video")
public class VideoController {
	@Autowired
	VideoDao VideoDao;
	BoothDao BoothDao;
	
	@RequestMapping(path="/playlist/{num}")
	public ModelAndView PlaylistHandle(@PathVariable String num) throws SQLException{
		ModelAndView mav = new ModelAndView("t_expr");
		System.out.println(num);
		mav.addObject("section", "video/playlist");
		mav.addObject("num", num);
		
		return mav;
		}
	
	//@GetMapping("/playlist/{num}")
	//public String PlayEditGetHanle(Model model, @PathVariable String num ) {
	//		model.addAttribute("section", "video/playlist");
	//		model.addAttribute("num", num);
	//	return "t_expr";
	//}
	
	//@RequestMapping(path="/playlist/{num}")
	//public ModelAndView BoothPageHandle(@PathVariable String num) throws SQLException{
	//	ModelAndView mav = new ModelAndView("t_expr");
	//	mav.addObject("section", "/video/playlist/");
	//	mav.addObject("num", num);
	//	System.out.println(num);
		
	//	return mav;
	//	}
	
	//방에서 바로 온 것이 아닐 경우..?
	@GetMapping("/playlist")
	public ModelAndView playlistHandle() {
		ModelAndView mav = new ModelAndView("t_expr");
			mav.addObject("section", "video/playlist");
		return mav;
	}
	
	@GetMapping("/add") //링크로 바로 들어가면 get
	@RequestMapping(path = "/add", method = RequestMethod.GET)
	public String test3PostHandle(@RequestParam Map map, HttpSession session, Model model) {
		//MAP으로 전달되는 것들 : VIDEO_TITLE, VIDEO_ID, CHANNER_URL (NUM :방의 NUM은 나중에..)
		//추가로 지정해야 되는 것들 : ADD_ID
		try {
			map.put("add_id", session.getAttribute("auth_id"));
			System.out.println("비디오 추가 : " + map);
			VideoDao.addVideo(map);
			return "redirect:/video/playlist";
		} catch (Exception e) {
			//이미 있는 video_id 넣으면 오류나옴.. 어떻게 화면에 나오게 할 것인지..?
			e.printStackTrace();
			return "t_expr";
		}
	}
}
