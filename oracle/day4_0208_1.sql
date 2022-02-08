--UPDATE 형식
--UPDATE 테이블명
--SET 수정할 컬럼=값 을 ,로 구분해서 나열
--WHERE 수정할 행에 대한 조건식;

SELECT * FROM "TBL_CUSTOM#" tc ;

--** UPDATE 와 DELETE는 WHERE 조건식을 사용하는 것이 안전합니다.
UPDATE "TBL_CUSTOM#" 
SET age=39 
WHERE CUSTOM_ID = 'twice';		
--기본키 컬럼 사용 조건식은 1개 행만 수정됩니다.

UPDATE "TBL_CUSTOM#" 
SET age=23, email = 'nana@korea.kr'
WHERE CUSTOM_ID = 'wonder';

--custom_id : wonder와 twice에 대해 reg_date 를 2022년 2월 5일로 변경
UPDATE "TBL_CUSTOM#" 
SET reg_date = '2022-02-05'
WHERE CUSTOM_ID IN('wonder','twice');	--IN 연산자는 OR 대체


--샘플 데이터 추가
INSERT INTO "TBL_PRODUCT#" (pcode,CATEGORY,PNAME,PRICE)
VALUES('GAL0112','A1','갤럭시20',910000);

--DELETE 형식
--DELETE FROM 테이블명 WHERE 조건식;
DELETE FROM "TBL_PRODUCT#" tp WHERE pcode = 'GAL0112';	-- 실행 : buy#에서 참조하지 않는 값
DELETE FROM "TBL_PRODUCT#" tp WHERE pcode = 'IPAD011';	-- 오류 : 무결성 위반

UPDATE "TBL_PRODUCT#" SET pname = '아이패드프로'	--실행 : pname은 참조하지 않는 값
WHERE pcode = 'IPAD011';

UPDATE "TBL_PRODUCT#" SET pcode = 'IPAD011X'	--오류 : pcode는 buy#에서 참조하는 값
WHERE pcode = 'IPAD011';						--다른 테이블에서 참조 중인 값은 변경/삭제할 수 없다.

SELECT * FROM "TBL_CUSTOM#" tc ;
SELECT * FROM "TBL_PRODUCT#" tp ;
SELECT * FROM "TBL_BUY#" tb ;

--on DELETE, on UPDATE(오라클은 안됨) 속성 변경하여 외래키 다시 생성합니다.
ALTER TABLE IDEV."TBL_BUY#" 
		DROP CONSTRAINT "FK_TBL_PRODUCT#";
ALTER TABLE IDEV."TBL_BUY#" 
		ADD CONSTRAINT "FK_TBL_PRODUCT#" 
		FOREIGN KEY (PCODE) REFERENCES IDEV."TBL_PRODUCT#"(PCODE) 
		ON DELETE CASCADE; 
		--무결성을 위해서 참조하는 값 삭제시 참조하는 행도 연달아서 삭제
--ALTER TABLE 형식 : DROP , ADD, MODIFY(제약조건은 못합니다.)

--SELECT 의 JOIN : 둘 이상의 테이블(주로 참조관계의 테이블)을 연결하여 데이터를 조회하는 명령
--				둘 이상의 테이블은 골통된 컬럼을 갖고 이 컬럼을 이용하여 JOIN 합니다.
--형식: SELECT ~ FROM 테이블1 a, 테이블2 b,... WHERE a.공통컬럼1=b.공통컬럼1;
	
SELECT * FROM "TBL_PRODUCT#" tp,"TBL_BUY#" tb 
		 WHERE tp.pcode = tb.pcode;			--동등 조인.
		 
--JOIN 을 쓰는 명령문 형식(표준)
SELECT * FROM "TBL_PRODUCT#" tp 
		 JOIN  "TBL_BUY#" tb 
		 ON tp.pcode = tb.pcode;
		 
--mina012가 구매한 상품명은 무엇인가?
SELECT pname FROM "TBL_PRODUCT#" tp,"TBL_BUY#" tb 
			WHERE tp.pcode=tb.pcode AND CUSTOM_ID ='mina012';
SELECT pname FROM "TBL_PRODUCT#" tp 
			JOIN "TBL_BUY#" tb 
			ON tp.pcode = tb.pcode 
			WHERE CUSTOM_ID ='mina012';
--mina012가 구매한 상품명과 가격 조회하기
SELECT tp.pname, tp.price FROM "TBL_PRODUCT#" tp,"TBL_BUY#" tb  --tp.으로 소속을 명시
			WHERE tp.pcode=tb.pcode AND CUSTOM_ID ='mina012';
SELECT pname, price FROM "TBL_PRODUCT#" tp 
			JOIN "TBL_BUY#" tb 
			ON tp.pcode = tb.pcode 
			WHERE CUSTOM_ID ='mina012';		
--JOIN할 때, 공통된 컬럼은 테이블 명을 꼭 지정해야 합니다.		
SELECT tp.pcode, tp.price FROM "TBL_PRODUCT#" tp,"TBL_BUY#" tb  --꼭 pcode에 소속 명시
			WHERE tp.pcode=tb.pcode AND CUSTOM_ID ='mina012';

-- 외부조인 형식 2가지
SELECT * FROM "TBL_PRODUCT#" tp,"TBL_BUY#" tb 
		 WHERE tp.pcode = tb.pcode(+);			--외부 조인.
		 
--JOIN 을 쓰는 명령문 형식2(표준)
SELECT * FROM "TBL_PRODUCT#" tp 			--pcode가 있는 데이터 보여주기
		 LEFT OUTER JOIN  "TBL_BUY#" tb 	--기준이 되는 테이블은 왼쪽의 product#
		 ON tp.pcode = tb.pcode;		
		
		
--데이터 테스트 또는 데이터 관리를 위해 모든 데이터 삭제하기
TRUNCATE TABLE "TBL_BUY#" ;
