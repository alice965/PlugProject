package com.plug.dj.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
@Controller
@RequestMapping("/friend")
public class FriendController {
	@Autowired
	ObjectMapper mapper;
	
	@Autowired
	com.plug.dj.model.FriendDao fDao; 
	
	@GetMapping("/check")
	@RequestMapping(path = "/check", method = RequestMethod.GET)
	public String FriendCheckGetHanle(Map map, @RequestParam Map param, HttpSession session) {
		
		//페이지 뷰 설정
		map.put("section", "friend/check");
		
		//one에 사용할 아이디
		String id = (String) session.getAttribute("auth_id");
		
		//화면에 넘길 아이디값 세팅
		map.put("sid",id);
		
		//파라미터에 원 추가
		param.put("one", id );
		
		// 요청받은 내역을 보기 위한 readChkReqOne 에 넘길 맵
		Map chmap=new HashMap<>();
		chmap.put("id", id);
		chmap.put("other", param.get("other"));
		
		//친구인지 체크
		if(fDao.chkFriend(chmap)!=null) {								 //친구이면
			return "redirect:/friend/exist?other="+param.get("other");
		} else if(fDao.readChkReqOne(chmap)!=null){				//받은 요청이면
			return "redirect:/friend/otherrequested?other="+param.get("other");
		}else if(fDao.chkSend(chmap)!=null) {							//보낸 요청이면
			return "redirect:/friend/wait?other="+param.get("other"); 
		}else {
			return "redirect:/friend/add?other="+param.get("other");
		}
	}
	@GetMapping("/exist")
	@RequestMapping(path = "/exist", method = RequestMethod.GET)
	public String FriendExitGetHanle(Map map, @RequestParam Map param, HttpSession session) {
		param.put("one", session.getAttribute("auth_id") );
		map.put("section", "friend/exist");
		Map data=new HashMap();
		data=fDao.readOne(param);
		System.out.println("data : " + data);
		map.put("data", data);
		map.put("sid", session.getAttribute("auth_id"));
		return "t_pop";
	}
	@GetMapping("/wait")
	@RequestMapping(path = "/wait", method = RequestMethod.GET)
	public String FriendWaitGetHanle(Map map, @RequestParam Map param, HttpSession session) {
		param.put("one", session.getAttribute("auth_id") );
		map.put("section", "friend/wait");
		Map data=new HashMap();
		data=fDao.readOne(param);
		map.put("data", data);
		return "t_pop";
	}
	@GetMapping("/requested")
	@RequestMapping(path = "/requested", method = RequestMethod.GET)
	public String FriendRequestedGetHanle(Map map, @RequestParam Map param, HttpSession session) {
		map.put("section", "friend/requested");
		String id = (String) session.getAttribute("auth_id");
		map.put("sid",id);
		map.put("other", param.get("other"));
		return "t_pop";
	}
	@GetMapping("/otherrequested")
	@RequestMapping(path = "/otherrequested", method = RequestMethod.GET)
	public String FriendotherrequestedGetHanle(Map map, @RequestParam Map param, HttpSession session) {
		map.put("section", "friend/otherrequested");
		String id = (String) session.getAttribute("auth_id");
		map.put("sid",id);
		map.put("other", param.get("other"));
		return "t_pop";
	}
	
	@GetMapping("/add")
	@RequestMapping(path = "/add", method = RequestMethod.GET)
	public String FriendAddGetHanle(Map map, @RequestParam Map param, HttpSession session) {
		//화면 출력
		map.put("section", "friend/add");
		
		Map nmap = fDao.getNick(param);
		//System.out.println(nmap.get("NICKNAME"));
		
		Map data=new HashMap();
		data.put("one", session.getAttribute("auth_id") );
		data.put("other", param.get("other"));
		data.put("nickname",nmap.get("NICKNAME"));		
		
		map.put("data", data);
		
		return "t_pop";
	}
	
	@PostMapping("/add")
	@RequestMapping(path = "/add", method = RequestMethod.POST)
	public String FriendAddPostHandle(@RequestParam Map param, ModelMap map, HttpSession session) throws SQLException {
		param.put("one", session.getAttribute("auth_id") );
		fDao.add(param);
		
		return "/friend/addok";
	}
	
	@RequestMapping("/list")
	public ModelAndView FriendListHandle(@RequestParam Map param, HttpSession session)throws SQLException {
		ModelAndView mav = new ModelAndView("t_expr");
		String id = (String) session.getAttribute("auth_id");
		mav.addObject("section", "friend/list");
		
		
		List<Map> listReq = fDao.listReq(id);		//요청목록
		List<Map> listRcv = fDao.listSnd(id);		//받은목록
		List<Map> listFriend = fDao.listFriend(id);	//친구목록
		System.out.println("친구 파람??" + param);
		
		mav.addObject("sid", id); //세션 아이디를 넘겨서, 받은 친구쪽 onenick과 비교
		mav.addObject("listReq", listReq);
		mav.addObject("listRcv", listRcv);
		mav.addObject("listFriend", listFriend);
		mav.addObject("cntListReq", listReq.size());
		mav.addObject("cntListFrd", listFriend.size());
		mav.addObject("cntListRcv", listRcv.size());
		
		System.out.println("listReq.size()??" + listReq.size());
		
		return mav;
	}
	
	@RequestMapping(path="/delete")
	public String FriendDeleteHandle(@RequestParam Map param) throws SQLException{
		System.out.println("delparam??" + param);
		int r=fDao.delete(param);
		System.out.println(r);
		return "redirect:/friend/list";
		//return "redirect:/friend/list?src=requested";
		}
	@RequestMapping(path="/accept")
	public String FriendAcceptHandle(@RequestParam Map param) throws SQLException{
		//System.out.println("acceptparam??" + param);
		int r=fDao.accept(param);
		return "redirect:/friend/list";
		}
}
