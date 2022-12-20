package net.daum.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.daum.service.User_infoService;
import net.daum.vo.MemoVO;

@Controller
public class MyPlaceController {
	
	@Autowired
	private User_infoService user_InfoService;
	
	@RequestMapping(value="myPlace_cont")
	public String myPlace_cont(HttpServletRequest request) {
		
		String id = (String)request.getSession().getAttribute("id");
		if(id!=null) {		
			return "myPlace_cont";
		}else {			
			return "redirect:/";
		}		
	}//myPlace_cont() end
	
	@ResponseBody
	@PostMapping(value="update_memo_ok")
	public Map<String,String> update_memo_ok(HttpServletRequest request,String title, String content,MemoVO memo) throws IOException {
		
		Map<String,String> map = new HashMap<>();
		
		if(title!=null && content!= null) {//제목이랑 내용값이 들어왔다면
			map.put("code", "성공");
		}else {
			map.put("code","실패");
		}
		
		return map;
	}
	
	
}
