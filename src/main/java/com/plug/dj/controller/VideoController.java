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
		// MAP���� ���޵Ǵ� �͵� : VIDEO_TITLE, VIDEO_ID, CHANNER_URL, IMAGE, NUM :����
		// NUM
		// �߰��� �����ؾ� �Ǵ� �͵� : ADD_ID (�߰��� ����� �г���)
		try {
			map.put("add_id", session.getAttribute("auth_id"));
			// �г���
			HashMap u = MemberDao.readOneById((String) map.get("add_id"));
			map.put("add_nickname", u.get("NICKNAME")); // ��ҹ��� �����ϱ�!

			System.out.println("���� ���� : " + VideoDao.existVideoId(map) + (String) map.get("video_id"));
			if (VideoDao.existVideoId(map) < 1) {
				VideoDao.addVideo(map);
				return "YYYY";
			} else {
				throw new Exception();
			}
		} catch (Exception e) {
			// �̹� �ִ� video_id ������ ��������.. ��� ȭ�鿡 ������ �� ������..?
			e.printStackTrace();
			return "NNNN";
		}
	}

	@RequestMapping(path = "/delete", method = RequestMethod.GET)
	@ResponseBody
	public String deleteGetHandle(@RequestParam(name = "room_num") String room_num,
			@RequestParam(name = "video_num[]") String[] num, HttpSession session) {
		try {
			Map room = BoothDao.readOne(room_num); //������ ���̵� �̱� ����.
			System.out.println("������ ���� ���� : " + room);

			String video_num = "";
			//���� ���� ����� �뷡�� �߰��� ����̰ų�, ������� ����� ������ ��쿡�� ������ �����ϵ���. 
			for(int idx=0; idx < num.length; idx++){
				video_num = num[idx];	
				String add_id = VideoDao.selectAdd_id(video_num); //������ �߰��� ����� ���̵�, ������ ���̵�
				if (add_id.equals(session.getAttribute("auth_id")) ||
						room.get("ID").equals(session.getAttribute("auth_id"))){
					VideoDao.deleteVideo(video_num);
					System.out.println("���� �����Ϸ�! �߰��ѻ���Ǿ��̵� : " + add_id + " / ���� ��ȣ: " + video_num);
				}else {
					throw new Exception();
				}
			}
			return "YYYY";
		} catch (Exception e) {
			e.printStackTrace();
			return "NNNN"; // ������ ������ ���� ���.
		}
	}
	
	@RequestMapping(path = "/F5", method = RequestMethod.GET) //���ΰ�ħ �� ���..
	@ResponseBody
	public List<Map> F5GetHandle(@RequestParam(name = "room_num") String room_num, HttpSession session) {
		List<Map> one= VideoDao.selectVideoList(room_num); //�� ��ȣ�� ��������Ʈ�� ����ִ� map�� �����´�.
		//�ʿ��� ���� : ${obj.VIDEO_NUM }, ${obj.IMAGE}, ${obj.VIDEO_TITLE}, ${obj.ADD_ID }, ${obj.ADD_NICKNAME }, ${obj.ADDDATE}
		System.out.println("F5 : " +one);
		return one;
	}
}