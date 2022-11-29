package net.daum.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.daum.service.User_infoService;

@Controller
public class MyProfileController {

	
	@Autowired
	private User_infoService user_infoService;
	
	
	@RequestMapping(value="myinfo" , method=RequestMethod.GET)
	public String myinfo(HttpSession session) {
		
		String id = (String) session.getAttribute("id");//세션의 아이디 값을 받는다.
		this.user_infoService.getNickname(id); // 받은 세션아이디값을 매개변수로 넣어 닉네임 호출
			
		return "myinfo";
	}
}
