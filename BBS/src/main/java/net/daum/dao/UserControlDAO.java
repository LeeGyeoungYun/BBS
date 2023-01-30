package net.daum.dao;

import java.util.List;

import net.daum.vo.User_infoVO;

public interface UserControlDAO {
	
	List<User_infoVO> getUserInfo(User_infoVO ui);
	int countUser();

}
