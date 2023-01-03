package net.daum.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.daum.service.CommunityService;
import net.daum.service.MemoService;
import net.daum.service.User_infoService;
import net.daum.vo.MemoVO;
import net.daum.vo.User_infoVO;

@Controller
public class CommunityController {
	
	@Autowired
	private MemoService memoService;
	
	@Autowired
	private User_infoService user_infoService;
	
	@Autowired
	private CommunityService communityService;
	
	
	@RequestMapping(value="community")
	public String community(Model model, HttpServletRequest request, MemoVO memo,User_infoVO ui) {
		
		String id = (String)request.getSession().getAttribute("id");
		String field = request.getParameter("field");
		String fieldName = request.getParameter("fieldName");
		
		memo.setField(field);
		memo.setFieldName("%"+fieldName+"%");
		System.out.println(memo.getField());
		System.out.println(memo.getFieldName());
			
		if(id!=null) {//나의 헤더.jsp에 포함된 프로필사진을 출력하기 위해 필요한 조건문입니다.
			ui.setUser_id(id);
			memo.setUser_id(id);
			
			List<User_infoVO> ulist = this.user_infoService.ui_getUserInfo(ui);		
			List<MemoVO> cm_mylist = this.communityService.getCmMyMemo(memo);// 커뮤니티에 쓴 내 글 목록 불러오기
			
			model.addAttribute("ulist",ulist);
			model.addAttribute("cm_mylist",cm_mylist);
		}
		
		List<MemoVO> clist = this.communityService.getCmMemo(memo);//모든 커뮤니티 글 목록을 불러옵니다.
	
		model.addAttribute("clist",clist);
		
		
		return "community";
	}//community() end
	
	@RequestMapping(value="community_cont", method= RequestMethod.GET)
	public ModelAndView community_cont(User_infoVO ui,HttpServletRequest request,HttpServletResponse response) throws IOException {
				
		ModelAndView ma = new ModelAndView();
		String id = (String)request.getSession().getAttribute("id");		
		
		if(id!= null) {
			ui.setUser_id(id);
			List<User_infoVO> ulist = this.user_infoService.ui_getUserInfo(ui);
			ma.setViewName("community_cont");
			ma.addObject("ulist",ulist);
		}else {
			ma.setViewName("login_page");	
		}
		
		return ma;	
	}//community_cont() end
	
	@ResponseBody
	@PostMapping(value="update_cmmemo_ok")
	public Map<String,String> update_cmmemo_ok(HttpServletRequest request,String title, String content, String color,MemoVO memo){	
		Map<String,String> map = new HashMap<>();
		
		String id= (String)request.getSession().getAttribute("id");
		
		if(id!=null && !title.isEmpty() && !content.isEmpty()) { //로그인중이고 아이디값이랑 내용값이 제대로 들어와있다면?
			memo.setUser_id(id);
			memo.setMemo_title(title);
			memo.setMemo_cont(content);
			memo.setMemo_color(color);
			this.communityService.insertCmMemo(memo);
			
			map.put("code", "성공");
		}else {
			map.put("code", "실패");
		}
			
		return map;
	}//update_cmmemo_ok() end
	

}
