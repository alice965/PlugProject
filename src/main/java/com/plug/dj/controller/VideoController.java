package com.plug.dj.controller;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.bind.annotation.ResponseBody;
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

	@RequestMapping(path = "/add", method = RequestMethod.GET)
	@ResponseBody
	public String addGetHandle(@RequestParam Map map, HttpSession session) {
		// MAP으로 전달되는 것들 : VIDEO_TITLE, VIDEO_ID, CHANNER_URL, IMAGE, NUM :방의
		// NUM
		// 추가로 지정해야 되는 것들 : ADD_ID (추가한 사람의 닉네임)
		try {
			map.put("add_id", session.getAttribute("auth_id"));
			System.out.println("session : " + session.getAttribute("auth_id"));
			// 닉네임
			HashMap u = MemberDao.readOneById((String) map.get("add_id"));
			map.put("add_nickname", u.get("NICKNAME")); // 대소문자 구분하기!

			System.out.println("존재 여부 : " + VideoDao.existVideoId(map) + (String) map.get("video_id"));
			if (VideoDao.existVideoId(map) < 1) {
				VideoDao.addVideo(map);
				return "YYYY"; //삭제가능
			} else {
				return "NNNN"; //이미 있는 비디오일 경우
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "SSSS"; //권한이 없을경우(로그인이 안 된 경우)
		}
	}

	@RequestMapping(path = "/delete", method = RequestMethod.GET)
	@ResponseBody
	public String deleteGetHandle(@RequestParam(name = "room_num") String room_num,
			@RequestParam(name = "video_num[]") String[] num, HttpSession session) {
		try {
			Map room = BoothDao.readOne(room_num); //방장의 아이디를 뽑기 위함.
			System.out.println("삭제할 방의 정보 : " + room);

			String video_num = "";
			//현재 들어온 사람이 노래를 추가한 사람이거나, 현재들어온 사람이 방장일 경우에만 삭제가 가능하도록. 
			for(int idx=0; idx < num.length; idx++){
				video_num = num[idx];	
				String add_id = VideoDao.selectAdd_id(video_num); //비디오를 추가한 사람의 아이디, 방장의 아이디
				if (add_id.equals(session.getAttribute("auth_id")) ||
						room.get("ID").equals(session.getAttribute("auth_id"))){
					VideoDao.deleteVideo(video_num);
					System.out.println("비디오 삭제완료! 추가한사람의아이디 : " + add_id + " / 비디오 번호: " + video_num);
				}else {
					throw new Exception();
				}
			}
			return "YYYY";
		} catch (Exception e) {
			e.printStackTrace();
			return "NNNN"; // 삭제할 권한이 없을 경우.
		}
	}
	
	@RequestMapping(path = "/F5", method = RequestMethod.GET) //새로고침 할 경우..
	@ResponseBody
	public List<Map> F5GetHandle(@RequestParam(name = "room_num") String room_num, HttpSession session) {
		List<Map> one= VideoDao.selectVideoList(room_num); //방 번호로 비디오리스트가 담겨있는 map을 가져온다.
		//필요한 정보 : ${obj.VIDEO_NUM }, ${obj.IMAGE}, ${obj.VIDEO_TITLE}, ${obj.ADD_ID }, ${obj.ADD_NICKNAME }, ${obj.ADDDATE}
		System.out.println("F5 : " +one);
		return one;
	}
}