package net.daum.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import net.daum.service.CommunityService;
import net.daum.service.MemoService;
import net.daum.service.NoticeService;
import net.daum.service.User_infoService;
import net.daum.vo.MemoVO;
import net.daum.vo.NoticeVO;
import net.daum.vo.User_infoVO;

@Controller
public class AdminPageController {
	
	@Autowired
	private User_infoService user_infoService;
	
	@Autowired
	private MemoService memoService;
	
	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping(value="cmControl")
	public String cmControl(Model model,HttpServletRequest request,MemoVO memo,HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String id=(String)request.getSession().getAttribute("id");
		if(id==null||!id.equals("admin")) { //관리자만 접근가능
			out.println("<script>");
			out.println("alert('접근권한이 없습니다.')");
			out.println("location.replace('/BBS/')");
			out.println("</script>");
			out.flush();
		}
		
		List<MemoVO> clist = this.communityService.no_getCmMemo(memo);
		model.addAttribute("clist",clist);
		model.addAttribute("count",clist.size());
		
		return "adminPage/communityControlPage";
	}
	
	@GetMapping(value="/noticeControl")
	public String noticeControl(Model model,HttpServletRequest request,NoticeVO no,HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String id=(String)request.getSession().getAttribute("id");
		if(id==null||!id.equals("admin")) {//관리자만 접근가능
			out.println("<script>");
			out.println("alert('접근권한이 없습니다.')");
			out.println("location.replace('/BBS/')");
			out.println("</script>");
			out.flush();
		}
		
		
		no.setCategory("Notice");// 공지사항만 리스트 출력하기위해 설정
		
		List<NoticeVO> nlist = this.noticeService.getNotice(no);
		
		model.addAttribute("nlist",nlist);
		model.addAttribute("count",nlist.size());
		//System.out.println(nlist);
		
		return "adminPage/noticeControlPage";
	}
	
	@GetMapping(value="/updateNotice")
	public String updateNotice(HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String id = (String)request.getSession().getAttribute("id");
				
		if(id==null||!id.equals("admin")) { //세션이 비어있거나 아이디값이 admin이 아니라면?
			out.println("<script>");
			out.println("alert('접근이 허가되지 않습니다.')");
			out.println("location.href='/BBS/'");
			out.println("</script>");
			out.flush();
		}
		
		
		return "adminPage/updateNotice";
	}
	
	@PostMapping(value="updateNotice_ok")
	public String updateNotice_ok(HttpServletRequest request,NoticeVO no) {
			
		String notice_kind = request.getParameter("notice_kind");
		String notice_title = request.getParameter("notice_title");
		String notice_cont = request.getParameter("notice_cont");
		String id = (String)request.getSession().getAttribute("id");
		
		no.setUser_id(id);
		no.setNotice_title(notice_title);
		no.setNotice_cont(notice_cont);	
		
		if (notice_kind.equals("an")) { // 공지사항으로 체크했다면

			this.noticeService.insertNotice(no);
			return "redirect:/noticeControl";

		} else { // QnA로 올릴꺼라면?

			this.noticeService.insertQna(no);
			return "redirect:/updateNotice";

		}
		 

	}//updateNotice_ok() end
	
	@GetMapping(value="/notice")
	public ModelAndView notice(HttpServletRequest request,int nno, String state,NoticeVO no,User_infoVO ui) {
		
		ModelAndView ma = new ModelAndView();
		
		String id = (String) request.getSession().getAttribute("id");
		ui.setUser_id(id);	
		no.setNno(nno);
		
		no = this.noticeService.getSelectNotice(no);
		List<User_infoVO> ulist = this.user_infoService.ui_getUserInfo(ui);
		
		ma.addObject("no",no);
		ma.addObject("ulist",ulist);
		
		if(state.equals("modify")) {
			ma.setViewName("/adminPage/modifyNotice");
		}else if(state.equals("delete")) { //삭제하는거라면?
			//여기서 DB삭제 이뤄줘야함
		}
		
		
		
		return ma;
	}
	
	@PostMapping(value="modifyNotice_ok")
	public String modifyNotice_ok(HttpServletRequest request,NoticeVO no,int nno) {
		
		String notice_kind = request.getParameter("notice_kind");
		String notice_title = request.getParameter("notice_title");
		String notice_cont = request.getParameter("notice_cont");
			
		no.setNotice_title(notice_title);
		no.setNotice_cont(notice_cont);
		no.setNno(nno);
		
		if (notice_kind.equals("an")) { // 공지사항으로 체크했다면
			
			no.setNotice_kind("Notice");
			this.noticeService.updateNotice(no);
			return "redirect:/noticeControl";

		} else { // QnA로 올릴꺼라면?
			
			no.setNotice_kind("QNA");
			this.noticeService.updateNotice(no);
			return "redirect:/updateNotice";

		}
		
	}
	
	

}
