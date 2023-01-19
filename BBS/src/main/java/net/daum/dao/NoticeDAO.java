package net.daum.dao;

import java.util.List;

import net.daum.vo.NoticeVO;

public interface NoticeDAO {
	
	void insertNotice(NoticeVO no);
	void insertQna(NoticeVO no);
	List<NoticeVO> getNotice(NoticeVO no); //공지사항 및 QNA 리스트 불러오기
	NoticeVO getSelectNotice(NoticeVO no);

}
