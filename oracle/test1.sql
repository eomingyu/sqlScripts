-- 제출자 : 어민규
--1번 문제
-- 1) TBL_BUY# 테이블의 BUY_SEQ 컬럼을 자동증가 되도록 sequence를 생성하는 DDL 명령을 작성하세요.
--		단 , BUY_SEQ 컬럼값은 2001부터 시작하고 시퀀스 이름은  buyno_seq 로 합니다.
CREATE SEQUENCE buyno_seq START WITH 2001;

-- 2) 아래와 같은 구조의 TBL_POSTCODE 테이블을 생성하는 DDL 명령문을 작성하세요.
-- (단, primary key 와 아래 그림에 표시된 형식은 모두 설정합니다.)
CREATE TABLE IDEV.TBL_POSTCODE (
	postcode CHAR(6) NOT NULL,
	AREA1 VARCHAR2(200) NOT NULL,
	PRIMARY KEY(postcode)
);

-- 3)  TBL_CUSTOM#  테이블에   postcode 컬럼을 추가하는 DDL명령을 작성하세요. 
-- (단, postcode 컬럼은 null 을 허용합니다.)
ALTER TABLE TBL_CUSTOM# ADD(postcode CHAR(6));

-- 4)  TBL_CUSTOM# 의 postcode 컬럼이  TBL_POSTCODE 테이블의 postcode 컬럼을 참조하도록
-- foreign key 제약조건을 추가하는 DDL명령을 작성하세요. 제약조건 이름은 임의로 하세요.
ALTER TABLE TBL_CUSTOM# 
		ADD CONSTRAINT FK_POSTCODE
		FOREIGN KEY(postcode) REFERENCES TBL_POSTCODE(postcode);