package net.daum.service;

import java.util.List;

import net.daum.vo.MemoVO;

public interface MemoService {
	
	 void insertMemo(MemoVO memo);
	 List<MemoVO> getMyMemo(MemoVO memo);
	 List<MemoVO> getMySearchMemo(MemoVO memo);
	 MemoVO getMemoContent(int mno);
	 MemoVO getMemoContent2(int mno);
	
}
