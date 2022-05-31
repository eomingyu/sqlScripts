-- 1. 회원 테이블 : members
CREATE TABLE members(
	id varchar2(20) NOT NULL,			--아이디
	password varchar2(64) NOT NULL,		--비밀번호
	name varchar2(20) NOT NULL,			--이름
	birth_date varchar2(40) NOT NULL,	--생년월일
	gender varchar2(10) NOT NULL,		--성별
	email varchar2(30) NOT NULL,		--이메일
	phone varchar2(15) NOT NULL,		--전화번호
	reg_date DATE DEFAULT sysdate,		--가입일자
	authority number(3) DEFAULT '1',	--권한	1:일반회원, 0:관리자
	PRIMARY KEY(id)
);

-- 2. 극장 테이블 : theater
CREATE TABLE theater(
	theater_idx number(2) NOT NULL,
	theater_name varchar2(40) NOT NULL,
	theater_fee varchar2(90) NOT NULL,
	seat_number number(3) NOT NULL,
	PRIMARY KEY(theater_idx)
	
);

-- 3. 연극 테이블 : performance
CREATE TABLE performance(
	perform_idx number(5) NOT NULL,			--공연 번호
	theater_idx number(2) NOT NULL,			--극장 번호
	perform_title varchar2(50) NOT NULL,	--공연 제목
	poster varchar2(50) NOT NULL,			--공연 포스터
	showtime number(3) NOT NULL,			--관람 시간
	grade varchar2(20) NOT NULL,			--연령 제한
	start_date date NOT NULL,				--공연 시작 일자
	end_date date NOT NULL,					--공연 종료 일자
	detail varchar2(2000) NOT NULL,			--상세 정보
	PRIMARY KEY(perform_idx),
	FOREIGN KEY(theater_idx) REFERENCES theater(theater_idx)
);


-- 4. 좌석 테이블 : seat
CREATE TABLE seat(
	seat_idx number(4) NOT NULL,
	theater_idx number(2) NOT NULL,
	seat_grade varchar2(10) NOT NULL,
	seat_price number(6) NOT NULL,
	seat_row varchar2(3) NOT NULL,
	num NUMBER(2) NOT NULL,
	PRIMARY KEY(seat_idx),
	FOREIGN KEY(theater_idx) REFERENCES theater(theater_idx)
);

-- 5. 공연 스케줄 테이블
CREATE TABLE schedules(
	schedule_idx number(5) NOT NULL,		--스케줄 번호
	perform_idx number(5) NOT NULL,			--공연 번호
	perform_date date NOT NULL,				--공연 일자
	start_time varchar2(20) NOT NULL,		--공연 시작 시간
	PRIMARY KEY(schedule_idx),
	FOREIGN KEY(perform_idx) REFERENCES performance(perform_idx)
);

-- 6. 예매 테이블
CREATE TABLE ticket(
	ticket_idx number(16) NOT NULL,			--예매 idx
	ticket_no number(10) NOT NULL,			--예매 번호
	id varchar2(20) NOT NULL,				--아이디
	schedule_idx number(5) NOT NULL,		--스케줄 번호
	seat_idx varchar2(30) NOT NULL,			--좌석 번호
	ticket_date date DEFAULT sysdate,		--예매 일자
	cancel number(1) DEFAULT 0,				--취소 상태 취소:1
	cancel_date date,						--취소 일자
	PRIMARY KEY(ticket_idx),
	FOREIGN KEY(id) REFERENCES members(id) ON DELETE CASCADE,
	FOREIGN KEY(schedule_idx) REFERENCES schedules(schedule_idx)
);

-- 7. 관람후기 테이블
CREATE TABLE  REVIEWBOARD(
idx number(5) NOT NULL,
id varchar2(30) NOT NULL,
subject varchar2(40) NOT NULL,
title varchar2(40) NOT NULL,
content varchar2(2000) NOT NULL,
readCount number(5) DEFAULT '0',
wdate DATE DEFAULT sysdate,
commentCount number(3) DEFAULT '0',
PRIMARY KEY(idx),
FOREIGN KEY(id) REFERENCES members(id) ON DELETE CASCADE
); 


-- 8. 댓글 테이블
CREATE TABLE RVCOMMENTS(
idx number(3) NOT NULL,
bd_idx number(5) NOT NULL,
id varchar2(30) NOT NULL,
content varchar2(2000) NOT NULL,
PRIMARY KEY(idx),
FOREIGN KEY(id) REFERENCES members(id) ON DELETE CASCADE,
FOREIGN KEY(bd_idx) REFERENCES reviewboard(idx) ON DELETE CASCADE
 );


-- 9. 1:1 문의 테이블
CREATE TABLE question(
	question_idx number(5) NOT NULL,			--문의 번호
	id varchar2(20) NOT NULL,					--아이디
	question_title varchar2(200) NOT NULL,		--문의 제목
	question_content varchar2(2000) NOT NULL,	--문의 내용
	question_date date DEFAULT sysdate,			--작성 시간
	status varchar2(20) DEFAULT '답변 대기',			--답변 상태(답변 대기, 답변 완료)
	PRIMARY KEY(question_idx),
	FOREIGN KEY(id) REFERENCES members(id) ON DELETE CASCADE
);

