package net.daum.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.daum.vo.User_infoVO;

@Repository //DB에 접근하는 코드를 모아두는 곳
public class User_infoDAOImpl implements User_infoDAO {

	@Autowired //의존성 주입 -> @Autowired는 주입하려고 하는 객체의 타입이 일치하는 객체를 자동으로 주입한다.
	private SqlSession sqlSession;

	@Override
	public int checkID(User_infoVO ui) {
		
		return this.sqlSession.selectOne("ui_idCheck",ui);
	}
	
	
}