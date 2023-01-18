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
	public String cmControl(Model model,HttpServletRequest request,MemoVO memo) {
		
		List<MemoVO> clist = this.communityService.no_getCmMemo(memo);
		model.addAttribute("clist",clist);
		model.addAttribute("count",clist.size());
		
		return "adminPage/communityControlPage";
	}
	
	@GetMapping(value="/noticeControl")
	public String noticeControl(Model model,HttpServletRequest request,NoticeVO no) {
		
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
	
	@GetMapping(value="/controlNotice")
	public ModelAndView controlNotice(HttpServletRequest request,int nno, String state) {
		
		ModelAndView ma = new ModelAndView();
		ma.setView("");
		
		
		return ma;
	}
	
	

}
