package net.daum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.daum.vo.MemoVO;

@Repository
public class CommunityDAOImpl implements CommunityDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertCmMemo(MemoVO memo) { //커뮤니티에 글 작성
		this.sqlSession.insert("memo_cmInsert",memo);	
	}

	@Override
	public List<MemoVO> getCmMyMemo(MemoVO memo) { //커뮤니티에서 내가 쓴 글 목록 불러오기
		return this.sqlSession.selectList("memo_myCmMemo",memo);
	}

	@Override
	public List<MemoVO> getCmMemo(MemoVO memo) { // 커뮤니티에 모든 글 목록 불러오기
		return this.sqlSession.selectList("memo_cmSearchMemo",memo);
	}

}
