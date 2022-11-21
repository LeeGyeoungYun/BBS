package net.daum.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "main";
		
	}
	
	@GetMapping(value ="/login")
	public String hi() {
		return "login_page";
	}
	
	@GetMapping(value="register")
	public String register() {
		return "register";
	}
	
	@GetMapping(value="myPlace")
	public String myPlace() {
		return "myPlace";
	}
	
	@GetMapping(value="test")
	public String test() {
		return "test";
	}
	
	@RequestMapping(value="idCheck")
	@ResponseBody
	public void idCheck(String id) {
		System.out.println(id);
	}
	
	
	
}
