package net.daum.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Override
	public List<MemoVO> getMySearchMemo(MemoVO memo) {
		return this.memoDao.getMySearchMemo(memo);
	}
	
	@Transactional //스프링 AOP를 통한 트랜잭션 적용
	@Override
	public MemoVO getMemoContent(int mno){ //내용보기 + 조회수증가
		this.memoDao.viewCount(mno);
		return this.memoDao.getMemoContent(mno);
	}
	
	@Override
	public MemoVO getMemoContent2(int mno) { // 내용보기만
		return this.memoDao.getMemoContent(mno);
	}
	

}
