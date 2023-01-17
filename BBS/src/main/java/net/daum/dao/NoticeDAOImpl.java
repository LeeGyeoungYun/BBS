package net.daum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.daum.vo.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertNotice(NoticeVO no) { //공지사항 추가
		this.sqlSession.insert("no_insertNotice",no);	
	}
	
	@Override
	public void insertQna(NoticeVO no) { //Qna추가
		this.sqlSession.insert("no_insertQna",no);		
	}

	@Override
	public List<NoticeVO> getNotice(NoticeVO no) {		
		return this.sqlSession.selectList("no_getNotice",no);
	}
	
	

}
