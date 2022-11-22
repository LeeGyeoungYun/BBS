package net.daum.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.daum.service.User_infoService;
import net.daum.vo.User_infoVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@Autowired
	private User_infoService user_infoService;
	
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
	@ResponseBody//이것을써야 서버와 클라이언트간에 새로고침없이 비동기통신이 이뤄질수있다. 응답할때 사용 어노테이션. 응답본문을 여기에담아 보낸다라는뜻. 주로 JSON에서 사용된다. 
	public Map<String,String> idCheck(String id, User_infoVO ui) {
		Map<String,String> result = new HashMap<String,String>();
		System.out.println(id);
		ui.setUser_id(id); //view에서 보낸 아이디값을 파라미터로 받아 User_info클래스에 저장
		System.out.println("방금 저장한 값 호출"+ ui.getUser_id());
		int cnt = user_infoService.checkID(ui);// 그 저장된 정보가 있는 User_infoVO클래스를 쿼리문으로 보내서 실행
		
		System.out.println(cnt);
		
		if(cnt==0) {//아이디가 존재하지않는다면?
			result.put("code","사용가능한 아이디입니다.");
			System.out.println(result);
		}else {
			result.put("code","이미 존재하는 아이디입니다.");
			System.out.println(result);
		}
		
		return result;
	}
	
	
	
}
