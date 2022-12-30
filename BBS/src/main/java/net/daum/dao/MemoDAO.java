package net.daum.dao;

import java.util.List;

import net.daum.vo.MemoVO;

public interface MemoDAO {
	
	void insertMemo(MemoVO memo);
	List<MemoVO> getMyMemo(MemoVO memo);
	List<MemoVO> getMySearchMemo(MemoVO memo);
	MemoVO getMemoContent(int mno);
	void viewCount(int mno);
	void modifyMyMemo(MemoVO memo);
	
}
