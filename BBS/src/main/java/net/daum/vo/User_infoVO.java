package net.daum.vo;

import lombok.Data;

@Data
public class User_infoVO {

	private String user_id;//유저 아이디
	private String user_nickname; //유저 닉네임
	private String user_pwd;//유저 패스워드
	private String user_email;//유저 이메일
	private String user_profile; //유저 프로필 사진 경로
	private String user_joinDate;//유저 가입날짜
	private String user_modifyDate;//유저 정보 수정날짜
	

}
