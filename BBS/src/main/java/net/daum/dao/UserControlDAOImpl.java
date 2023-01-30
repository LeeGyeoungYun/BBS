package net.daum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.daum.vo.User_infoVO;

@Repository
public class UserControlDAOImpl implements UserControlDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<User_infoVO> getUserInfo(User_infoVO ui) {	
		return this.sqlSession.selectList("ct_getUserInfo",ui);
	}

	@Override
	public int countUser() {
		return this.sqlSession.selectOne("ct_countUser");
	}
	
	
}
