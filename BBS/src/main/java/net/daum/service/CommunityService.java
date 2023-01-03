package net.daum.service;

import java.util.List;

import net.daum.vo.MemoVO;

public interface CommunityService {
	
	void insertCmMemo(MemoVO memo);
	List<MemoVO> getCmMyMemo(MemoVO memo);
	List<MemoVO> getCmMemo(MemoVO memo);

}
