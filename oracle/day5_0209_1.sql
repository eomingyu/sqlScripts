SELECT * FROM "TBL_PRODUCT#" tp,"TBL_BUY#" tb 
		 WHERE tp.pcode = tb.pcode;			--동등 조인.
		 
--JOIN 을 쓰는 명령문 형식(표준)
SELECT * FROM "TBL_PRODUCT#" tp 
		 JOIN  "TBL_BUY#" tb 
		 ON tp.pcode = tb.pcode;
		 
--복습 : 아이패드('IPAD011)를 구매한 사용자 이름과 구매날짜 조회
		
SELECT tc.NAME , tb.BUY_DATE FROM "TBL_CUSTOM#" tc  ,"TBL_BUY#" tb 
		WHERE tc.CUSTOM_ID  = tb.CUSTOM_ID  AND pcode='IPAD011';
	
SELECT tc.NAME ,tb.BUY_DATE FROM "TBL_CUSTOM#" tc
		JOIN  "TBL_BUY#" tb ON tc.CUSTOM_ID =tb.CUSTOM_ID 
		WHERE pcode = 'IPAD011';
		
--day5 : ALTER TABLE 형식
--테스트용 테이블 : 컬럼명, 값 들은 의미 없습니다. 형식과 제약조건만 주의하세요.
CREATE TABLE tbl#(
	acol VARCHAR2(30) NOT NULL,
	bcol VARCHAR2(10),
	ccol NUMBER(3)
);

INSERT INTO tbl#(ccol) VALUES(12);				--오류 : NOT NULL 컬럼 값이 저장 안 됨 
INSERT INTO tbl#(bcol,ccol) VALUES('xytz',12);	--오류
INSERT INTO tbl#(acol,ccol) VALUES('main',12);	--정상

--컬럼 추가
ALTER TABLE tbl# ADD(dcol TIMESTAMP DEFAULT SYSDATE);
SELECT * FROM tbl#;

--컬럼 변경
ALTER TABLE tbl# MODIFY(ccol NUMBER(3) DEFAULT '0');
INSERT INTO tbl#(acol) VALUES('main');	--ccol이 '0';
--컬럼 제거(DROP)
ALTER TABLE tbl# DROP COLUMN dcol;

--제약조건 추가(제약조건 이름 지정 필요)
ALTER TABLE tbl# ADD CONSTRAINT pk_tbl# PRIMARY KEY(acol);
--중복값이 있는경우 (무결성 위반) 중복되는 행을 삭제하고 기본키를 추가해야합니다.
DELETE FROM tbl# WHERE acol='main'AND ccol='0';

--기존 제약조건은 변경 명령 없습니다. 삭제후 추가
ALTER TABLE tbl# DROP CONSTRAINT pk_tbl#;

--tbl# 테이블에 age 컬럼을 생성합니다. check 제약 조건 : 16이상 90이하의 값.
ALTER TABLE tbl# ADD age NUMBER(3) CHECK (age BETWEEN 16 AND 90); --age>=16 AND age<=90
INSERT INTO tbl#(acol,age) VALUES ('app',23);	--실행
INSERT INTO tbl#(acol,age) VALUES ('app2',23);	--실행
INSERT INTO tbl#(acol,age) VALUES ('apps',99);	--오류

--tbl# 테이블에 gender 컬럼을 생성합니다. check 제약 조건 : 'M', 'F'값만 허융
ALTER TABLE tbl# ADD gender CHAR(1) CHECK (GENDER IN('M','F'));
INSERT INTO tbl#(acol,gender) VALUES ('momo','F');	--실행
INSERT INTO tbl#(acol,gender) VALUES ('momos','X');	--오류

--SELECT 에서 사용하는 오라클 함수
--조회 결과를 조작하는 함수 : 예시 age 컬럼 값이 NULL일 때 0, gender 'M'이면 남성, 'F'이면 여성
SELECT * FROM tbl#;
SELECT acol,NVL(age,0) AS age2 , DECODE(gender,'M','남성','F','여성')  gender2
FROM  tbl#;
--NVL은 NULL VALUE , 테이블명/컬럼명 별칭은 AS 키워드를 쓰고 생략할 수 있습니다.