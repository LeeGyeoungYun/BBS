package net.daum.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import net.daum.service.User_infoService;

@Controller
public class MyPlaceController {
	
	@Autowired
	private User_infoService user_InfoService;
	
}
