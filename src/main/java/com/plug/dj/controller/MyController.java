package com.plug.dj.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.plug.dj.model.MemberDao;

@Controller
@RequestMapping("/my")
public class MyController {
	@Autowired
	MemberDao memberDao;
	@Autowired
	ServletContext application;
	@Autowired
	SimpleDateFormat sdf;
	@Autowired
	JavaMailSender sender;

	@GetMapping("/profile")
	public ModelAndView ProfileHandle(HttpSession session, Model model) {
		String id=(String) session.getAttribute("auth_id");
		Map profilelist = memberDao.readLatestProfileById(id);
		ModelAndView mav = new ModelAndView("t_expr");
		mav.addObject("section", "/my/profile");
		mav.addObject("profile", profilelist);
		mav.addObject("arrGenre", profilelist.get("GENRE"));
		System.out.println("profilelist : " + profilelist);

		return mav;
	}

	@PostMapping("/profile")
	public String ProfilePostHandle(@RequestParam String[] genre, 
			@RequestParam Map map, HttpSession session, Model model) {
		try {
			String id = (String) session.getAttribute("auth_id");
			//null설정해주기 위해서 map에서 get해서 따로 저장해주기.
			String gender = (String)map.get("gender");
			
			String str = Arrays.toString(genre);		
			String genreval=(str.substring(1,str.length()-1)).trim();
			//장르에 앞뒤 [] 를 제거하고 입력
			map.put("id", id);
			map.put("gender", gender);
			map.put("genre", genreval);
			System.out.println(map);
			memberDao.updateOneDetail(map);
			return "redirect:/my/profile";
		} catch (Exception e) {
			e.printStackTrace();	
			return "t_expr";
		}
	}
	
	

	@GetMapping("/mybooth")
	public ModelAndView BoothHandle(HttpSession session, Model model) {
		String id=(String) session.getAttribute("auth_id");
		Map profilelist = memberDao.readLatestProfileById(id);
		ModelAndView mav = new ModelAndView("t_expr");
		mav.addObject("section", "/my/mybooth");
		mav.addObject("profile", profilelist);
		System.out.println("profilelist : " + profilelist);

		return mav;
	}

	@PostMapping("/mybooth")
	public String BoothPostHandle(@RequestParam Map map, HttpSession session, Model model) {
		try {
			String id = (String) session.getAttribute("auth_id");
			//null설정해주기 위해서 map에서 get해서 따로 저장해주기.
			String gender = (String)map.get("gender");
			String[] genre = (String[]) map.get("genre");
			System.out.println(Arrays.toString(genre));
			map.put("id", id);
			map.put("gender", gender);
			map.put("genre", Arrays.toString(genre));
			System.out.println(map);
			memberDao.updateOneDetail(map);
			return "redirect:/my/mybooth";
		} catch (Exception e) {
			e.printStackTrace();	
			return "t_expr";
		}
	}
	
	@GetMapping("/alarm")
	public ModelAndView AlarmHandle(HttpSession session, Model model) {
		String id=(String) session.getAttribute("auth_id");
		Map profilelist = memberDao.readLatestProfileById(id);
		ModelAndView mav = new ModelAndView("t_expr");
		mav.addObject("section", "/my/alarm");
		mav.addObject("profile", profilelist);
		System.out.println("profilelist : " + profilelist);

		return mav;
	}

	@PostMapping("/alarm")
	public String AlarmPostHandle(@RequestParam Map map, HttpSession session, Model model) {
		try {
			String id = (String) session.getAttribute("auth_id");
			//null설정해주기 위해서 map에서 get해서 따로 저장해주기.
			String gender = (String)map.get("gender");
			String[] genre = (String[]) map.get("genre");
			System.out.println(Arrays.toString(genre));
			map.put("id", id);
			map.put("gender", gender);
			map.put("genre", Arrays.toString(genre));
			System.out.println(map);
			memberDao.updateOneDetail(map);
			return "redirect:/myalarm";
		} catch (Exception e) {
			e.printStackTrace();	
			return "t_expr";
		}
	}
	
	
	
