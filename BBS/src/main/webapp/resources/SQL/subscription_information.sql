--유저 인포 테이블
CREATE TABLE USER_INFO(
	user_id varchar2(20) not null primary key,
	user_pwd varchar2(20) not null,  
	user_email varchar2(40) not null,
	user_joinDate date not null,
	user_modifyDate date null
);

select * from USER_INFO ;