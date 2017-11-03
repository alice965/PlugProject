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
import org.springframework.web.socket.WebSocketSession;

import com.plug.dj.controller.ws.BoothWSHandler;
import com.plug.dj.model.VideoDao;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
@Controller
@RequestMapping("/booth")
public class BoothController {
	@Autowired
	com.plug.dj.model.BoothDao BoothDao; 
	@Autowired
	VideoDao VideoDao;
	@Autowired
	com.plug.dj.model.MemberDao MemberDao;
	@Autowired
	com.plug.dj.model.InterestDao iDao;
	@Autowired
	BoothWSHandler boothws;
	@Autowired
	com.plug.dj.model.SearchDao sDao; 
	
	@RequestMapping("/boothmain")
	public ModelAndView BoothMainHandle(HttpSession session, @RequestParam(name="page", defaultValue="1" ) int page, @RequestParam Map param) throws SQLException{
		ModelAndView mav = new ModelAndView("t_expr");
		String id=(String) session.getAttribute("auth_id");
		mav.addObject("section", "booth/boothmain");
		//검색으로 접근인지 부스 메인으로 접근인지 감지
		
		// 1. 부스 메인의 옵션 패널에서 검색 조건으로 검색한 경우
		if(param.get("mode").equals("searchOpt")) {
			mav.addObject("mode", "searchOpt");	

			String title=(String) param.get("title");
			String dj=(String) param.get("dj");
			
			//닉네임으로 넘겨받은 파라미터를 회원 테이블에서 아이디로 추출
			List<Map> djid=MemberDao.readAllByNickname(dj);
			System.out.println("디제이 아이디 : " + djid);
			
			String genre=(String) param.get("genre");
			String [] arrGenre =genre.split(",");
			System.out.println("장르 배열 확인 : "+Arrays.toString(arrGenre));
			 
				//화면에 출력할 값 설정
			mav.addObject("title", title);	
			mav.addObject("dj", dj);
			mav.addObject("genre", genre);
				//dao에 넣을 map 설정
			Map smap = new HashMap<>();
			smap.put("title", title);
			smap.put("djid", djid); //검색시에는 닉네임이 아닌 아이디여야 함.
			smap.put("genre", arrGenre);
			
			List<Map> searchOptList = sDao.listOption(smap);
			System.out.println("옵션검색 리스트"+searchOptList);
			
			mav.addObject("list", searchOptList);
			mav.addObject("cnt", searchOptList.size());
			
		//2. 네비게이션의 검색 으로 들어온 경우	
		}else if(param.get("mode").equals("search")) {
			mav.addObject("mode", "search");
			
			String title=(String) param.get("title");
			List<Map> searchList = sDao.listTitle(title);
			System.out.println("검색 닉네임 왜 안나와?"+searchList);
			mav.addObject("list", searchList);
			mav.addObject("cnt", searchList.size());
			mav.addObject("keyword",title);
		
		//3. 메뉴바에서 DJ booth 메뉴 클릭해서 들어온 경우
		}else if(param.get("mode").equals("normal")) {
			//전체 부스
			List<Map> list = BoothDao.listAll();				
			mav.addObject("mode", "normal");	
			mav.addObject("list", list);
			mav.addObject("cnt", list.size());
			
			//관심 부스
			List<Map> listInterest = iDao.listInterest(id);		
			mav.addObject("interest", listInterest);
			mav.addObject("cntint", listInterest.size());
		};
		
		return mav;
		}
	
	@RequestMapping("/addInterest")
	public String BoothAddInterestHandle(HttpSession session,@RequestParam Map param) throws SQLException{
		//System.out.println("delparam??" + param);
		String id=(String) session.getAttribute("auth_id");
		param.put("userid", id);
		int r=iDao.addInterest(param);
		return "redirect:/booth/boothmain?mode=normal";
		}
	
	@RequestMapping("/list")
	public ModelAndView BoothListHandle(@RequestParam(name="page", defaultValue="1" ) int page, @RequestParam Map param)throws SQLException {
		ModelAndView mav = new ModelAndView("t_expr");
		List<Map> list = BoothDao.listAll();
		mav.addObject("section", "/booth/list");
		mav.addObject("list", list);
		mav.addObject("cnt", list.size());
		
		return mav;
	}
	
	
	@RequestMapping("/list_copy")
	public ModelAndView BoothListCopyHandle(@RequestParam(name="page", defaultValue="1" ) int page, @RequestParam Map param)throws SQLException {
		ModelAndView mav = new ModelAndView("t_expr");
		List<Map> list = BoothDao.listAll();
		mav.addObject("section", "/booth/list_copy");
		mav.addObject("list", list);
		mav.addObject("cnt", list.size());
		
		return mav;
	}
	
	@RequestMapping("/listJSON")
	public ModelAndView BoothListJSONHandle(HttpSession session)throws SQLException {
		String id=(String) session.getAttribute("auth_id");
		List<Map> list = BoothDao.listAll();
		System.out.println("list : "+ list);		
		ModelAndView mav = new ModelAndView("json");
		mav.addObject("section", "/booth/listJSON");
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(path="boothpage/{num}")
	public ModelAndView BoothPageHandle(@PathVariable String num) throws SQLException{
		ModelAndView mav = new ModelAndView("t_expr");
		Map one=BoothDao.readOne(num);
		BoothDao.increaseCnt(num);
		System.out.println("one???"+one);
		
		List<Map> video = VideoDao.selectVideoList(num);
		if(video.size() == 0){ //재생목록이 없을 경우
			mav.addObject("nolist", "재생목록이 없습니다.");
			System.out.println("재생목록이 없습니다.");	
		}else{
			mav.addObject("video", video);
			System.out.println("정보 : " + video);
		}
		mav.addObject("section", "booth/boothpage");
		mav.addObject("one", one);
		return mav;
		}
	
	@RequestMapping(path="view")
	public ModelAndView BoothViewHandle(WebSocketSession session) throws SQLException{
		ModelAndView mav = new ModelAndView("t_expr");
		mav.addObject("section", "booth/view");
		return mav;
		}
	
	
	
	@RequestMapping(path="/deleteInterest")
	public String FriendDeleteHandle(@RequestParam Map param) throws SQLException{
		//System.out.println("delparam??" + param);
		int r=iDao.delete(param);
		return "redirect:/booth/boothmain?mode=normal";
		}
	
}
