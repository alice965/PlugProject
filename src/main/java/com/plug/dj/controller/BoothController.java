package com.plug.dj.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	public ModelAndView BoothMainHandle(HttpSession session, @RequestParam(name="page", defaultValue="1" ) int page, 
			@RequestParam Map param) throws SQLException{
		ModelAndView mav = new ModelAndView("t_expr");
		String id=(String) session.getAttribute("auth_id");
		mav.addObject("section", "booth/boothmain");
				
		//�˻����� �������� �ν� �������� �������� ����
		
		// 1. �ν� ������ �ɼ� �гο��� �˻� �������� �˻��� ���
		if(param.get("mode").equals("searchOpt")) {
			mav.addObject("mode", "searchOpt");	

			String title=(String) param.get("title");
			String dj=(String) param.get("dj");
			
			//�г������� �Ѱܹ��� �Ķ���͸� ȸ�� ���̺��� ���̵�� ����
			List<Map> djid=MemberDao.readAllByNickname(dj);
			System.out.println("������ ���̵� : " + djid);
			
			String genre=(String) param.get("genre");
			String [] arrGenre =genre.split(",");
			System.out.println("�帣 �迭 Ȯ�� : "+Arrays.toString(arrGenre));
			 
				//ȭ�鿡 ����� �� ����
			mav.addObject("title", title);	
			mav.addObject("dj", dj);
			mav.addObject("genre", genre);
				//dao�� ���� map ����
			Map smap = new HashMap<>();
			smap.put("title", title);
			smap.put("djid", djid); //�˻��ÿ��� �г����� �ƴ� ���̵𿩾� ��.
			smap.put("genre", arrGenre);
			
			List<Map> searchOptList = sDao.listOption(smap);
			System.out.println("�ɼǰ˻� ����Ʈ"+searchOptList);
			
			mav.addObject("list", searchOptList);
			mav.addObject("cnt", searchOptList.size());
			
		//2. �׺���̼��� �˻� ���� ���� ���	
		}else if(param.get("mode").equals("search")) {
			mav.addObject("mode", "search");
			
			String title=(String) param.get("title");
			List<Map> searchList = sDao.listTitle(title);
			System.out.println("�˻� �г��� �� �ȳ���?"+searchList);
			mav.addObject("list", searchList);
			mav.addObject("cnt", searchList.size());
			mav.addObject("keyword",title);
		
		//3. �޴��ٿ��� DJ booth �޴� Ŭ���ؼ� ���� ���
		}else if(param.get("mode").equals("normal")) {
			//cnt
			List<Map> listCnt = BoothDao.listAll();
			mav.addObject("cnt", listCnt.size());
			
			//list
			int psize = BoothDao.countForPage();
			System.out.println("psize : " + psize);
			int size = psize/12;
				if(psize%12 >0)
					size++;
				
			Map p = new HashMap();
				p.put("start", (page-1)*12+1);
				p.put("end", page*12);
			System.out.println("p : " + p);
			mav.addObject("list", BoothDao.listForPage(p));	
			
			//��ü �ν�
			//List<Map> list = BoothDao.listAll();				
			mav.addObject("mode", "normal");	
			mav.addObject("size", size);
			//mav.addObject("list", list);
			//mav.addObject("cnt", list.size());
			
			//���� �ν�
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
		mav.addObject("section", "/booth/list");
		
		//cnt
		List<Map> listCnt = BoothDao.listAll();
		mav.addObject("cnt", listCnt.size());
		
		//list
		int psize = BoothDao.countForPage();
		System.out.println("psize : " + psize);
		int size = psize/6;
			if(psize%6 >0)
				size++;
			
		Map p = new HashMap();
			p.put("start", (page-1)*6+1);
			p.put("end", page*6);
		
		mav.addObject("list", BoothDao.listForPage(p));	
		
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
	public ModelAndView BoothPageHandle(HttpServletResponse res, HttpServletRequest req, HttpSession session, @PathVariable String num) throws SQLException{
		ModelAndView mav = new ModelAndView("t_expr");
		
		//�ߺ� ī��Ʈ�� ���� ���� ��Ű ó��
		Cookie cookies[] = req.getCookies();
		Cookie viewCookie = null;
		Map cmap = new HashMap();
		
		if(req.getCookies() != null) {
			for (int i = 0; i < cookies.length; i++) {
				if(cookies[i].getName().equals("viewcnt")) {
					if(cookies[i].getValue().equals(num)) {
						viewCookie=cookies[i];
					}
				}
		    }
		}
		if(viewCookie==null) {
			System.out.println("���� ���� �Խù�");
			Cookie viewcnt = new Cookie("viewcnt", num);
			res.addCookie(viewcnt);
			//��ȸ�� ����
			BoothDao.increaseCnt(num);
			
		}
		
		//�ν� ��ȣ�� ���� �о��
		Map one=BoothDao.readOne(num);
		//System.out.println("������ ��� : "+one); 
		//System.out.println("one???"+one);
		
		List<Map> video = VideoDao.selectVideoList(num);
		List<Map> videolist = VideoDao.selectVideo_IdList(num);
		
		if(video.size() == 0){ //�������� ���� ���
			mav.addObject("nolist", "�������� �����ϴ�.");
			System.out.println("�������� �����ϴ�.");	
		}else{
			System.out.println("���� ����Ʈ : " + videolist);
			mav.addObject("video", video);
			System.out.println("���� : " + video);
			
			//if(one.get("ID").equals(session.getAttribute("auth_id"))){
			//	System.out.println("������ ������ ������ �ֽ��ϴ�.");
			//	mav.addObject("DJ", "equal"); //����� �α����� ����� ���� ���
			//}
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
		System.out.println("delparam??" + param);
		int r=iDao.delete(param);
		return "redirect:/booth/boothmain?mode=normal";
		//�Ķ���� �߰��ϰ� Ʈ���ŷ� Ŭ��
		}
	
}
