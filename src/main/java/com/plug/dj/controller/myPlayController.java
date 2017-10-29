package com.plug.dj.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.io.File;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
@Controller
@RequestMapping("/myplay")
public class myPlayController {
	@Autowired
	com.plug.dj.model.PlayListDao playlistDao; 
	
	@Autowired
	ServletContext application;
	
	@Autowired
	SimpleDateFormat sdf;
	
	@RequestMapping("/list")
	public ModelAndView PlayListHandle(@RequestParam(name="page", defaultValue="1" ) int page, @RequestParam Map param, HttpSession session)throws SQLException {
		String id=(String) session.getAttribute("auth_id");
		List<Map> list = playlistDao.myList(id);
		param.put("id", session.getAttribute("auth_id") );
		int psize = playlistDao.countListPage();
		int size = psize/5;
			if(psize%5 >0)	size++;
			
		Map p = new HashMap();
		param.put("start", (page-1)*5+1);
		param.put("end", page*5);
		
		ModelAndView mav = new ModelAndView("t_expr");
		mav.addObject("section", "/myplay/list");
		//mav.addObject("list", playlistDao.listPage(param));
		mav.addObject("list", list);
		mav.addObject("cnt", list.size());
		mav.addObject("size",size);
		
		return mav;
	}
	@RequestMapping("/listJSON")
	public ModelAndView PlayListJSONHandle(HttpSession session)throws SQLException {
		String id=(String) session.getAttribute("auth_id");
		List<Map> list = playlistDao.myList(id);
		System.out.println("list : "+ list);		
		ModelAndView mav = new ModelAndView("json");
		mav.addObject("section", "/myplay/listJSON");
		mav.addObject("list", list);
		
		return mav;
	}
	
	@GetMapping("/add")
	@RequestMapping(path = "/add", method = RequestMethod.GET)
	public String PlayAddGetHanle(Map map) {
			map.put("section", "myplay/add");
		return "t_expr";
	}
	
	@PostMapping("/add")
	@RequestMapping(path = "/add", method = RequestMethod.POST)
	public String PlayAddPostHandle(@RequestParam Map param, @RequestParam String[] genre, 
									ModelMap map, HttpSession session,
									@RequestParam(name ="boothpic") MultipartFile f) throws SQLException {
		String id = (String) session.getAttribute("auth_id");
		//세션에서 아이디를 가져와서 파람에 추가
		param.put("id", id );
		
		//리퀘스트 파람으로 장르를 배열로 가져와서 스트링으로 추가
		param.put("genre", Arrays.toString(genre));
		
		//리퀘스트 파람으로 boothpic을 가져와서 파일처리
		boolean b = false;
		String fmt = sdf.format(System.currentTimeMillis());

		String fileName = "booth"+id +"_"+ fmt;
		try {
			if (f.isEmpty()) throw new Exception();
			File dst = new File(application.getRealPath("/images/booth"), fileName);
			f.transferTo(dst);
			b = !b;
		} catch (Exception e) {
			e.printStackTrace();
		}
		//url이 없으면 디폴트 이미지를 넣고, 아니면 입력값으로 진행하도록 함
		if(param.get("url")==null) {
			param.put("id", id);
			param.put("url", "/images/booth/default.jpg");
		}else {
			if (b) {
				param.put("id", id);
				param.put("url", "/images/booth/" + fileName);
			}
		}
		
		
		

		//////기존 플레이리스트 소스 있던거
		int rst = playlistDao.add(param);
		if (rst == 1) {
			map.put("section", "/myplay/list");
			return "redirect:/myplay/list";
		}
		map.put("rst1", rst);
		return "/myplay/add";
	}
	
	
	@RequestMapping(path="view/{num}")
	public ModelAndView PlayViewHandle(@PathVariable String num) throws SQLException{
		ModelAndView mav = new ModelAndView("t_expr");
		Map one=playlistDao.readOne(num);
		mav.addObject("section", "myplay/view");
		mav.addObject("one", one);
		
		return mav;
		}
	@RequestMapping(path="/delete/{num}")
	public String PlayDeleteHandle(@PathVariable String num) throws SQLException{
		int r=playlistDao.delete(num);
		return "redirect:/myplay/list";
		}
	
	@GetMapping("/edit/{num}")
	public String PlayEditGetHanle(Model model, @PathVariable String num ) {
			Map map = playlistDao.readOne(num);
			model.addAttribute("section", "myplay/edit");
			model.addAttribute("map", map);
		return "t_expr";
	}
	
	@PostMapping("/edit/{num}")
	public String PlayEditPostHanle(@RequestParam Map param, Model model, @PathVariable String num) {
		param.put("num", num);
		int r = playlistDao.edit(param);
		if(r==1) {
			model.addAttribute("section", "myplay/edit");
			return "redirect:/myplay/view/{num}";
		}
		return "redirect:/myplay/view/{num}";
	}
}
