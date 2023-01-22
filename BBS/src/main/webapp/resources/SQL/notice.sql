create table notice(-- 공지사항 & Qna관련 테이블

	nno number(38) primary key, --공지사항, QnA 게시물 번호
	user_id varchar2(20) not null, -- 관리자 아이디 송출
	notice_title varchar2(100) not null, --공지사항&QnA 제목
	notice_cont varchar2(2000) not null, --공지사항&QnA 내용
	notice_viewcnt number(38) default 0, --조회수
	notice_kind varchar2(40) not null, --공지사항인지 QNA인지 구별
	notice_update date not null, --게시글 올린날짜
	notice_modifyDate date --게시글 수정날짜

);

create sequence notice_seq
start with 1
increment by 1
nocache;


select * from notice;
select count(*) from notice where notice_kind = 'Notice';
select count(*) from notice

drop table notice;
drop sequence notice_seq;

delete from notice where nno=2;

select * from notice  where notice_kind = 'QNA';

select * from notice where notice_kind = 'Notice' and 0<=rowNum and rowNum<=9 order by nno desc;
select * from notice where notice_kind = 'Notice' order by nno desc;

select * from (select row_number() over (order by nno desc) num , n.* from notice n  where notice_kind = 'Notice' order by nno desc) where num between 0 and 9

