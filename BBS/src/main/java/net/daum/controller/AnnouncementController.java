package net.daum.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import net.daum.service.MemoService;

@Controller
public class AnnouncementController {

	@Autowired
	private MemoService memoService;
	
	@GetMapping(value="announcement")
	public String announcement() {
		
		return "announcement";
	}
	
	@GetMapping(value="qna")
	public String qna() {
		
		return "qna";
	}
}
