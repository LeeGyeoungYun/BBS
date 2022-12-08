--유저 인포 테이블
CREATE TABLE USER_INFO(
	user_id varchar2(20) not null primary key,
	user_nickname varchar2(20) not null,
	user_pwd varchar2(20) not null,
	user_phoneNum varchar2(30) not null,
	user_email varchar2(40) not null,
	user_profile varchar2(200) null,
	user_joinDate date not null,
	user_modifyDate date null
);

select * from USER_INFO ;
drop table USER_INFO;

update USER_INFO set user_nickname = 'EEE' where user_id ='qwer123';

select * from USER_INFO where user_id = 'qwer123';
select user_pwd from user_info where user_id ='qwer123';


create sequence user_seq
start with 1
increment by 1
nocache;

drop sequence user_seq;

