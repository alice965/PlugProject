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

	@GetMapping("/add") //링크로 바로 들어가면 get
	@RequestMapping(path = "/add", method = RequestMethod.GET)
	public String addGetHandle(@RequestParam Map map, HttpSession session, Model model) {
		//MAP으로 전달되는 것들 : VIDEO_TITLE, VIDEO_ID, CHANNER_URL, IMAGE, NUM :방의 NUM
		//추가로 지정해야 되는 것들 : ADD_ID (추가한 사람의 닉네임)
		try {
			map.put("add_id", session.getAttribute("auth_id"));
			//닉네임
			HashMap u = MemberDao.readOneById((String)map.get("add_id"));
			map.put("add_nickname", u.get("NICKNAME")); //대소문자 구분하기!
			System.out.println("비디오 추가 : " + map);
			VideoDao.addVideo(map);
			return "redirect:/booth/boothpage/" + map.get("num");
		} catch (Exception e) {
			//이미 있는 video_id 넣으면 오류나옴.. 어떻게 화면에 나오게 할 것인지..?
			e.printStackTrace();
			return "t_expr";
		}
	}
	
	@GetMapping("/delete") //링크로 바로 들어가면 get
	@RequestMapping(path = "/delete", method = RequestMethod.GET)
	public ModelAndView deleteGetHandle(@RequestParam(name="video_num") String[] num, @RequestParam Map map, HttpSession session, Model model) {
		ModelAndView mav = new ModelAndView();
		try {
			System.out.println(map);
			Map room = BoothDao.readOne((String)map.get("room_num"));
			System.out.println("삭제할 방의 정보 : " + room);
					
			String video_num = ""; //해당 비디오의 번호
			//System.out.println("삭제할 비디오의 번호 : " + Arrays.toString(num));
			//현재 들어온 사람이 노래를 추가한 사람이거나, 현재들어온 사람이 방장일 경우에만 삭제가 가능하도록.
				for(int idx=0; idx<num.length; idx++){
					video_num = num[idx];
				//System.out.println(video_num);
				String add_id = VideoDao.selectAdd_id(video_num); //노래를 추가한 아이디..
				
				if(add_id.equals(session.getAttribute("auth_id")) || room.get("ID").equals(session.getAttribute("auth_id"))){
					VideoDao.deleteVideo(video_num);
					System.out.println("비디오 삭제완료 : " + video_num);
				}else{
					mav.addObject("delete", "no"); //삭제못함.
					System.out.println("삭제할 권한이 없습니다.");
				}
				}				
				mav.setViewName( "redirect:/booth/boothpage/" +  (String)map.get("room_num"));
				return mav;
			//mav.addObject("room", room);	
		} catch (Exception e) {
		//이미 있는 video_id 넣으면 오류나옴.. 어떻게 화면에 나오게 할 것인지..?
		e.printStackTrace();
		mav.setViewName("t_expr");
		return mav;
		}	
	}

}