package net.daum.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.daum.service.MemoService;
import net.daum.service.User_infoService;
import net.daum.vo.MemoVO;
import net.daum.vo.User_infoVO;

@Controller
public class MyPlaceController {
	
	@Autowired
	private User_infoService user_InfoService;
	
	@Autowired
	private MemoService memoService;
	
	@GetMapping(value="myPlace")
	public ModelAndView myPlace(HttpServletRequest request,User_infoVO ui) {
		ModelAndView model;
		String id = (String)request.getSession().getAttribute("id");
		if(id!=null) {
			model = new ModelAndView("myPlace");
			ui.setUser_id(id);
			List<User_infoVO> ulist = this.user_InfoService.ui_getUserInfo(ui);
			model.addObject("ulist",ulist);
						
		}else {			
			model = new ModelAndView("main");
		}		
		
		return model;
	}//myPlace() end
	
	@RequestMapping(value="myPlace_cont")
	public ModelAndView myPlace_cont(HttpServletRequest request,User_infoVO ui) {
		ModelAndView model;
		String id = (String)request.getSession().getAttribute("id");
		if(id!=null) {
			model = new ModelAndView("myPlace_cont");
			ui.setUser_id(id);
			List<User_infoVO> ulist = this.user_InfoService.ui_getUserInfo(ui);
			model.addObject("ulist",ulist);
						
		}else {			
			model = new ModelAndView("main");
		}		
		
		return model;
	}//myPlace_cont() end
	
	@ResponseBody
	@PostMapping(value="update_memo_ok")
	public Map<String,String> update_memo_ok(HttpServletRequest request,HttpServletResponse response,String title,String color, String content,MemoVO memo) {
		
		
		Map<String,String> map = new HashMap<>();
		String id = (String)request.getSession().getAttribute("id");
		System.out.println(id);
		System.out.println(title);
		System.out.println(content);
		
			if(id!= null &&!title.isEmpty() && !content.isEmpty()) {//제목이랑 내용값이 들어왔다면
				memo.setUser_id(id);
				memo.setMemo_title(title);
				memo.setMemo_color(color);
				memo.setMemo_cont(content);
				this.memoService.insertMemo(memo);
				
				map.put("code", "성공");
			}else {
				map.put("code","실패");
			}
		
				
		return map;
	}
	
	
}
