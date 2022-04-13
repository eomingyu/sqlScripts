-- 메인글 테이블 : freeboard
CREATE TABLE freeboard(
	idx number(5) NOT NULL,
	name varchar2(30) NOT NULL,		--작성자
	password varchar2(10) NOT NULL,	--글 비밀번호
	subject varchar2(40) NOT NULL,	--글 제목
	content varchar2(2000) NOT NULL,	--글 내용
	readCount number(5) DEFAULT '0',	--조회수
	wdate DATE DEFAULT sysdate,			--작성 날자와 시간 기본값
	ip varchar2(15) DEFAULT '127.0.0.1',	--선택
	commentCount number(3) DEFAULT '0',	--댓글 개수
	PRIMARY KEY(idx)
);
--freeboard 테이블의 기본키 idx 시퀀스(오라클에서만 사용합니다.)
--mysql 데이터베이스는 시퀀스가 없고 컬럼에 autoincrement(자동증가) 설정합니다.
CREATE SEQUENCE board_idx_seq;

--데이터 샘플 추가
INSERT INTO freeboard (idx,name,password,subject,content)
VALUES (board_idx_seq.nextval,'이하니','1111','알립니다.','오늘 모임 변경안내입니다.');
INSERT INTO freeboard (idx,name,password,subject,content)
VALUES (board_idx_seq.nextval,'최사나','2222','공지','공지공지');
INSERT INTO freeboard (idx,name,password,subject,content)
VALUES (board_idx_seq.nextval,'박모모','1234','하이','하이하이!!');
INSERT INTO freeboard (idx,name,password,subject,content)
VALUES (board_idx_seq.nextval,'김땡땡','1111','이벤트','이벤트 안내입니다.');
INSERT INTO freeboard (idx,name,password,subject,content)
VALUES (board_idx_seq.nextval,'박세리','2222','재공지','재공지 재공지');
INSERT INTO freeboard (idx,name,password,subject,content)
VALUES (board_idx_seq.nextval,'한아름','1234','정회원 공지','정회원 안내입니다.');

SELECT * FROM freeboard ORDER BY idx DESC; --최신글부터 
SELECT count(*) FROM freeboard;
--***** 게시판 유형에서 글 목록을 페이지 단위로 처리해야 합니다.(페이징)
--예시 : 한 화면에 보이는 글 목록에서 글의 개수는 10개로 한다. 페이지 이동 버튼은 10개씩 보여준다.
--		현재 페이지 기준으로 다음 페이지/앞 페이지, 맨 앞 페이지, 맨 뒤로 이동하는 버튼이 있다.

SELECT * FROM (
SELECT rownum AS R, T.* FROM 
(SELECT * FROM freeboard ORDER BY idx DESC) T )
--WHERE R BETWEEN 1 AND 10;		--페이지 1에 대한 sql
--WHERE R BETWEEN 11 AND 20; 	--페이지 2에 대한 sql	startNo=(pageNo-1)*10+1
WHERE R BETWEEN 111 AND 120;

--페이징 select 하나씩 테스트
SELECT * FROM freeboard ORDER BY idx DESC;
SELECT rownum AS R, T.* FROM 
(SELECT * FROM freeboard ORDER BY idx DESC) T;
-------

SELECT rownum AS R, T.* FROM 
(SELECT * FROM freeboard ORDER BY idx DESC) T;



--댓글 있는 게시판의 댓글 테이블
CREATE TABLE comments (
	idx number(3) NOT NULL,		--댓글 테이블의 기본키
	"ref" number(5) NOT NULL,	--freeboard 테이블의 idx
	name varchar2(30) NOT NULL,
	content varchar2(2000) NOT NULL,
	wdate DATE DEFAULT sysdate,
	ip varchar2(15) DEFAULT '127.0.0.1',
	heart number(3) DEFAULT '0',
	PRIMARY KEY(idx)
);

CREATE SEQUENCE cmt_idx_seq;

INSERT INTO comments(idx,"ref",name,content)
VALUES (cmt_idx_seq.nextval,3,'이하니','확인했습니다.!!');

--freeboard 테이블의 댓글 개수
--1) 댓글 작성될 때마다 +1 	2) 댓글 개수를 구하는 SELECT 
SELECT count(*) FROM comments WHERE "ref"=3;	--freeboard 3번 글의 댓글 개수
SELECT count(*) FROM comments WHERE "ref"=1;	--freeboard 1번 글의 댓글 개수

--1) 로 구현할 예정 : insert into comments > update freeboard set commentCount=commentCount+1