package net.daum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.daum.vo.User_infoVO;

@Repository //DB에 접근하는 코드를 모아두는 곳
public class User_infoDAOImpl implements User_infoDAO {

	@Autowired //의존성 주입 -> @Autowired는 주입하려고 하는 객체의 타입이 일치하는 객체를 자동으로 주입한다.
	private SqlSession sqlSession;
	
	@Override
	public void ui_info(User_infoVO ui) { //회원가입 메소드
		
		this.sqlSession.insert("ui_info",ui);
	}

	@Override
	public int checkID(User_infoVO ui) {//중복아이디 검사메소드
		return this.sqlSession.selectOne("ui_idCheck",ui);
	}
	
	@Override
	public int loginCheck(User_infoVO ui) {//로그인 체크
		return this.sqlSession.selectOne("ui_login",ui);
	}
	
	@Override
	public String getNickname(String id) {//별명 가져오기
		return this.sqlSession.selectOne("ui_nickname",id);
	}

	@Override
	public void ui_updateNick(User_infoVO ui) {
		
		this.sqlSession.update("ui_updateNick",ui);
	}
	
	@Override
	public void ui_updateInfo(User_infoVO ui) { // 유저정보 업데이트	
		this.sqlSession.update("ui_updateInfo",ui);
	}
	
	@Override
	public void ui_updateInfoXpw(User_infoVO ui) { // 유저정보 업데이트	
		this.sqlSession.update("ui_updateInfoXpw",ui);
	}
	
	@Override
	public void ui_updateProfile(User_infoVO ui) {
		this.sqlSession.update("ui_updateProfile",ui);
	}

	@Override
	public List<User_infoVO> ui_getUserInfo(User_infoVO ui) {
		
		return this.sqlSession.selectList("ui_getUserInfo",ui);
	}

	@Override
	public String ui_getProfile(String id) {		
		return this.sqlSession.selectOne("ui_getProfile",id);
	}

	@Override
	public String ui_getPasswd(String id) {	
		return this.sqlSession.selectOne("ui_getPasswd",id);
	}

	@Override
	public void ui_deleteProfile(String id) {
		this.sqlSession.update("ui_deleteProfile",id);		
	}

	@Override
	public void ui_withdrawal(String id) {
		this.sqlSession.delete("ui_withdrawal",id);
	}

	@Override
	public String findId(User_infoVO ui) {	
		return this.sqlSession.selectOne("ui_findId",ui);
	}

	@Override
	public String findPwd(User_infoVO ui) {
		return this.sqlSession.selectOne("ui_findPwd",ui);
	}

	
	@Override
	public void ui_updatePwd(User_infoVO ui) {
		this.sqlSession.update("ui_updatePwd",ui);
	}

	
	
	
}
