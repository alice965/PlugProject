package com.plug.dj.controller;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashMap;
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
	@Autowired
	BoothDao BoothDao;
	@Autowired
	com.plug.dj.model.MemberDao MemberDao;
	
	//@RequestMapping(path="/playlist/{num}")
	//public ModelAndView PlaylistHandle(@PathVariable String num) throws SQLException{
	//	ModelAndView mav = new ModelAndView("t_expr");
	//	System.out.println(num);
	//	mav.addObject("section", "video/playlist");
	//	mav.addObject("num", num);
	
	//	return mav;
	//	}
	
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
	
	//�濡�� �ٷ� �� ���� �ƴ� ���..?
	//@GetMapping("/playlist")
	//public ModelAndView playlistHandle() {
	//	ModelAndView mav = new ModelAndView("t_expr");
	//		mav.addObject("section", "video/playlist");
	//	return mav;
	//}
	
	@GetMapping("/add") //��ũ�� �ٷ� ���� get
	@RequestMapping(path = "/add", method = RequestMethod.GET)
	public String addGetHandle(@RequestParam Map map, HttpSession session, Model model) {
		//MAP���� ���޵Ǵ� �͵� : VIDEO_TITLE, VIDEO_ID, CHANNER_URL, IMAGE, NUM :���� NUM
		//�߰��� �����ؾ� �Ǵ� �͵� : ADD_ID (�߰��� ����� �г���)
		try {
			map.put("add_id", session.getAttribute("auth_id"));
			//�г���
			HashMap u = MemberDao.readOneById((String)map.get("add_id"));
			map.put("add_nickname", u.get("NICKNAME")); //��ҹ��� �����ϱ�!
			System.out.println("���� �߰� : " + map);
			VideoDao.addVideo(map);
			return "redirect:/booth/boothpage/" + map.get("num");
		} catch (Exception e) {
			//�̹� �ִ� video_id ������ ��������.. ��� ȭ�鿡 ������ �� ������..?
			e.printStackTrace();
			return "t_expr";
		}
	}
	
	@GetMapping("/delete") //��ũ�� �ٷ� ���� get
	@RequestMapping(path = "/delete", method = RequestMethod.GET)
	public String deleteGetHandle(@RequestParam(name="num") String[] num, @RequestParam Map map, HttpSession session, Model model) {
		//MAP���� ���޵Ǵ� �͵� : VIDEO_TITLE, VIDEO_ID, CHANNER_URL, IMAGE, NUM :���� NUM
		//�߰��� �����ؾ� �Ǵ� �͵� : ADD_ID (�߰��� ����� �г���)
		try {
			
			for(int idx=0; idx<num.length; idx++){
			VideoDao.deleteVideo(num[idx]);
			System.out.println("���� ���� : " + num[idx]);
			}
			return "redirect:/booth/list";
		} catch (Exception e) {
			//�̹� �ִ� video_id ������ ��������.. ��� ȭ�鿡 ������ �� ������..?
			e.printStackTrace();
			return "t_expr";
		}
	}

}
