--���� : ���̺� ���� -> ������ �߰� -> ��) ȸ��������ȸ db���� �ۼ�(DECODE) -> �ڹٿ��� ��ȸ�ɼ� �ֵ��� dao,vo Ŭ������ �ڵ��ϼ���.
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
VALUES (MEMBER_SEQ.nextval,'���ູ','010-1111-2222','���� ���빮�� �ְ�1��','20151202','A','01');
INSERT INTO MEMBER_TBL_02(custno,custname,phone,address,joindate,grade,city)
VALUES (MEMBER_SEQ.nextval,'���ູ','010-1111-3333','���� ���빮�� �ְ�2��','20151206','B','01');
INSERT INTO MEMBER_TBL_02(custno,custname,phone,address,joindate,grade,city)
VALUES (MEMBER_SEQ.nextval,'�����','010-1111-4444','�︪�� �︪�� ����1��','20151001','B','30');
INSERT INTO MEMBER_TBL_02(custno,custname,phone,address,joindate,grade,city)
VALUES (MEMBER_SEQ.nextval,'�ֻ��','010-1111-5555','�︪�� �︪�� ����2��','20151113','A','30');
INSERT INTO MEMBER_TBL_02(custno,custname,phone,address,joindate,grade,city)
VALUES (MEMBER_SEQ.nextval,'����ȭ','010-1111-6666','���ֵ� ���ֽ� �ܳ�����','20151225','B','60');
INSERT INTO MEMBER_TBL_02(custno,custname,phone,address,joindate,grade,city)
VALUES (MEMBER_SEQ.nextval,'������','010-1111-7777','���ֵ� ���ֽ� ��������','20151211','C','60');


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

SELECT mt.custno "ȸ����ȣ" , mt.custname "ȸ������" , 
		DECODE(mt.grade,'A','VIP','B','�Ϲ�','C','����') "�����", mt2."����"
FROM MEMBER_TBL_02 mt, 
(SELECT custno, SUM(price) "����" FROM MONEY_TBL_02 GROUP BY custno) mt2
WHERE mt.CUSTNO =mt2.CUSTNO
ORDER BY mt2."����" DESC;


-- step 1) ȸ���� �����հ�
SELECT custno, sum(price) FROM MONEY_TBL_02 mt 
GROUP BY CUSTNO;

-- step 2) ���� ���� Ȯ���ϱ�
SELECT custno, sum(price) AS asum FROM MONEY_TBL_02 mt 
GROUP BY CUSTNO
ORDER BY asum desc;

-- step 3) ������ ������������ join  
SELECT * FROM MEMBER_TBL_02 mt ,
		(SELECT custno, sum(price) AS asum FROM MONEY_TBL_02 mt 
		GROUP BY CUSTNO
		ORDER BY asum desc) sale
WHERE mt.CUSTNO = sale.custno ;

-- step 4) �䱸���׿� ���� �ʿ��� �÷��� ��ȸ�ϱ�

SELECT mt.CUSTNO , CUSTNAME , grade, asum FROM MEMBER_TBL_02 mt ,
		(SELECT custno, sum(price) AS asum FROM MONEY_TBL_02 mt 
		GROUP BY CUSTNO
		ORDER BY asum desc) sale
WHERE mt.CUSTNO = sale.custno ;


-- step 5) ������ �䱸���׿� ���� �÷���� �����ϱ�
SELECT mt.CUSTNO , CUSTNAME , 
		decode(grade,'A','VIP','B','�Ϲ�','C','����') AS agrade, 
		asum FROM MEMBER_TBL_02 mt ,
		(SELECT custno, sum(price) AS asum FROM MONEY_TBL_02 mt 
		GROUP BY CUSTNO
		ORDER BY asum desc) sale
WHERE mt.CUSTNO = sale.custno ;

--���� ���� : "������ ���� ȸ���� ��ȸ���� �ʴ´�."�� "������ ���� ȸ���� 0���� ����Ѵ�."

--1) null�� 0���� ��� : nvl
--2) ��� ȸ�� ��� :�ܺ�����
--3) �����հ谡 ���� ���� ȸ����ȣ ����(��������)���� ����մϴ�.(����:������ ��������)

SELECT mt.CUSTNO , CUSTNAME , 
		decode(grade,'A','VIP','B','�Ϲ�','C','����') AS agrade, 
		nvl(asum,0) AS sum_ FROM MEMBER_TBL_02 mt ,		--1)
		(SELECT custno, sum(price) AS asum FROM MONEY_TBL_02 mt 
		GROUP BY CUSTNO) sale
WHERE mt.CUSTNO = sale.custno(+)  --2)
ORDER BY sum_ DESC, custno ;	  --3)

--���� ����� 5)�� select ���� ����� view�� �����մϴ�.
CREATE VIEW v_by_custno
AS
SELECT mt.CUSTNO , CUSTNAME , 
		decode(grade,'A','VIP','B','�Ϲ�','C','����') AS agrade, 
		asum FROM MEMBER_TBL_02 mt ,
		(SELECT custno, sum(price) AS asum FROM MONEY_TBL_02 mt 
		GROUP BY CUSTNO
		ORDER BY asum desc) sale
WHERE mt.CUSTNO = sale.custno ;

SELECT * FROM V_BY_CUSTNO;
