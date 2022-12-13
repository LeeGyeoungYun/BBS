create table memo(

	mno number(38) primary key --게시물 번호
	,user_id varchar2(20) not null --누구의 게시물인지 확인
	,memo_title varchar2(40) null -- 게시물 제목
	,memo_cont varchar2(2000) not null -- 게시물 내용
	,memo_viewcnt number(38) default 0 -- 조회수
	,memo_filename varchar2(300) null --게시물 사진
	,memo_color varchar2(100) not null --게시물 색깔
	,memo_update date --등록 날짜
	,memo_modifydate date --메모 변경날짜	
);

alter table memo add constraint FK_MEMO_USER_ID foreign key (user_id) references USER_INFO(user_id) on delete cascade; --외래키 설정

create sequence memo_seq
start with 1
increment by 1
nocache;
