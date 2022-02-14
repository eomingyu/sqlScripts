--순서 : 테이블 생성 -> 데이터 추가 -> 라) 회원매출조회 db쿼리 작성(DECODE) -> 자바에서 조회될수 있도록 dao,vo 클래스를 코딩하세요.
CREATE TABLE member_tbl_02 (
	custno NUMBER(6) NOT NULL,
	custname VARCHAR2(20),
	phone VARCHAR2(13),
	address VARCHAR2(60),
	joindate DATE,
	grade CHAR(1),
	city CHAR(2),
	PRIMARY KEY(custno)
);

CREATE TABLE money_tbl_02 (
	custno NUMBER(6) NOT NULL ,
	salenol NUMBER(8) NOT NULL ,
	pcost NUMBER(8),
	amount NUMBER(4),
	price NUMBER(8),
	pcode VARCHAR2(4),
	sdate DATE,
	PRIMARY KEY(custno, salenol)

);
CREATE SEQUENCE member_seq INCREMENT BY 1
START WITH 100001;

INSERT INTO MEMBER_TBL_02(custno,custname,phone,address,joindate,grade,city)
VALUES (MEMBER_SEQ.nextval,'김행복','010-1111-2222','서울 동대문구 휘경1동','20151202','A','01');
INSERT INTO MEMBER_TBL_02(custno,custname,phone,address,joindate,grade,city)
VALUES (MEMBER_SEQ.nextval,'이축복','010-1111-3333','서울 동대문구 휘경2동','20151206','B','01');
INSERT INTO MEMBER_TBL_02(custno,custname,phone,address,joindate,grade,city)
VALUES (MEMBER_SEQ.nextval,'장믿음','010-1111-4444','울릉군 울릉읍 독도1리','20151001','B','30');
INSERT INTO MEMBER_TBL_02(custno,custname,phone,address,joindate,grade,city)
VALUES (MEMBER_SEQ.nextval,'최사랑','010-1111-5555','울릉군 울릉읍 독도2리','20151113','A','30');
INSERT INTO MEMBER_TBL_02(custno,custname,phone,address,joindate,grade,city)
VALUES (MEMBER_SEQ.nextval,'진평화','010-1111-6666','제주도 제주시 외나무골','20151225','B','60');
INSERT INTO MEMBER_TBL_02(custno,custname,phone,address,joindate,grade,city)
VALUES (MEMBER_SEQ.nextval,'차공단','010-1111-7777','제주도 제주시 감나무골','20151211','C','60');


INSERT INTO MONEY_TBL_02 (custno,salenol,pcost,amount,price,pcode,sdate)
VALUES (100001, 20160001, 500, 5, 2500, 'A001', '20160101');
INSERT INTO MONEY_TBL_02 (custno,salenol,pcost,amount,price,pcode,sdate)
VALUES (100001, 20160002, 1000, 4, 4000, 'A002', '20160101');
INSERT INTO MONEY_TBL_02 (custno,salenol,pcost,amount,price,pcode,sdate)
VALUES (100001, 20160003, 500, 3, 1500, 'A008', '20160101');
INSERT INTO MONEY_TBL_02 (custno,salenol,pcost,amount,price,pcode,sdate)
VALUES (100002, 20160004, 2000, 1, 2000, 'A004', '20160102');
INSERT INTO MONEY_TBL_02 (custno,salenol,pcost,amount,price,pcode,sdate)
VALUES (100002, 20160005, 500, 1, 500, 'A001', '20160103');
INSERT INTO MONEY_TBL_02 (custno,salenol,pcost,amount,price,pcode,sdate)
VALUES (100003, 20160006, 1500, 2, 3000, 'A003', '20160103');
INSERT INTO MONEY_TBL_02 (custno,salenol,pcost,amount,price,pcode,sdate)
VALUES (100004, 20160007, 500, 2, 1000, 'A001', '20160104');
INSERT INTO MONEY_TBL_02 (custno,salenol,pcost,amount,price,pcode,sdate)
VALUES (100004, 20160008, 300, 1, 300, 'A005', '20160104');
INSERT INTO MONEY_TBL_02 (custno,salenol,pcost,amount,price,pcode,sdate)
VALUES (100004, 20160009, 600, 1, 600, 'A006', '20160104');
INSERT INTO MONEY_TBL_02 (custno,salenol,pcost,amount,price,pcode,sdate)
VALUES (100004, 20160010, 3000, 1, 3000, 'A007', '20160106');

