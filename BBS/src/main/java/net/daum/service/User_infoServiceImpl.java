package net.daum.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.daum.dao.User_infoDAO;
import net.daum.vo.User_infoVO;

@Service
public class User_infoServiceImpl implements User_infoService {

	@Inject //@Inject는 @Autowired와 유사하게 주입하려고 하는 객체의 타입이 일치하는 객체를 자동으로 주입한다.
	private User_infoDAO user_infoDao;
	
	@Override
	public void ui_info(User_infoVO ui) {		
		this.user_infoDao.ui_info(ui);
	}
	
	@Override
	public int checkID(User_infoVO ui) {
		
		return this.user_infoDao.checkID(ui);
	}
	
	@Override
	public int loginCheck(User_infoVO ui) {		
		return this.user_infoDao.loginCheck(ui);
	}
	
	@Override
	public String getNickname(String id) {
		return this.user_infoDao.getNickname(id);
	}

	@Override
	public void ui_updateNick(User_infoVO ui) {
		
		this.user_infoDao.ui_updateNick(ui);
	}
	
	@Override
	public void ui_updateInfo(User_infoVO ui) {
		this.user_infoDao.ui_updateInfo(ui);
	}
	
	@Override
	public void ui_updateInfoXpw(User_infoVO ui) {
		this.user_infoDao.ui_updateInfoXpw(ui);
	}
	
	@Override
	public void ui_updateProfile(User_infoVO ui) {
		this.user_infoDao.ui_updateProfile(ui);
	}

	@Override
	public List<User_infoVO> ui_getUserInfo(User_infoVO ui) {
		
		return this.user_infoDao.ui_getUserInfo(ui);
	}

	@Override
	public String ui_getProfile(String id) {		
		return this.user_infoDao.ui_getProfile(id);
	}

	@Override
	public String ui_getPasswd(String id) {
		return this.user_infoDao.ui_getPasswd(id);
	}

	@Override
	public void ui_deleteProfile(String id) {
			this.user_infoDao.ui_deleteProfile(id);
	}

	@Override
	public void ui_withdrawal(String id) {
		this.user_infoDao.ui_withdrawal(id);
	}


	

}
