package net.daum.service;

import java.util.List;

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

	@Override
	public List<NoticeVO> getNotice(NoticeVO no) {
		return this.noticeDao.getNotice(no);
	}

	@Override
	public NoticeVO getSelectNotice(NoticeVO no) {
		return this.noticeDao.getSelectNotice(no);
	}

	@Override
	public void updateNotice(NoticeVO no) {
		this.noticeDao.updateNotice(no);
	}

	@Override
	public void deleteNotice(int nno) {
		this.noticeDao.deleteNotice(nno);
	}
}