	@SuppressWarnings("rawtypes")
	@PostMapping("/pic_update")
	public ModelAndView profilePostHandle(@RequestParam(name = "profile") MultipartFile f, HttpSession session)
			throws InterruptedException {
		String id = (String) session.getAttribute("auth_id");
		String nickname = (String) session.getAttribute("auth_nickname");
		boolean rst = false;
		String fmt = sdf.format(System.currentTimeMillis());

		String fileName = nickname + "_" + fmt;
		try {
			if (f.isEmpty())
				throw new Exception();
			File dst = new File(application.getRealPath("/profiles"), fileName);
			f.transferTo(dst);
			rst = !rst;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (rst) {
			Map data = new HashMap<>();
			data.put("id", id);
			data.put("url", "/profiles/" + fileName);
			memberDao.updateOneProfile(data);
			System.out.println(data);
		}

		ModelAndView mav = new ModelAndView("redirect:/my/profile");
		mav.addObject("rst", rst);

		return mav;
	}
	
	//비밀번호 변경
	@GetMapping("/changepass")
	public String changeGetHandle(Model model) {
		model.addAttribute("section", "/my/changepass");
		return "t_expr";
	}  
	
	@PostMapping("/changepass")
	public String changePostHandle(@RequestParam Map map, HttpSession session, Model model) {
		try {
			System.out.println(map);
			String now = (String)map.get("now");
			String change = (String)map.get("change");
			if(now.equals(change)){
			model.addAttribute("same","1");
			model.addAttribute("section", "/my/changepass");
			return "t_expr";
			}else{
			String id = (String) session.getAttribute("auth_id");
			map.put("id", id);
			boolean b = memberDao.updatePass(map);
			System.out.println("비밀번호 변경 : " + b);
			return "redirect:/my/profile";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("tempchangepass", "1");
			model.addAttribute("section", "/my/changepass");
			return "t_expr";
		}
	}
	
	@GetMapping("/out")
	public String outGetHandle(Model model) {
		model.addAttribute("section", "/my/out");
		return "t_expr";
	} 
	
	@PostMapping("/out")
	public String outPostHandle(@RequestParam Map map, HttpSession session, 
			HttpServletResponse response, Model model) {
		try{
		map.put("id", (String)session.getAttribute("auth_id"));
		System.out.println(map);
		String feedback = (String)map.get("feedback");
		if(feedback.length()>=1){  //null이 아닐 때 메일로 피드백내용 보냄.
			MimeMessage msg = sender.createMimeMessage();
			msg.setRecipient(RecipientType.TO, new InternetAddress("csrom0128@gmail.com"));
			msg.setSubject("Plug.Dj.Feedback");
			String text = "<h1>탈퇴회원의 피드백 내용입니다.</h1>";
			text += feedback;
			text += "<a href=\"http://192.168.10.81\">사이트 이동</a>";
			msg.setText(text, "UTF-8", "html");
			System.out.println("피드백 내용 있음");
			
			sender.send(msg);
		}else{
			System.out.println("피드백 내용 없음");
		}
		map.put("flag", "false"); //회원탈퇴시 flag값을 false로 바꿈.
		session.setAttribute("auth", null); //방문자로 바꿔주고
		 Cookie c = new Cookie("keep", "회원탈퇴"); //사용자의 아이디(이메일)를 넣어서 
		 				//생성했던 keep쿠키를 회원탈퇴 내용을 넣어서 덮어씀(시간을 0으로)
		 c.setMaxAge(0) ;
		 c.setPath("/");
		 response.addCookie(c);	 
		memberDao.updateOutFlag(map);
		return "redirect:/";
		}catch(Exception e){
			e.printStackTrace();
			model.addAttribute("section", "/my/out");
			return "t_expr";
		}
	}
}