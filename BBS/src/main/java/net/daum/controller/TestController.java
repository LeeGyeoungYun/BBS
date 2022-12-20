package net.daum.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TestController {
	
	@GetMapping(value="test2")
	public String test2() {
		
		
		return "test2";
	}
	
	
	@PostMapping(value="prac_ok")
	public String prac_ok(HttpServletRequest request,Model model,@ModelAttribute("abc") String skalret) {
		
		
		//String name = request.getParameter("name");
		String pwd = request.getParameter("passwd");
		System.out.println(skalret+"   "+pwd );
		model.addAttribute("dab",skalret);
		
		return "test2";
	}
	
	@GetMapping(value="test3")
	public String test3() {
		return "test3";
	}
	

}
