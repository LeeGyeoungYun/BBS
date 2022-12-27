package net.daum.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.daum.service.MemoService;
import net.daum.service.User_infoService;
import net.daum.vo.MemoVO;
import net.daum.vo.User_infoVO;

@Controller
public class MyPlaceController {
	
	@Autowired
	private User_infoService user_InfoService;
	
	@Autowired
	private MemoService memoService;
	
	@RequestMapping(value="myPlace")
	public String myPlace(Model model,HttpServletRequest request,User_infoVO ui,MemoVO memo) {
		
		String id = (String)request.getSession().getAttribute("id");
		String fieldName = request.getParameter("fieldName");//jsp에서 검색란 값을 불러와 변수에 저장
		if(id!=null) {

			ui.setUser_id(id); // 내프로필불러올때 필요
			memo.setUser_id(id); //내 메모 불러올때 필요
			memo.setFieldName("%"+fieldName+"%"); //불러온 변수를 DB로 보내기전 앞 뒤에 %값 넣기
			
			
			List<User_infoVO> ulist = this.user_InfoService.ui_getUserInfo(ui);
			
			if(fieldName == null || fieldName == "") {//검색창이 비어있다면?
				List<MemoVO> mlist = this.memoService.getMyMemo(memo); //저장한 값을 DB로 보내 정보 요청
				model.addAttribute("mlist",mlist);//불러온 리스트값을 받아 모델앤뷰에 담아 해당 페이지로 정보를 보냄
			}else {//만약 검색창이 비어있지 않다면?
				List<MemoVO> mlist = this.memoService.getMySearchMemo(memo);
				model.addAttribute("mlist",mlist);//불러온 리스트값을 받아 모델앤뷰에 담아 해당 페이지로 정보를 보냄
			}
			
			model.addAttribute("ulist",ulist);
		
	
			return "myPlace";
		}else {			
			return "main";
		}		
		
	}//myPlace() end
	
	@RequestMapping(value="myPlace_cont")
	public ModelAndView myPlace_cont(HttpServletRequest request,User_infoVO ui) {
		ModelAndView model;
		String id = (String)request.getSession().getAttribute("id");
		if(id!=null) {
			model = new ModelAndView("myPlace_cont");
			ui.setUser_id(id);
			List<User_infoVO> ulist = this.user_InfoService.ui_getUserInfo(ui);
			model.addObject("ulist",ulist);
						
		}else {			
			model = new ModelAndView("main");
		}		
		
		return model;
	}//myPlace_cont() end
	
	@ResponseBody
	@PostMapping(value="update_memo_ok")
	public Map<String,String> update_memo_ok(HttpServletRequest request,HttpServletResponse response,String title,String color, String content,MemoVO memo) {
		
		
		Map<String,String> map = new HashMap<>();
		String id = (String)request.getSession().getAttribute("id");
		System.out.println(id);
		System.out.println(title);
		System.out.println(content);
		
			if(id!= null &&!title.isEmpty() && !content.isEmpty()) {//제목이랑 내용값이 들어왔다면
				memo.setUser_id(id);
				memo.setMemo_title(title);
				memo.setMemo_color(color);
				memo.setMemo_cont(content);
				this.memoService.insertMemo(memo);
				
				map.put("code", "성공");
			}else {
				map.put("code","실패");
			}
		
				
		return map;
	}
	
	
}
