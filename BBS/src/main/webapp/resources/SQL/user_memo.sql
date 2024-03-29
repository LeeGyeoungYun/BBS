create table memo(

	mno number(38) primary key --게시물 번호
	,user_id varchar2(20) not null --누구의 게시물인지 확인
	,memo_title varchar2(40) null -- 게시물 제목
	,memo_cont varchar2(2000) not null -- 게시물 내용
	,memo_viewcnt number(38) default 0 -- 조회수
	,memo_filename varchar2(300) null --게시물 사진
	,memo_color varchar2(100) not null --게시물 색깔
	,memo_public number(2) default 0 -- 0이면 개인 메모 1이면 정보 공유 게시판에 작성한 메모
	,memo_update date --등록 날짜
	,memo_modifydate date --메모 변경날짜	
);

alter table memo add constraint FK_MEMO_USER_ID foreign key (user_id) references USER_INFO(user_id) on delete cascade; --외래키 설정
alter table memo drop constraint FK_MEMO_USER_ID

select * from memo order by mno desc;

create sequence memo_seq
start with 1
increment by 1
nocache;

delete from memo;
drop table memo;
drop sequence memo_seq

insert into memo (mno,user_id,memo_title,memo_cont,memo_viewcnt,memo_filename,memo_color,memo_update,memo_modifydate) values
(memo_seq.nextval,'a','1','1',0,null,'red',sysdate,sysdate);

select * from (select mno,user_id,memo_title,memo_cont,memo_viewcnt from memo where memo_title like '%a%' or memo_cont like '%a%' order by mno)
select * from (select mno,user_id,memo_title,memo_cont,memo_viewcnt,memo_filename,memo_color,memo_update,memo_modifydate
 	from memo where user_id = 'a' order by mno desc);
select * from memo where rowNum =1;

select * from (select mno,user_id,memo_title,memo_cont,memo_viewcnt,memo_filename,memo_color,memo_update,memo_modifydate
 	from memo where memo_title like '%null%' and user_id='a' order by mno desc);
 	
select count(*) from memo;

delete from memo where mno = 2;
select * from memo where mno=13;
update memo set memo_viewcnt = memo_viewcnt+1 where mno=18;

select * from memo order by memo_modifydate desc;

select * from (select user_id, user_nickname from user_info) u inner join (select * from memo) m on u.user_id = m.user_id;

select * from memo where memo_public ='1';

select * from memo order by mno desc;

select count(*) from memo where memo_public ='1';
select user_id,count(*) from memo where memo_public ='1' group by user_id;

select * from user_info;
