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

insert into user_info (user_id,user_nickname,user_pwd,user_phoneNum,user_email,user_joinDate,user_modifyDate) values ('admin','관리자','admin','1','1',sysdate,sysdate);

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

update USER_INFO set user_profile ='' where user_id = 'qwer123';

insert into USER_INFO (user_id, user_nickname, user_pwd, user_phoneNum,user_email,user_joinDate,user_modifyDate) values('a','a','a','1','a',sysdate,sysdate)
insert into USER_INFO (user_id, user_nickname, user_pwd, user_phoneNum,user_email,user_joinDate,user_modifyDate) values('b','b','b','2','b',sysdate,sysdate)
delete from USER_INFO where user_id = 'qwer122';


select * from user_info;
select num,u.user_id,u.user_nickname,u.user_phoneNum,u.user_email,m.post,u.user_joinDate,u.user_modifyDate  
from ((select row_number() over (order by user_joinDate desc) num, user_id,user_nickname,user_phoneNum,user_email,user_joinDate,user_modifyDate from user_info order by user_joinDate desc) u inner join (select user_id,count(*) post from memo where memo_public ='1' group by user_id)m on
				u.user_id = m.user_id) where num between 6 and 9


select count(*) from user_info

insert into USER_INFO (user_id, user_nickname, user_pwd, user_phoneNum,user_email,user_joinDate,user_modifyDate) values('test1','테스트1','test1','010-1111-1111','aa@board.com',sysdate,sysdate)
insert into USER_INFO (user_id, user_nickname, user_pwd, user_phoneNum,user_email,user_joinDate,user_modifyDate) values('test2','테스트2','test2','010-1111-1111','aa@board.com',sysdate,sysdate)
insert into USER_INFO (user_id, user_nickname, user_pwd, user_phoneNum,user_email,user_joinDate,user_modifyDate) values('test3','테스트3','test3','010-1111-1111','aa@board.com',sysdate,sysdate)
insert into USER_INFO (user_id, user_nickname, user_pwd, user_phoneNum,user_email,user_joinDate,user_modifyDate) values('test4','테스트4','test4','010-1111-1111','aa@board.com',sysdate,sysdate)

select * from user_id