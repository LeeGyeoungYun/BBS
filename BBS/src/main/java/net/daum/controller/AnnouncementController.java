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

import net.daum.service.MemoService;
import net.daum.service.NoticeService;
import net.daum.vo.NoticeVO;

@Controller
public class AnnouncementController {

	@Autowired
	private MemoService memoService;
	
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping(value="announcement")
	public String announcement(Model model,NoticeVO no,Integer page,HttpServletResponse response) throws IOException  {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(page==null) {
			page=1;
		}
		no.setStartPage((page-1)*10+1);
		no.setEndPage(page*10);
			
		int limit = no.getStartPage();	
		int totalCount = this.noticeService.countNotice(no);
			
		no.setCategory("Notice");
		List<NoticeVO> nlist = this.noticeService.getNotice(no);// 공지사항만 받아들이는 리스트
		
		if( limit>totalCount || page <= 0 ) {
			out.println("<script>");
			out.println("alert('페이지범위를 초과하였습니다.')");
			out.println("history.back();");
			out.println("</script>");
			out.flush();
		}
		
		
		model.addAttribute("nlist",nlist);
		model.addAttribute("page",page);
		model.addAttribute("count",nlist.size());
		model.addAttribute("totalCount",totalCount);
		
		
		return "announcement";
		
	}//announcement() end
	
	
	@GetMapping(value="qna")
	public String qna(Model model,NoticeVO no,Integer page,HttpServletResponse response)throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(page==null) {
			page=1;
		}
		no.setStartPage((page-1)*10+1);
		no.setEndPage(page*10);
			
		int limit = no.getStartPage();	
		int totalCount = this.noticeService.countNotice(no);
			
		no.setCategory("QNA");
		List<NoticeVO> qlist = this.noticeService.getNotice(no);// 공지사항만 받아들이는 리스트
		
		if( limit>totalCount || page <= 0 ) {
			out.println("<script>");
			out.println("alert('페이지범위를 초과하였습니다.')");
			out.println("history.back();");
			out.println("</script>");
			out.flush();
		}
		
		
		model.addAttribute("qlist",qlist);
		model.addAttribute("page",page);
		model.addAttribute("count",qlist.size());
		model.addAttribute("totalCount",totalCount);
		
		return "qna";
		
	}//qna() end
	
	
	@GetMapping(value="allNotice")
	public String allNotice(Model model,NoticeVO no,Integer page,HttpServletResponse response)throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(page==null) {
			page=1;
		}
		no.setStartPage((page-1)*10+1);
		no.setEndPage(page*10);
			
		int limit = no.getStartPage();	
		int totalCount = this.noticeService.countNotice(no);
			
		no.setCategory("all");
		List<NoticeVO> alist = this.noticeService.getNotice(no);// 공지사항만 받아들이는 리스트
		
		if( limit>totalCount || page <= 0 ) {
			out.println("<script>");
			out.println("alert('페이지범위를 초과하였습니다.')");
			out.println("history.back();");
			out.println("</script>");
			out.flush();
		}
		
		
		model.addAttribute("alist",alist);
		model.addAttribute("page",page);
		model.addAttribute("count",alist.size());
		model.addAttribute("totalCount",totalCount);
		
		return "allNotice";
		
	}//allNotice() end
	
	@GetMapping(value="/allNotice/Notice")
	public String allNotice_Notice(HttpServletRequest request) {
		
		int index = Integer.parseInt(request.getParameter("nno"));
		System.out.println(index);
		
		
		return "test";
	}
	
}
