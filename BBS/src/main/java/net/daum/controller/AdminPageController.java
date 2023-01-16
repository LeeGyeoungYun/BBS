package net.daum.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
	
	@GetMapping(value="noticeControl")
	public String noticeControl() {
		
		return "adminPage/noticeControlPage";
	}
	
	@GetMapping(value="updateNotice")
	public String updateNotice() {
		
		return "adminPage/updateNotice";
	}
	
	@PostMapping(value="updateNotice_ok")
	public String updateNotice_ok(HttpServletRequest request) {
		
		String notice_kind = request.getParameter("notice_kind");
		String notice_title = request.getParameter("notice_title");
		String notice_cont = request.getParameter("notice_cont");
		
		System.out.println(notice_kind);
		System.out.println(notice_title);
		System.out.println(notice_cont);
		return "redirect:updateNotice";
	}
	
	

}
