package net.daum.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.daum.dao.NoticeDAO;
import net.daum.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Inject
	private NoticeDAO noticeDao;

	@Override
	public void insertNotice(NoticeVO no) {
		this.noticeDao.insertNotice(no);
	}

	@Override
	public void insertQna(NoticeVO no) {
		this.noticeDao.insertQna(no);		
	}
}
