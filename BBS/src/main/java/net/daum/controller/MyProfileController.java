package net.daum.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.daum.service.User_infoService;

@Controller
public class MyProfileController {

	
	@Autowired
	private User_infoService user_infoService;
	
	
	@RequestMapping(value="myinfo" , method=RequestMethod.GET)
	public String myinfo(HttpServletRequest request,HttpSession session,Model model,HttpServletResponse response)throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String id = (String) request.getSession().getAttribute("id");//세션의 아이디 값을 받는다.
		if(id!= null) {
			String nick =this.user_infoService.getNickname(id); // 받은 세션아이디값을 매개변수로 넣어 닉네임 호출
			model.addAttribute("user_nickname",nick);
			return "myinfo";
		}else {
			return "main";
		}		
	}
	
	
	@PostMapping(value="updateProfile_ok")
	public String updateProfile_ok() {
		
		System.out.println("값보내짐");
		return "main";
	}
	
}