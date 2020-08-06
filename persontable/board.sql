
CREATE TABLE BOARD(
    BNO NUMBER NOT NULL,
    TITLE VARCHAR2(100)     NOT NULL,
    CONTENT VARCHAR2(2000)  NOT NULL,
    WRITER VARCHAR2(20)    NOT NULL,
    REGDATE DATE            DEFAULT SYSDATE,
    HIT NUMBER DEFAULT 0,
    BIMG VARCHAR(200) NULL,
    BTHUMBIMG VARCHAR(200)
    PRIMARY KEY(BNO)
)
    
ALTER TABLE BOARD ADD(HIT NUMBER DEFAULT 0);
CREATE SEQUENCE BOARD_SEQ
START WITH 1
INCREMENT BY 1;
COMMIT

drop table board;

CREATE TABLE REPLY(
	bno number not null,
    rno number not null,
    content varchar2(1000) not null,
    writer varchar2(20) not null,
    regdate date default sysdate,
    primary key(bno, rno)
);

alter table reply add constraint reply_bno foreign key(bno) references board(bno)  on delete cascade;
alter table board add constraint board_writer foreign key(writer) references member(userId) on delete cascade;
alter table reply add constraint reply_writer foreign key(writer) references member(userId) on delete cascade;


select writer from reply minus select userId from member;

alter table board drop constraint board_writer;

alter table reply drop constraint reply_writer;

create sequence reply_seq START WITH 1 MINVALUE 0;
     
insert into board(bno, title, content, writer)
select board_seq.nextval, title, content, writer from board;

insert into reply(reply_bno, rno, content, writer)
    values(18, reply_seq.nextval, '테스트댓글', '테스트 작성자');
    


CREATE TABLE NOTICE_REPLY(
	nno number not null,
    rno number not null,
    content varchar2(1000) not null,
    writer varchar2(20) not null,
    regdate date default sysdate,
    primary key(nno, rno)
)

create sequence notice_reply_seq START WITH 1 MINVALUE 0;

CREATE TABLE NOTICE(
    NNO NUMBER NOT NULL,
    TITLE VARCHAR2(100)     NOT NULL,
    CONTENT VARCHAR2(2000)  NOT NULL,
    WRITER VARCHAR2(20)    NOT NULL,
    REGDATE DATE            DEFAULT SYSDATE,
    PRIMARY KEY(NNO)
)
ALTER TABLE NOTICE ADD(HIT NUMBER DEFAULT 0);
CREATE SEQUENCE NOTICE_SEQ
START WITH 1
INCREMENT BY 1;

alter table notice add constraint notice_writer foreign key(writer) references member(userId) on delete cascade;
alter table notice_reply add constraint notice_reply_writer foreign key(writer) references member(userId) on delete cascade;
alter table notice_reply add constraint notice_reply_nno foreign key(nno) references notice(nno) on delete cascade;


COMMIT
