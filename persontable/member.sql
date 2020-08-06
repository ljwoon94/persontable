CREATE TABLE member(
	userId VARCHAR2(20) PRIMARY KEY,
	userName VARCHAR2(20) NOT NULL,
	userPasswd VARCHAR2(20) NOT NULL,
	phoneNumber varchar2(30) NOT NULL,
	zip NUMBER NOT NULL,
	birthday NUMBER NOT NULL,
	addr1 VARCHAR2(50) NOT NULL,
	addr2 VARCHAR2(50) NOT NULL,
	passwdQ VARCHAR2(50) NOT NULL,
	passwdA VARCHAR2(50) NOT NULL,
	email VARCHAR2(30) NOT NULL,
	authority NUMBER
)

alter table member rename column regdate to registDate;
drop table member;
drop sequence member_seq;

ALTER TABLE member ADD(regdate date DEFAULT sysdate);

Create sequence member_seq start with 1 increment by 1;

