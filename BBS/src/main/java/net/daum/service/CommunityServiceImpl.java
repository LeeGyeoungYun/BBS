package net.daum.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.daum.dao.CommunityDAO;
import net.daum.vo.MemoVO;

@Service
public class CommunityServiceImpl implements CommunityService {
	
	@Inject
	private CommunityDAO communityDao;

	@Override
	public void insertCmMemo(MemoVO memo) {
		this.communityDao.insertCmMemo(memo);
	}

	@Override
	public List<MemoVO> getCmMyMemo(MemoVO memo) {
		return this.communityDao.getCmMyMemo(memo);
	}

	@Override
	public List<MemoVO> getCmMemo(MemoVO memo) {
		return this.communityDao.getCmMemo(memo);
	}
	
	@Override
	public List<MemoVO> no_getCmMemo(MemoVO memo){
		return this.communityDao.no_getCmMemo(memo);
	};
	

}
