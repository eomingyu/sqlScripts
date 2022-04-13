CREATE TABLE "MEMBER"( 
    mno NUMBER NOT NULL,
    name varchar2(20) NOT NULL,
    password varchar2(15) NOT NULL,
    email varchar2(30) NOT null,
    gender varchar2(10),
    age number null,
    hobby varchar2(30),
    addr  varchar2(20),
    PRIMARY KEY(mno));
/* 테이블 생성 실행 : 단축키 Ctrl + 엔터 */    
   
create sequence member_idx_seq;     

insert into member(mno,name,password,email,gender,age, hobby,addr)
values (MEMBER_IDX_SEQ.NEXTVAL,'홍길동','1111','a@a.a','male',23,'[농구,스키]','서울');


CREATE TABLE schedule (
	idx NUMBER NOT NULL,    /*자동증가(시퀀스), PK*/
	mno NUMBER NOT NULL,	/*member테이블 mno*/
	title varchar2(50) NOT NULL,
	sdate DATE NOT NULL,   /*날짜와 시간*/
	PRIMARY key(idx),
	FOREIGN key(mno) REFERENCES "MEMBER"(mno)
);

CREATE SEQUENCE sch_idx_seq;

INSERT INTO SCHEDULE(idx,mno,title,sdate)
VALUES(sch_idx_seq.nextval,1,'운동',TO_DATE('2021-05-05','YYYY-MM-DD HH24:MI'));
/*문자열을 날짜형식으로 적용시키는 함수 필요*/

SELECT * FROM SCHEDULE WHERE mno=1;
