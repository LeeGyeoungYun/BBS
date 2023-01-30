package net.daum.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.daum.dao.UserControlDAO;
import net.daum.vo.User_infoVO;

@Service
public class UserControlServiceImpl implements UserControlService {
	
	@Inject
	private UserControlDAO userControlDao;

	@Override
	public List<User_infoVO> getUserInfo(User_infoVO ui) {	
		return this.userControlDao.getUserInfo(ui);
	}

	@Override
	public int countUser() {
		return this.userControlDao.countUser();
	}
	
	
	
	

}
