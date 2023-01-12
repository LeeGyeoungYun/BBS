package net.daum.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import net.daum.service.MemoService;
import net.daum.service.User_infoService;

@Controller
public class AdminPageController {
	
	@Autowired
	private User_infoService user_infoService;
	
	@Autowired
	private MemoService memoService;
	
	@GetMapping(value="cmControl")
	public String cmControl() {
		
		return "adminPage/communityControlPage";
	}

}
