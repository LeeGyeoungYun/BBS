--유저 인포 테이블
CREATE TABLE USER_INFO(
	user_id varchar2(20) not null primary key,
	user_nickname varchar2(20) not null,
	user_pwd varchar2(20) not null,  
	user_email varchar2(40) not null,
	user_profile varchar2(200) null,
	user_joinDate date not null,
	user_modifyDate date null
);

select * from USER_INFO ;
drop table USER_INFO;

insert into user_info (user_id,user_pwd,user_email,user_joinDate,user_modifyDate) values ('abc','123','abc@gmail.com',sysdate,sysdate);

select count(*) from user_info where user_id ='abc';

delete from USER_INFO where user_id = 'abc';

insert into USER_INFO (user_id,user_pwd,user_email,user_joinDate,user_modifyDate) values ('123','123','123',sysdate,sysdate);

select user_nickname from user_info where user_id='qwer123';