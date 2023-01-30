package net.daum.service;

import java.util.List;

import net.daum.vo.User_infoVO;

public interface UserControlService {
	
	List<User_infoVO> getUserInfo(User_infoVO ui);
	int countUser();

}
