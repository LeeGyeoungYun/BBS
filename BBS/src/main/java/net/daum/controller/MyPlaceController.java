package net.daum.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import org.springframework.web.bind.annotation.RequestParam;
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
		
	}// update_memo_ok() end
	
	
	@RequestMapping(value="myMemo")
	public ModelAndView myMemo(@RequestParam("mno") int mno,String state,HttpServletRequest request,MemoVO memo,User_infoVO ui,HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		ModelAndView ma = new ModelAndView();
		String id=(String) request.getSession().getAttribute("id");
		ui.setUser_id(id);
			
		if(id==null) {
			out.println("<script>");
			out.println("alert('세션이 만료되었습니다.')");
			out.println("location='/BBS/'");
			out.println("</script>");
		}
		
		if(state.equals("content")) {//내용보기라면?
			memo = this.memoService.getMemoContent(mno); //내용보기 + 조회수증가
		}else { //수정폼하고 삭제폼이라면?
			memo = this.memoService.getMemoContent2(mno); // 내용보기만
		}
		
		List<MemoVO> mlist = this.memoService.getMyMemo(memo);
		List<User_infoVO> ulist = this.user_InfoService.ui_getUserInfo(ui);
				
		ma.addObject("mlist",mlist);
		ma.addObject("ulist",ulist); //헤더jsp에 딸린 프로필사진 불러오기위해서 필요함
		ma.addObject("m",memo);
		
		if(memo.getUser_id().equals(id)) {
			String answer = "success";
			ma.addObject("answer",answer);
		}
		
		if(state.equals("content")) {
			ma.setViewName("myMemo_content");
		}else if(state.equals("modify")) {
			ma.setViewName("myMemo_modify");
		}else if(state.equals("delete")) {
			
			String db_id = memo.getUser_id(); //현재 들어와있는 메모의 아이디값을 받아옴
			
			if(id.equals(db_id)) { //만약 메모쓴 아이디값하고 지금 세션아이디값하고 일치하다면, 즉 내가쓴 메모라면
				
				System.out.println("여기들어옴");
				this.memoService.deleteMemo(mno);
				
				ma.setViewName("myPlace");
				out.println("<script>");
				out.println("alert('메모가 삭제되었습니다.')");
				out.println("location='myPlace'");
				out.println("</script>");
			}
				
			
			//여기서부턴 db삭제 이뤄줘야함
			
			return null;
		}
		
		return ma;
	}
	
	@ResponseBody
	@PostMapping(value="modify_memo_ok")
	public Map modify_memo_ok(MemoVO memo, String title, String content, String color,int mno,HttpServletRequest request) {
		
		Map<String,String> map = new HashMap<>();
		String id= (String)request.getSession().getAttribute("id");
		memo = this.memoService.getMemoContent2(mno); // memo객체에 불러온 해당 게시물번호를 가지고 정보값 불러와 저장
		
		
		if(memo.getUser_id().equals(id) && !title.isEmpty() && !content.isEmpty() && mno >=0) { //만약 아작스 통신으로 값이 제대로 도착했다면?	
			
			memo.setMemo_title(title); //바뀐 제목 내용 메모지색을 memo객체에 저장후 db로 보냄
			memo.setMemo_cont(content);
			memo.setMemo_color(color);
			
			this.memoService.modifyMyMemo(memo);//값변경
			
			map.put("code","성공");
		}else {
			map.put("code","실패");
		}
				
		return map;
	}
	
	
}
