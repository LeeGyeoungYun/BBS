package net.daum.service;

import java.util.List;

import net.daum.vo.User_infoVO;

public interface User_infoService {
	
	void ui_info(User_infoVO ui);
	int checkID(User_infoVO ui);
	int loginCheck(User_infoVO ui);
	String getNickname(String id);
	void ui_updateNick(User_infoVO ui);
	void ui_updateProfile(User_infoVO ui);
	List<User_infoVO> ui_getUserInfo(User_infoVO ui); 
	String ui_getProfile(String id);

}
