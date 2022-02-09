SELECT * FROM "TBL_PRODUCT#" tp,"TBL_BUY#" tb 
		 WHERE tp.pcode = tb.pcode;			--���� ����.
		 
--JOIN �� ���� ��ɹ� ����(ǥ��)
SELECT * FROM "TBL_PRODUCT#" tp 
		 JOIN  "TBL_BUY#" tb 
		 ON tp.pcode = tb.pcode;
		 
--���� : �����е�('IPAD011)�� ������ ����� �̸��� ���ų�¥ ��ȸ
		
SELECT tc.NAME , tb.BUY_DATE FROM "TBL_CUSTOM#" tc  ,"TBL_BUY#" tb 
		WHERE tc.CUSTOM_ID  = tb.CUSTOM_ID  AND pcode='IPAD011';
	
SELECT tc.NAME ,tb.BUY_DATE FROM "TBL_CUSTOM#" tc
		JOIN  "TBL_BUY#" tb ON tc.CUSTOM_ID =tb.CUSTOM_ID 
		WHERE pcode = 'IPAD011';
		
--day5 : ALTER TABLE ����
--�׽�Ʈ�� ���̺� : �÷���, �� ���� �ǹ� �����ϴ�. ���İ� �������Ǹ� �����ϼ���.
CREATE TABLE tbl#(
	acol VARCHAR2(30) NOT NULL,
	bcol VARCHAR2(10),
	ccol NUMBER(3)
);

INSERT INTO tbl#(ccol) VALUES(12);				--���� : NOT NULL �÷� ���� ���� �� �� 
INSERT INTO tbl#(bcol,ccol) VALUES('xytz',12);	--����
INSERT INTO tbl#(acol,ccol) VALUES('main',12);	--����

--�÷� �߰�
ALTER TABLE tbl# ADD(dcol TIMESTAMP DEFAULT SYSDATE);
SELECT * FROM tbl#;

--�÷� ����
ALTER TABLE tbl# MODIFY(ccol NUMBER(3) DEFAULT '0');
INSERT INTO tbl#(acol) VALUES('main');	--ccol�� '0';
--�÷� ����(DROP)
ALTER TABLE tbl# DROP COLUMN dcol;

--�������� �߰�(�������� �̸� ���� �ʿ�)
ALTER TABLE tbl# ADD CONSTRAINT pk_tbl# PRIMARY KEY(acol);
--�ߺ����� �ִ°�� (���Ἲ ����) �ߺ��Ǵ� ���� �����ϰ� �⺻Ű�� �߰��ؾ��մϴ�.
DELETE FROM tbl# WHERE acol='main'AND ccol='0';

--���� ���������� ���� ��� �����ϴ�. ������ �߰�
ALTER TABLE tbl# DROP CONSTRAINT pk_tbl#;

--tbl# ���̺� age �÷��� �����մϴ�. check ���� ���� : 16�̻� 90������ ��.
ALTER TABLE tbl# ADD age NUMBER(3) CHECK (age BETWEEN 16 AND 90); --age>=16 AND age<=90
INSERT INTO tbl#(acol,age) VALUES ('app',23);	--����
INSERT INTO tbl#(acol,age) VALUES ('app2',23);	--����
INSERT INTO tbl#(acol,age) VALUES ('apps',99);	--����

--tbl# ���̺� gender �÷��� �����մϴ�. check ���� ���� : 'M', 'F'���� ����
ALTER TABLE tbl# ADD gender CHAR(1) CHECK (GENDER IN('M','F'));
INSERT INTO tbl#(acol,gender) VALUES ('momo','F');	--����
INSERT INTO tbl#(acol,gender) VALUES ('momos','X');	--����

--SELECT ���� ����ϴ� ����Ŭ �Լ�
--��ȸ ����� �����ϴ� �Լ� : ���� age �÷� ���� NULL�� �� 0, gender 'M'�̸� ����, 'F'�̸� ����
SELECT * FROM tbl#;
SELECT acol,NVL(age,0) AS age2 , DECODE(gender,'M','����','F','����')  gender2
FROM  tbl#;
--NVL�� NULL VALUE , ���̺��/�÷��� ��Ī�� AS Ű���带 ���� ������ �� �ֽ��ϴ�.