-- 10. 답변 테이블
CREATE TABLE answer(
	answer_idx number(5) NOT NULL,				--답변 번호
	question_idx number(5) NOT NULL,			--문의 번호
	answer_writer varchar2(20) DEFAULT '관리자',	--답변 작성자
	answer_content varchar2(2000) NOT NULL,		--답변 내용
	answer_date date DEFAULT sysdate,			--작성 시간
	PRIMARY KEY(answer_idx),
	FOREIGN KEY(question_idx) REFERENCES question(question_idx) ON DELETE CASCADE
);

-- 11. 공지사항 테이블
CREATE TABLE notice(
	notice_idx number(5) NOT NULL,				--공지사항 번호
	notice_title varchar2(150) NOT NULL,		--제목
	notice_writer varchar2(20) DEFAULT '관리자',	--작성자
	notice_content varchar2(2000) NOT NULL,		--내용
	notice_date date DEFAULT sysdate,			--작성 일자
	notice_view number(5) DEFAULT '0',			--조회수
	PRIMARY KEY(notice_idx)
);

-- 12. 결제 테이블
CREATE TABLE payment(
	payment_no number(5) NOT NULL,				--결제 번호
	id varchar2(20) NOT NULL,					--아이디
	ticket_no number(10) NOT NULL,				--예매 번호
	payment_date date DEFAULT sysdate,			--결제 일시
	payment_price number(7) NOT NULL,			--결제 금액
	payment_method varchar2(30) NOT NULL,		--결제 방식
	payment_status varchar2(20) NOT NULL,		--결제 상태
	PRIMARY KEY(payment_no),
	FOREIGN KEY(id) REFERENCES members(id) ON DELETE CASCADE	
);

CREATE SEQUENCE perform_idx_seq START WITH 1001;	--2.연극 테이블 /공연 번호
CREATE SEQUENCE schedule_idx_seq START WITH 11;		--3.공연 스케줄 테이블 /스케줄 번호
CREATE SEQUENCE ticket_idx_seq START WITH 100001;	--4.예매 테이블 /예매 번호
CREATE SEQUENCE review_seq;							--5.관람 후기 테이블 /후기 번호
CREATE SEQUENCE cmt_idx_seq;					--6.댓글 테이블 /댓글 번호
CREATE SEQUENCE question_idx_seq;					--7.문의 테이블 /문의 번호
CREATE SEQUENCE answer_idx_seq;						--8.답변 테이블 /답변 번호
CREATE SEQUENCE notice_idx_seq;						--9.공지사항 테이블 /공지사항 번호
CREATE SEQUENCE payment_no_seq START WITH 10001;	--10.결제 테이블 /결제 번호
CREATE SEQUENCE seat_idx_seq;

--테이블 삭제용
--DROP TABLE payment;
--DROP TABLE notice;
--DROP TABLE answer;
--DROP TABLE question;
--DROP TABLE rvcomments;
--DROP TABLE reviewboard;
--DROP TABLE ticket;
--DROP TABLE schedules;
--DROP TABLE seat;
--DROP TABLE performance;
--DROP TABLE theater;
--DROP TABLE members;

--시퀀스 삭제용
--DROP SEQUENCE perform_idx_seq;						--2.연극 테이블 /공연 번호
--DROP SEQUENCE schedule_idx_seq;						--3.공연 스케줄 테이블 /스케줄 번호
--DROP SEQUENCE ticket_idx_seq;						--4.예매 테이블 /예매 번호
--DROP SEQUENCE review_seq;							--5.관람 후기 테이블 /후기 번호
--DROP SEQUENCE cmt_idx_seq;						--6.댓글 테이블 /댓글 번호
--DROP SEQUENCE question_idx_seq;						--7.문의 테이블 /문의 번호
--DROP SEQUENCE answer_idx_seq;						--8.답변 테이블 /답변 번호
--DROP SEQUENCE notice_idx_seq;						--9.공지사항 테이블 /공지사항 번호
--DROP SEQUENCE payment_no_seq;						--10.결제 테이블 /결제 번호
--DROP SEQUENCE seat_idx_seq;


-----
SELECT * FROM performance p, theater t
WHERE p.theater_idx=t.theater_idx AND p.start_date > sysdate+1
ORDER BY p.start_date;
SELECT * FROM performance p, theater t
		WHERE p.theater_idx=t.theater_idx AND perform_idx=1002;
		
SELECT * FROM schedules
WHERE PERFORM_IDX =1002;

		SELECT DISTINCT(perform_date),perform_idx FROM schedules
		WHERE perform_idx=1003
		ORDER BY perform_date;
	
		SELECT DISTINCT(start_time),schedule_idx FROM schedules
		WHERE perform_date='2022-05-23' AND perform_idx=1003
		ORDER BY start_time;
		
--잔여석
SELECT count(*) FROM seat WHERE theater_idx =2
AND SEAT_IDX NOT IN(SELECT seat_idx FROM ticket
WHERE schedule_idx =22 AND cancel =0);
SELECT * FROM seat WHERE theater_idx =2
AND SEAT_IDX NOT IN(SELECT seat_idx FROM ticket
WHERE schedule_idx =22 AND cancel =0);

SELECT perform_date, start_time FROM schedules
WHERE perform_idx=1003
ORDER BY perform_date, start_time;

SELECT DISTINCT ticket_no FROM ticket
		WHERE id='aaaa3' AND cancel=0
		ORDER BY ticket_no;