package net.daum.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.sun.mail.iap.Response;

import net.daum.service.User_infoService;
import net.daum.vo.User_infoVO;

@Controller
public class MyProfileController {

	
	@Autowired
	private User_infoService user_infoService;
	
	
	@RequestMapping(value="myinfo" , method=RequestMethod.GET)
	public ModelAndView myinfo(HttpServletRequest request,HttpSession session,HttpServletResponse response,@ModelAttribute User_infoVO ui)throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		ModelAndView listM;		
		String id = (String) request.getSession().getAttribute("id");//세션의 아이디 값을 받는다.
		
		if(id!= null) {// 접속해있는 아이디가 있다면? 세션아이디가 정상 작동중이라면?

			ui.setUser_id(id); //접속해있는 아이디 값을 받아와 ui에 저장
			List<User_infoVO> ulist=this.user_infoService.ui_getUserInfo(ui); //저장한 아이디값으로 유저 개인정보를 호출해 List에 저장
			
			listM = new ModelAndView("myinfo");//뷰페이지 설정		
			listM.addObject("ulist",ulist);// 뷰페이지에 보낼 정보 값 넣기
			
			return listM;
		}else {
			listM = new ModelAndView("main");
			return listM;
		}		
	}
	
	
	@PostMapping(value="updateProfile_ok")
	public String updateProfile_ok(@ModelAttribute User_infoVO ui,HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		String id = (String)request.getSession().getAttribute("id");
		
		if(id==null){//세션이 만료된 상태라면?
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('세션이 만료되었습니다.')");
			out.println("location='/BBS/'");
			out.println("</script>");		
		}
		
			
		ui.setUser_id(id);
		String saveFolder = request.getRealPath("resources/uploadUserProfile"); // 이진 파일 업로드 서버 경로 -> 톰캣 WAS 서버에 의해서 변경된
																				// 실제 톰켓 프로젝트 경로
		int fileSize = 5 * 1024 * 1024;// 이진 파일 업로드 최대크기 => 5M로 설정
		MultipartRequest multi = null;// 이진파일 업로드 참조변수 ->cos.jar에서 읽어들임.

		multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8");

		File upFile = multi.getFile("user_profile");// 첨부한 이진파일을 가져온다.

		if (upFile != null) {// 첨부한 프로필 사진이 있다면?

			// if()//첨부한 사진은 있지만 원래 사진이라면? 즉, 사진을 바꾸지 않았다면?
			String fileName = upFile.getName();

			File path01 = new File(saveFolder);
			if (!path01.exists()) {
				try {
					System.out.println("해당 디렉토리가 존재하지않음");
					path01.mkdir();
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				System.out.println("해당 경로에 디렉토리가 있습니다.");
			}

			Calendar c = Calendar.getInstance();
			int year = c.get(Calendar.YEAR);
			int month = c.get(Calendar.MONTH);
			int date = c.get(Calendar.DATE);

			Random r = new Random();
			int random = r.nextInt(100000000);

			int index = fileName.indexOf('.');
			String fileExtendsion = fileName.substring(index + 1);
			String refileName = "UserProfile-" + year + "_" + month + "_" + date + "_" + random + "." + fileExtendsion;// 새로운
																														// 이진파일명
																														// 저장
			String fileDBName = "/" + refileName;// 데이터베이스 저장될 값

			upFile.renameTo(new File(saveFolder + "/" + refileName));// 변경된 이진파일로 새롭게 생성된 폴더에 실제 업로드
			ui.setUser_profile(fileDBName);

			String nick = multi.getParameter("user_nickname");
			ui.setUser_nickname(nick);
			this.user_infoService.ui_updateNick(ui);
			this.user_infoService.ui_updateProfile(ui); // 프로필 변경

			request.getSession().removeAttribute("nick");// 닉네임을 변경하기전 유지되어있는 세션을 없애야지 바뀐 닉네임이 헤더에 표시됌.
			request.getSession().setAttribute("nick", nick);// 바뀐 닉네임을 다시 세션에 추가

			return "redirect:/myinfo";
		} // 첨부한 프로필 사진이 있다면? end
		else {// 첨부한 프로필 사진 변경이 없다면? 닉네임만 변경
			String nick = multi.getParameter("user_nickname");
			ui.setUser_nickname(nick);
			this.user_infoService.ui_updateNick(ui);

			request.getSession().removeAttribute("nick");// 닉네임을 변경하기전 유지되어있는 세션을 없애야지 바뀐 닉네임이 헤더에 표시됌.
			request.getSession().setAttribute("nick", nick);// 바뀐 닉네임을 다시 세션에 추가

			return "redirect:/myinfo";
		}
		
		
		
	}
	
	
	@PostMapping(value="updateInfo_ok")
	public String updateInfo_ok(HttpServletRequest request,User_infoVO ui) {
		
		ui.setUser_id((String)request.getSession().getAttribute("id"));
		
		if(ui.getUser_pwd()== "") {//비밀번호는 변경하지 않는다면?
			this.user_infoService.ui_updateInfoXpw(ui);
		}else {// 비밀번호까지 변경할꺼라면?
			this.user_infoService.ui_updateInfo(ui);
		}
		
		
		return "redirect:/myinfo";
	}
	
	@PostMapping(value="deleteProfile")
	@ResponseBody
	public Map<String,String> deleteProfile(String image,HttpServletRequest request) {
				
		String[] sp = image.split("/");
		String imageName = sp[sp.length-1];
		String path = request.getRealPath("resources/uploadUserProfile/"+imageName);
		Map<String,String> map = new HashMap<>();
		
		File file =new File(path);
		if(file.exists()) {//해당파일이 존재한다면? --> 파일삭제 
			file.delete();//저장소에 있는 파일 삭제
			String id = (String)request.getSession().getAttribute("id");
			this.user_infoService.ui_deleteProfile(id); //해당 프로필 사진 DB 삭제
			map.put("code","프로필 사진이 삭제되었습니다.");
			System.out.println("프로필 사진이 삭제되었습니다.");		
		}else {//해당파일이 존재하지않는다면?
			System.out.println("파일이 존재하지않습니다.");
			map.put("code","프로필 사진이 존재하지 않습니다.");
		}
		
		return map;
	}//deleteProfile() end
	
	
	@ResponseBody
	@PostMapping(value="deleteUser_request")
	public Map<String,String> deleteUser_request(String pwd,HttpServletRequest request) {
		
		Map<String,String> map = new HashMap<>();
		String id =(String)request.getSession().getAttribute("id");
		String password = this.user_infoService.ui_getPasswd(id);
		
		
		if(password.equals(pwd)) {
			map.put("code", "일치");
		}else {
			map.put("code","비번이 다름");
		}
		
		
		return map;
	}
	
	
	@ResponseBody
	@GetMapping(value="deleteUser_ok")
	public Map deleteUser_ok(String choiceRequest,HttpServletRequest request) {
		Map<String,String> map = new HashMap<>();
		
		if(choiceRequest.equals("true")) {
			String id = (String)request.getSession().getAttribute("id");			
			this.user_infoService.ui_withdrawal(id); //계정삭제			
			request.getSession().removeAttribute("id"); //세션 삭제
			request.getSession().invalidate(); // 세션말소
			map.put("code", "성공");
			
		}
		
		return map;
	}
	
	@RequestMapping(value="withdrawal")
	public String withdrawal() {
		
		return "withdrawal";
	}
	
	
}
