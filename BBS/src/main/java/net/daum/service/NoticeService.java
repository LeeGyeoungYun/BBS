package net.daum.service;

import java.util.List;

import net.daum.vo.NoticeVO;

public interface NoticeService {
	
	void insertNotice(NoticeVO no);
	void insertQna(NoticeVO no);
	List<NoticeVO> getNotice(NoticeVO no);
	NoticeVO getSelectNotice(NoticeVO no);

}
