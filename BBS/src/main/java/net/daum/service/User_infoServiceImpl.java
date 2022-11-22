package net.daum.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.daum.dao.User_infoDAO;
import net.daum.vo.User_infoVO;

@Service
public class User_infoServiceImpl implements User_infoService {

	@Inject //@Inject는 @Autowired와 유사하게 주입하려고 하는 객체의 타입이 일치하는 객체를 자동으로 주입한다.
	private User_infoDAO user_infoDao;
	
	@Override
	public int checkID(User_infoVO ui) {
		
		return this.user_infoDao.checkID(ui);
	}

}