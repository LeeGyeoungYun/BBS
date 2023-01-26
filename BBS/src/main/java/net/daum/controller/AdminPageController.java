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
import org.springframework.web.bind.annotation.ResponseBody;
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
		model.addAttribute("count",clist.size());//현재페이지에서 출력되고있는 리스트의 수
		
		
		return "adminPage/communityControlPage";
	}
	
	@GetMapping(value="/noticeControl")
	public String noticeControl(Model model,HttpServletRequest request,NoticeVO no,HttpServletResponse response,Integer page) throws IOException {
		
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
	
		if(page==null) { //만약 처음 클릭해서 들어간거라면?
			page =1;
		}
		
		no.setStartPage((page-1)*10+1);
		no.setEndPage(page*10);
		
		int limit = no.getStartPage();
		
		no.setCategory("Notice");// 공지사항만 리스트 출력하기위해 설정
		
		int totalCount = this.noticeService.countNotice(no);
		List<NoticeVO> nlist = this.noticeService.getNotice(no);
		
		if(limit>totalCount || page <= 0) {
			out.println("<script>");
			out.println("alert('페이지범위를 초과하였습니다.')");
			out.println("history.back();");
			out.println("</script>");
			out.flush();
		}
		
		model.addAttribute("nlist",nlist);
		model.addAttribute("count",nlist.size());//현재 페이지에 출력되고있는 부분 리스트 수
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("page",page);
		
		//System.out.println(nlist);
		
		return "adminPage/noticeControlPage";
	}
	
	@GetMapping(value="/qnaControl")
	public String qnaControl(Model model,HttpServletRequest request,NoticeVO no,HttpServletResponse response, Integer page) throws IOException {
		
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
		
		if(page==null) { //만약 처음 클릭해서 들어간거라면?
			page =1;
		}
		
		no.setStartPage((page-1)*10+1);
		no.setEndPage(page*10);
		
		int limit = no.getStartPage();
		
		no.setCategory("QNA");// QNA만 리스트 출력하기위해 설정
		
		int totalCount = this.noticeService.countNotice(no);
		List<NoticeVO> nlist = this.noticeService.getNotice(no);
		
		if(limit>totalCount || page <= 0) {
			out.println("<script>");
			out.println("alert('페이지범위를 초과하였습니다.')");
			out.println("history.back();");
			out.println("</script>");
			out.flush();
		}
		
		model.addAttribute("nlist",nlist);
		model.addAttribute("count",nlist.size());//현재 페이지에 출력되고있는 부분 리스트 수
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("page",page);
		
		return "adminPage/qnaControlPage";
	}
	
	@GetMapping(value="/updateNotice")
	public String updateNotice(Model model,HttpServletRequest request,HttpServletResponse response,String kind) throws IOException {
		
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
		model.addAttribute("kind",kind); //공지사항추가인건지 QNA추가인건지 확인하는 매개변수
		
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
			return "redirect:/qnaControl";

		}
		 

	}//updateNotice_ok() end
	
	@GetMapping(value="/notice")
	public ModelAndView notice(HttpServletResponse response,HttpServletRequest request,int nno, String state,NoticeVO no,User_infoVO ui) throws IOException {
		
		ModelAndView ma = new ModelAndView();
		
		String id = (String) request.getSession().getAttribute("id");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(id==null||!id.equals("admin")) {//만약 관리자가 아니라면?
			out.println("<script>");
			out.println("alert('권한이 없습니다. 다시 로그인해 주세요')");
			out.println("location.replace('/BBS/login')");
			out.println("</script>");
			out.flush();	
		}
		
		ui.setUser_id(id);	
		no.setNno(nno);
		
		no = this.noticeService.getSelectNotice(no);
		List<User_infoVO> ulist = this.user_infoService.ui_getUserInfo(ui);
		
		ma.addObject("no",no);
		ma.addObject("ulist",ulist);
		
		if(state.equals("modify")) {
			ma.setViewName("/adminPage/modifyNotice");
		}else if(state.equals("delete")) { //삭제하는거라면?
			
			String kind = no.getNotice_kind(); //QNA인지 Notice인지 구별하기위해 
			this.noticeService.deleteNotice(nno);//db삭제가 이뤄짐
			
			if(kind.equals("Notice")) {//공지사항이라면?
				//System.out.println("공지사항으로 들어옴");
				ma.setViewName("/adminPage/noticeControlPage");
				
				out.println("<script>");
				out.println("alert('해당 공지사항이 삭제 되었습니다.')");
				out.println("location.replace('noticeControl')");
				out.println("</script>");
				out.flush();
				
			}else {
				//System.out.println("QNA로 들어옴");
				ma.setViewName("/adminPage/qnaControlPage");
				
				out.println("<script>");
				out.println("alert('해당 질의응답이 삭제 되었습니다.')");
				out.println("location.replace('qnaControl')");
				out.println("</script>");
				out.flush();
			}
			
			return null;
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
			return "redirect:/qnaControl";

		}
		
	}
	
	
	
	

}
