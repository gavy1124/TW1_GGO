# porsonal_GGO


#오라클 sql 데이터


#회원 테이블생성
create table ongo(
	no number,
	id varchar2(20) primary key,
	pass varchar2(20),
	name varchar2(20),
	tel varchar2(20),
	addr varchar2(50),
	email varchar2(20),
	sort varchar2(10),
	regDate Date);


#회원번호 시퀀스생성
create sequence ongo_no;

#게시판 테이블생성
create table b_ongo(
	no number,
	id varchar2(20),
	category varchar2(50),
	title varchar2(50),
	content varchar2(550),
	write_date date);


#게시판 시퀀스생성  (commons 파일업로드 이용)
create sequence b_ongo_no;
