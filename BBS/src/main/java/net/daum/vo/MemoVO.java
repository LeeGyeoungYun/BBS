package net.daum.vo;

import lombok.Data;

@Data
public class MemoVO {
	
	private int mno; //게시물 번호
	private String user_id;//유저 아이디
	private String memo_title;//게시물 제목
	private String memo_cont; //게시물 내용
	private int memo_viewcnt; //게시물 조회수
	private String memo_filename; //게시물 제목
	private String memo_color;// 게시물 색깔
	private String memo_update; //게시물 등록날짜
	private String memo_modifydate;// 게시물 업데이트날짜
	
	private String fieldName; //검색필드
}
