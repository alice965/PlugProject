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
public class SearchController {
	@Autowired
	com.plug.dj.model.SearchDao sDao; 
	
	@GetMapping("/search")
	public ModelAndView searchGetHandle(@RequestParam Map param) {
		ModelAndView mav = new ModelAndView("t_expr");
		
			mav.addObject("section", "search");
			String keyword = (String) param.get("keyword");
			System.out.println("keyword :" + keyword);
			
			List<Map> searchList = sDao.listAll(keyword);
			
			System.out.println(searchList);
			mav.addObject("searchList", searchList);
			
		return mav;
	}	
	
}
