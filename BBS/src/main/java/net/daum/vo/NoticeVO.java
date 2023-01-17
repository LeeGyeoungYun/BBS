package net.daum.vo;

import lombok.Data;

@Data
public class NoticeVO {
	
	private int nno;
	private String user_id;
	private String notice_title;
	private String notice_cont;
	private int notice_viewcnt;
	private String notice_kind;
	private String notice_update;
	private String notice_modifyDate;
	
}
