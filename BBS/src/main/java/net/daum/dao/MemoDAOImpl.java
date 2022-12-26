package net.daum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.daum.vo.MemoVO;

@Repository
public class MemoDAOImpl implements MemoDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertMemo(MemoVO memo) { //메모 생성
		this.sqlSession.insert("memo_insert",memo);
	}
	
	@Override
	public List<MemoVO> getMyMemo(MemoVO memo){ //내 메모 불러오기
		return this.sqlSession.selectList("memo_myMemo",memo);
	}
	

}