SELECT * FROM MEMBER_TBL_02 mt ;
SELECT * FROM MONEY_TBL_02 mt ;

SELECT mt.custno "회원번호" , mt.custname "회원성명" , 
		DECODE(mt.grade,'A','VIP','B','일반','C','직원') "고객등급", mt2."매출"
FROM MEMBER_TBL_02 mt, 
(SELECT custno, SUM(price) "매출" FROM MONEY_TBL_02 GROUP BY custno) mt2
WHERE mt.CUSTNO =mt2.CUSTNO
ORDER BY mt2."매출" DESC;


-- step 1) 회원별 매출합계
SELECT custno, sum(price) FROM MONEY_TBL_02 mt 
GROUP BY CUSTNO;

-- step 2) 정렬 기준 확인하기
SELECT custno, sum(price) AS asum FROM MONEY_TBL_02 mt 
GROUP BY CUSTNO
ORDER BY asum desc;

-- step 3) 고객정보 가져오기위한 join  
SELECT * FROM MEMBER_TBL_02 mt ,
		(SELECT custno, sum(price) AS asum FROM MONEY_TBL_02 mt 
		GROUP BY CUSTNO
		ORDER BY asum desc) sale
WHERE mt.CUSTNO = sale.custno ;

-- step 4) 요구사항에 따라 필요한 컬럼만 조회하기

SELECT mt.CUSTNO , CUSTNAME , grade, asum FROM MEMBER_TBL_02 mt ,
		(SELECT custno, sum(price) AS asum FROM MONEY_TBL_02 mt 
		GROUP BY CUSTNO
		ORDER BY asum desc) sale
WHERE mt.CUSTNO = sale.custno ;


-- step 5) 제시한 요구사항에 따라 컬럼결과 변경하기
SELECT mt.CUSTNO , CUSTNAME , 
		decode(grade,'A','VIP','B','일반','C','직원') AS agrade, 
		asum FROM MEMBER_TBL_02 mt ,
		(SELECT custno, sum(price) AS asum FROM MONEY_TBL_02 mt 
		GROUP BY CUSTNO
		ORDER BY asum desc) sale
WHERE mt.CUSTNO = sale.custno ;

--문제 변형 : "매출이 없는 회원은 조회되지 않는다."를 "매출이 없는 회원은 0으로 출력한다."

--1) null은 0으로 출력 : nvl
--2) 모든 회원 출력 :외부조인
--3) 매출합계가 같을 때는 회원번호 순서(오름차순)으로 출력합니다.(참고:역순은 내림차순)

SELECT mt.CUSTNO , CUSTNAME , 
		decode(grade,'A','VIP','B','일반','C','직원') AS agrade, 
		nvl(asum,0) AS sum_ FROM MEMBER_TBL_02 mt ,		--1)
		(SELECT custno, sum(price) AS asum FROM MONEY_TBL_02 mt 
		GROUP BY CUSTNO) sale
WHERE mt.CUSTNO = sale.custno(+)  --2)
ORDER BY sum_ DESC, custno ;	  --3)

--위의 결과를 5)번 select 실행 결과를 view로 생성합니다.
CREATE VIEW v_by_custno
AS
SELECT mt.CUSTNO , CUSTNAME , 
		decode(grade,'A','VIP','B','일반','C','직원') AS agrade, 
		asum FROM MEMBER_TBL_02 mt ,
		(SELECT custno, sum(price) AS asum FROM MONEY_TBL_02 mt 
		GROUP BY CUSTNO
		ORDER BY asum desc) sale
WHERE mt.CUSTNO = sale.custno ;

SELECT * FROM V_BY_CUSTNO;
