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
	
	@GetMapping("/add") //��ũ�� �ٷ� ���� get
	@RequestMapping(path = "/add", method = RequestMethod.GET)
	public String test3PostHandle(@RequestParam Map map, HttpSession session, Model model) {
		//MAP���� ���޵Ǵ� �͵� : VIDEO_TITLE, VIDEO_ID, CHANNER_URL (NUM :���� NUM�� ���߿�..)
		//�߰��� �����ؾ� �Ǵ� �͵� : ADD_ID
		try {
			map.put("add_id", session.getAttribute("auth_id"));
			System.out.println("���� �߰� : " + map);
			VideoDao.addVideo(map);
			return "redirect:/video/playlist";
		} catch (Exception e) {
			//�̹� �ִ� video_id ������ ��������.. ��� ȭ�鿡 ������ �� ������..?
			e.printStackTrace();
			return "t_expr";
		}
	}
}
