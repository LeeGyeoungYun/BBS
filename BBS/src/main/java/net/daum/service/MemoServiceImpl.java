package net.daum.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.daum.dao.MemoDAO;
import net.daum.vo.MemoVO;

@Service
public class MemoServiceImpl implements MemoService {
	
	@Inject //@Inject는 @Autowired와 유사하게 주입하려고 하는 객체의 타입이 일치하는 객체를 자동으로 주입한다. 
	private MemoDAO memoDao;
	
	@Override
	public void insertMemo(MemoVO memo) {
		this.memoDao.insertMemo(memo);
	}
	
	public List<MemoVO> getMyMemo(MemoVO memo){
		return this.memoDao.getMyMemo(memo);
	}

}
