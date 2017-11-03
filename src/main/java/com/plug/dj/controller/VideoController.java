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
	public ModelAndView deleteGetHandle(@RequestParam(name="video_num") String[] num, @RequestParam Map map, HttpSession session, Model model) {
		ModelAndView mav = new ModelAndView();
		try {
			System.out.println(map);
			Map room = BoothDao.readOne((String)map.get("room_num"));
			System.out.println("������ ���� ���� : " + room);
					
			String video_num = ""; //�ش� ������ ��ȣ
			//System.out.println("������ ������ ��ȣ : " + Arrays.toString(num));
			//���� ���� ����� �뷡�� �߰��� ����̰ų�, ������� ����� ������ ��쿡�� ������ �����ϵ���.
				for(int idx=0; idx<num.length; idx++){
					video_num = num[idx];
				//System.out.println(video_num);
				String add_id = VideoDao.selectAdd_id(video_num); //�뷡�� �߰��� ���̵�..
				
				if(add_id.equals(session.getAttribute("auth_id")) || room.get("ID").equals(session.getAttribute("auth_id"))){
					VideoDao.deleteVideo(video_num);
					System.out.println("���� �����Ϸ� : " + video_num);
				}else{
					mav.addObject("delete", "no"); //��������.
					System.out.println("������ ������ �����ϴ�.");
				}
				}				
				mav.setViewName( "redirect:/booth/boothpage/" +  (String)map.get("room_num"));
				return mav;
			//mav.addObject("room", room);	
		} catch (Exception e) {
		//�̹� �ִ� video_id ������ ��������.. ��� ȭ�鿡 ������ �� ������..?
		e.printStackTrace();
		mav.setViewName("t_expr");
		return mav;
		}	
	}

}