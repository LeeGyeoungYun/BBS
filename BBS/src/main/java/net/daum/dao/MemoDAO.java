package net.daum.dao;

import java.util.List;

import net.daum.vo.MemoVO;

public interface MemoDAO {
	
	void insertMemo(MemoVO memo);
	List<MemoVO> getMyMemo(MemoVO memo);

}
