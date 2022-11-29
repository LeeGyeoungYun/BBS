package net.daum.service;

import net.daum.vo.User_infoVO;

public interface User_infoService {
	
	void ui_info(User_infoVO ui);
	int checkID(User_infoVO ui);
	int loginCheck(User_infoVO ui);
	String getNickname(String id);

}
