--회원 INSERT 
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

--회원 수정 update는 회원번호를 조건으로 하여 전화번호, 주소, 거주지역 컬럼을 변경할 수 있도록 합니다.
UPDATE MEMBER_TBL_02 SET PHONE ='',ADDRESS ='',CITY ='' WHERE CUSTNO = ;
--회원 전체 SELECT 
SELECT * FROM MEMBER_TBL_02 mt ;
--회원 pk로 select
SELECT * FROM MEMBER_TBL_02 mt WHERE CUSTNO =100001;
-- 매출 집계 -> 자바 vo 클래스는 select 조회 컬럼만으로 변수를 선언해서 작성합니다.
SELECT mt.CUSTNO , CUSTNAME , 
		decode(grade,'A','VIP','B','일반','C','직원') AS agrade, 
		asum FROM MEMBER_TBL_02 mt ,
		(SELECT custno, sum(price) AS asum FROM MONEY_TBL_02 mt 
		GROUP BY CUSTNO
		ORDER BY asum desc) sale
WHERE mt.CUSTNO = sale.custno ;
