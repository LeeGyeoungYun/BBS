package net.daum.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.daum.service.MailService;
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
	
	@Autowired
	private MailService mailService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(HttpServletRequest request, User_infoVO ui) {
		ModelAndView model;
		String id =(String) request.getSession().getAttribute("id");
		if(id != null) {			
			
			model = new ModelAndView("main");
			ui.setUser_id(id);
			List<User_infoVO> ulist = this.user_infoService.ui_getUserInfo(ui);
			model.addObject("ulist",ulist);
			
			return model;
		}else {
			model = new ModelAndView("main");
			return model;
		}
				
	}
	
	@GetMapping(value ="/login")
	public String login() {
		return "login_page";
	}
	
	@RequestMapping(value="/register_ok",method=RequestMethod.POST)
	public String register_ok(User_infoVO ui, RedirectAttributes rttr) {
		
		this.user_infoService.ui_info(ui);//회원가입 정보 저장
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/login_ok" ,method=RequestMethod.POST)
	public String login_ok(User_infoVO ui,RedirectAttributes rttr,HttpSession session,HttpServletRequest request,String user_id, String user_pwd) {
		
		/*
		 * if(user_id.equals("admin") && user_pwd.equals("admin")) {//관리자용 로그인
		 * System.out.println("관리자 로그인에 성공하였습니다.");
		 * request.getSession().setAttribute("id", "admin");
		 * request.getSession().setAttribute("nick", "관리자"); return "redirect:/"; }
		 */
		
			
		int i = this.user_infoService.loginCheck(ui);//입력한 값이 유저정보와 같은지 확인하고 같으면 1을 틀리면 0을 반환
		
		if(i==1) {//계정이 있다면 			
			System.out.println("로그인에 성공 하였습니다.");
			request.getSession().setAttribute("id", ui.getUser_id());//jsp에서 받은 id값을 세션에 저장
			
			String nick = this.user_infoService.getNickname(ui.getUser_id());
			request.getSession().setAttribute("nick",nick); // 아이디를 대체할 닉네임도 세션에 저장해 jsp로 보냄
						
			return "redirect:/";
		}else {
			System.out.println("로그인에 실패 하였습니다.");
			rttr.addAttribute("errorCode",1);
			return "redirect:/login";
		}
		
		
	}//login_ok() end
	
	@RequestMapping(value="logout")
	public String logout(User_infoVO ui,HttpServletRequest request, HttpSession session) {

		session.removeAttribute("id");
		request.getSession().invalidate(); 

		return "redirect:/";
	}
	
	
	@GetMapping(value="register")
	public String register() {
		return "register";
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
	
	@GetMapping(value="/find/id")
	public String findId() {
		
		return "findId";
	}
	
	@GetMapping(value="/find/pwd")
	public String findPwd() {
		
		return "findPwd";
	}
	
	@ResponseBody
	@PostMapping(value="/find/emailCheck_ok")
	public Map emailCheck(String phone,String email,User_infoVO ui) {
		
		Map<String,String> map = new HashMap<>();
		ui.setUser_phoneNum(phone);
		ui.setUser_email(email);
		
		String id= this.user_infoService.findId(ui);
		
		if(id==null||id.equals("")) {
			map.put("code","없는 아이디 입니다.");
		}else {
			map.put("code","아이디가 있습니다.");
		}
		
		return map;
		
	}
	
	@ResponseBody
	@PostMapping(value="/find/emailCode_ok")
	public Map<String,String> emailCode(String email,User_infoVO ui,String phone) { //매개변수로 받은 email은 보낼이를 의미함
		Map<String,String> map = new HashMap<>();
		ui.setUser_phoneNum(phone);
		ui.setUser_email(email);
		String id = this.user_infoService.findId(ui);
		
		if(id==null||id.equals("")) {//휴대폰 번호나 이메일이 올바르지가 않다면?
			map.put("code","잘못된 정보입니다.");
		}else {
			Random r = new Random();
			int index = r.nextInt(899999)+100000; //난수발생 100000 ~ 999999 자리 (6자리) 난수 발생해서 보냄
			
			String subject = "BBS 이메일 인증 번호 입니다."; //이메일 제목
			StringBuilder sb = new StringBuilder(); 
			sb.append("귀하의 인증 번호는 "+index+" 입니다."); //이메일 내용
			String from = "ruddbsdl17@gmail.com"; //보내는 사람
			
			this.mailService.send(subject,sb.toString(),from,email);//ServiceImpl에서 작성한 함수를 이용해 메일보내기
			map.put("code", "인증번호가 성공적으로 발송되었습니다.");
			map.put("index",Integer.toString(index));
			System.out.println(index);
		}
		
		
		
		
		 
		return map;
	}
	
	
	
	
	
}
