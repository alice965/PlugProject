package com.plug.dj.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.plug.dj.model.VideoDao;

@Controller
@RequestMapping("/video")
public class VideoController {
	@Autowired
	VideoDao VideoDao;
	
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
