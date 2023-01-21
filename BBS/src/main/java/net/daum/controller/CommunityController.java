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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.daum.service.CommunityService;
import net.daum.service.MemoService;
import net.daum.service.User_infoService;
import net.daum.vo.MemoVO;
import net.daum.vo.User_infoVO;

@Controller
public class CommunityController {
	
	@Autowired
	private MemoService memoService;
	
	@Autowired
	private User_infoService user_infoService;
	
	@Autowired
	private CommunityService communityService;
	
	
	@RequestMapping(value="community")
	public String community(Model model, HttpServletRequest request, MemoVO memo,User_infoVO ui) {
		
		String id = (String)request.getSession().getAttribute("id");
		String field = request.getParameter("field");
		String fieldName = request.getParameter("fieldName");
		
		memo.setField(field);
		memo.setFieldName("%"+fieldName+"%");
			
		if(id!=null) {//나의 헤더.jsp에 포함된 프로필사진을 출력하기 위해 필요한 조건문입니다.
			ui.setUser_id(id);
			memo.setUser_id(id);
			
			List<User_infoVO> ulist = this.user_infoService.ui_getUserInfo(ui);		
			List<MemoVO> cm_mylist = this.communityService.getCmMyMemo(memo);// 커뮤니티에 쓴 내 글 목록 불러오기
			
			model.addAttribute("ulist",ulist);
			model.addAttribute("cm_mylist",cm_mylist);
		}
		
		List<MemoVO> clist = this.communityService.getCmMemo(memo);//모든 커뮤니티 글 목록을 불러옵니다.
	
		model.addAttribute("clist",clist);
		
		
		return "community";
	}//community() end
	
	@RequestMapping(value="community_cont", method= RequestMethod.GET)
	public ModelAndView community_cont(User_infoVO ui,HttpServletRequest request,HttpServletResponse response) throws IOException {
				
		ModelAndView ma = new ModelAndView();
		String id = (String)request.getSession().getAttribute("id");		
		
		if(id!= null) {
			ui.setUser_id(id);
			List<User_infoVO> ulist = this.user_infoService.ui_getUserInfo(ui);
			ma.setViewName("community_cont");
			ma.addObject("ulist",ulist);
		}else {
			ma.setViewName("login_page");	
		}
		
		return ma;	
	}//community_cont() end
	
	@ResponseBody
	@PostMapping(value="update_cmmemo_ok")
	public Map<String,String> update_cmmemo_ok(HttpServletRequest request,String title, String content, String color,MemoVO memo){	
		Map<String,String> map = new HashMap<>();
		
		String id= (String)request.getSession().getAttribute("id");
		
		if(id!=null && !title.isEmpty() && !content.isEmpty()) { //로그인중이고 아이디값이랑 내용값이 제대로 들어와있다면?
			memo.setUser_id(id);
			memo.setMemo_title(title);
			memo.setMemo_cont(content);
			memo.setMemo_color(color);
			this.communityService.insertCmMemo(memo);
			
			map.put("code", "성공");
		}else {
			map.put("code", "실패");
		}
			
		return map;
	}//update_cmmemo_ok() end
	
	@RequestMapping(value="cmMemo")
	public ModelAndView myMemo(@RequestParam("mno") int mno,String state,HttpServletRequest request,MemoVO memo,User_infoVO ui,HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		ModelAndView ma = new ModelAndView();
		String id=(String) request.getSession().getAttribute("id");
		ui.setUser_id(id);
			
		if(id==null) {
			out.println("<script>");
			out.println("alert('로그인 후 이용가능합니다.')");
			out.println("location='/BBS/'");
			out.println("</script>");
		}
		
		if(state.equals("content")) {//내용보기라면?
			memo = this.memoService.getMemoContent(mno); //내용보기 + 조회수증가
		}else { //수정폼하고 삭제폼이라면?
			memo = this.memoService.getMemoContent2(mno); // 내용보기만
		}
		
		List<MemoVO> clist = this.communityService.getCmMemo(memo);//모든 커뮤니티 글 목록을 불러옵니다.
		List<User_infoVO> ulist = this.user_infoService.ui_getUserInfo(ui);
				
		ma.addObject("clist",clist);
		ma.addObject("ulist",ulist); //헤더jsp에 딸린 프로필사진 불러오기위해서 필요함
		ma.addObject("m",memo);
		
		if(memo.getUser_id().equals(id)) {
			String answer = "success";
			ma.addObject("answer",answer);
		}
		
		if(state.equals("content")) {
			ma.setViewName("cmMemo_content");
		}else if(state.equals("modify")) {
			ma.setViewName("cmMemo_modify");
		}else if(state.equals("delete")) {
			
			String db_id = memo.getUser_id(); //현재 들어와있는 메모의 아이디값을 받아옴
			
			if(id.equals(db_id)) { //만약 메모쓴 아이디값하고 지금 세션아이디값하고 일치하다면, 즉 내가쓴 메모라면
				
				System.out.println("여기들어옴");
				this.memoService.deleteMemo(mno);
				
				ma.setViewName("community");
				out.println("<script>");
				out.println("alert('메모가 삭제되었습니다.')");
				out.println("location.replace('community')");
				out.println("</script>");
			}else { //아이디가 일치하지 않는다면?
				
				ma.setViewName("community");
				out.println("<script>");
				out.println("alert('삭제할 권한이 없습니다.')");
				out.println("</script>"); 
			}
				
			
			return null;
		}
		
		return ma;
	}
	
	@ResponseBody
	@PostMapping(value="modify_cmMemo_ok")
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
