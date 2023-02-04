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
select num,u.user_id,u.user_nickname,u.user_phoneNum,u.user_email,nvl(m.post,0) post,u.user_joinDate,u.user_modifyDate  
from ((select row_number() over (order by user_joinDate desc) num, user_id,user_nickname,user_phoneNum,user_email,user_joinDate,user_modifyDate from user_info order by user_joinDate desc) u left outer join (select user_id,count(*) post from memo where memo_public ='1' group by user_id)m on
				u.user_id = m.user_id) where num between 0 and 10
order by num desc

select count(*) from user_info

insert into USER_INFO (user_id, user_nickname, user_pwd, user_phoneNum,user_email,user_joinDate,user_modifyDate) values('test1','테스트1','test1','010-1111-1111','aa@board.com',sysdate,sysdate)
insert into USER_INFO (user_id, user_nickname, user_pwd, user_phoneNum,user_email,user_joinDate,user_modifyDate) values('test2','테스트2','test2','010-1111-1111','aa@board.com',sysdate,sysdate)
insert into USER_INFO (user_id, user_nickname, user_pwd, user_phoneNum,user_email,user_joinDate,user_modifyDate) values('test3','테스트3','test3','010-1111-1111','aa@board.com',sysdate,sysdate)
insert into USER_INFO (user_id, user_nickname, user_pwd, user_phoneNum,user_email,user_joinDate,user_modifyDate) values('test4','테스트4','test4','010-1111-1111','aa@board.com',sysdate,sysdate)

select * from (select * from user_info ) u inner join (select user_id,count(user_id) from memo group by user_id)m on u.user_id = m.user_id
select * from memo;

insert into USER_INFO (user_id, user_nickname, user_pwd, user_phoneNum,user_email,user_joinDate,user_modifyDate) values('test5','테스트5','test5','010-1111-1111','aa@board.com',sysdate,sysdate);
insert into USER_INFO (user_id, user_nickname, user_pwd, user_phoneNum,user_email,user_joinDate,user_modifyDate) values('test6','테스트6','test6','010-1111-1111','aa@board.com',sysdate,sysdate);
insert into USER_INFO (user_id, user_nickname, user_pwd, user_phoneNum,user_email,user_joinDate,user_modifyDate) values('test7','테스트7','test7','010-1111-1111','aa@board.com',sysdate,sysdate);
insert into USER_INFO (user_id, user_nickname, user_pwd, user_phoneNum,user_email,user_joinDate,user_modifyDate) values('test8','테스트8','test8','010-1111-1111','aa@board.com',sysdate,sysdate);
insert into USER_INFO (user_id, user_nickname, user_pwd, user_phoneNum,user_email,user_joinDate,user_modifyDate) values('test9','테스트9','test9','010-1111-1111','aa@board.com',sysdate,sysdate);

insert into USER_INFO (user_id, user_nickname, user_pwd, user_phoneNum,user_email,user_joinDate,user_modifyDate) values('test10','테스트10','test10','010-1111-1111','aa@board.com',sysdate,sysdate);
insert into USER_INFO (user_id, user_nickname, user_pwd, user_phoneNum,user_email,user_joinDate,user_modifyDate) values('test11','테스트11','test11','010-1111-1111','aa@board.com',sysdate,sysdate);
insert into USER_INFO (user_id, user_nickname, user_pwd, user_phoneNum,user_email,user_joinDate,user_modifyDate) values('test12','테스트12','test12','010-1111-1111','aa@board.com',sysdate,sysdate);
insert into USER_INFO (user_id, user_nickname, user_pwd, user_phoneNum,user_email,user_joinDate,user_modifyDate) values('test13','테스트13','test13','010-1111-1111','aa@board.com',sysdate,sysdate);
insert into USER_INFO (user_id, user_nickname, user_pwd, user_phoneNum,user_email,user_joinDate,user_modifyDate) values('test14','테스트14','test14','010-1111-1111','aa@board.com',sysdate,sysdate);


select user_pwd from user_info where user_id = 'a' and user_phonenum='1' and user_email='a';