package net.daum.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import net.daum.service.User_infoService;

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
	
	
	@PostMapping(value="update_memo_ok")
	public String update_memo_ok(HttpServletRequest request) {
		
		String title = request.getParameter("memo_title");
		System.out.println(title);
		String cont = request.getParameter("memo_cont");
		System.out.println(cont);
		
		return "myPlace_cont";
	}
	
	
}
