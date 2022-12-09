package net.daum.dao;

import java.util.List;

import net.daum.vo.User_infoVO;

public interface User_infoDAO {
	
	void ui_info(User_infoVO ui);//유저 정보 저장(회원가입)
	int checkID(User_infoVO ui);//아이디 중복검사
	int loginCheck(User_infoVO ui);//로그인 
	String getNickname(String id);
	void ui_updateNick(User_infoVO ui); //닉네임 수정
	void ui_updateInfo(User_infoVO ui); //유저 정보 수정
	void ui_updateInfoXpw(User_infoVO ui); //패스워드 빼고 유저 정보 수정
	void ui_updateProfile(User_infoVO ui); //프로필사진 변경
	List<User_infoVO> ui_getUserInfo(User_infoVO ui); //유저 정보 반환
	String ui_getProfile(String id);//프로필사진 가져오기
	String ui_getPasswd(String id);// 패스워드 가져오기
	void ui_deleteProfile(String id); // 프로필사진 삭제
	void ui_withdrawal(String id); // 회원탈퇴
	
}
