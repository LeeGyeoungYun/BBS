package net.daum.dao;

import net.daum.vo.User_infoVO;

public interface User_infoDAO {
	
	void ui_info(User_infoVO ui);
	int checkID(User_infoVO ui);
	

}
