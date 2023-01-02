package net.daum.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import net.daum.service.MemoService;
import net.daum.vo.MemoVO;

@Controller
public class CommunityController {
	
	@Autowired
	private MemoService memoService;
	
	
	@RequestMapping(value="community")
	public String community(Model model, HttpServletRequest request, MemoVO memo) {
		
		
		
		return "community";
	}
	

}
