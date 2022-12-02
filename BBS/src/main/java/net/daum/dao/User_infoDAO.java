package net.daum.dao;

import net.daum.vo.User_infoVO;

public interface User_infoDAO {
	
	void ui_info(User_infoVO ui);//유저 정보 저장(회원가입)
	int checkID(User_infoVO ui);//아이디 중복검사
	int loginCheck(User_infoVO ui);//로그인 
	String getNickname(String id);
	void ui_updateNick(User_infoVO ui); //닉네임 수정

}
