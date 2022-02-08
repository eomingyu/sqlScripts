--�߿�1 : custom ���̺��� �� �����͸� ������ custom_id ,pcode�� �ߺ��Ǹ� �ȵ˴ϴ�.
--		�� �⺻Ű �÷��� ���մϴ�.(�ߺ��� ���� NULL�� ����� �ȵ˴ϴ�.)
--		�� �⺻Ű�� ���̺��� ���� �ĺ��ϴ� ���� �����Դϴ�.
--		�� SELECT �� �⺻Ű ������ �˻��� �� ���� 0 �Ǵ� 1���� �� ����� ��ȸ�˴ϴ�.
--�߿�2 : product ���̺��� price , quantity ���� �÷��� �� �ʼ� �����ͷ� ����Ǿ�� �մϴ�.
--		�� NOT NULL �÷����� �����մϴ�. (NULL ���� �ȵ˴ϴ�.)
--�߿�3 : ���� ��ǰ���̺� ���� custom_id , pcode �÷� ���� ����ϸ� ����Ȯ�� �������Դϴ�.
--		�� �ܷ�Ű �÷��� ���մϴ�.(�ٸ� ���̺��� ���� �����մϴ�. NULL ��뵵 ���մϴ�.)

--���� NOT NULL, �⺻Ű, �ܷ�Ű�� ��ǥ���� ��������(CONSTRAINT) �����Դϴ�.
--���������� ������ ���̺�� ������ ���ϴ�.
--�� ���̺�
CREATE TABLE tbl_custom#(
	custom_id VARCHAR2(20) PRIMARY KEY,	--����/����/��ȣ
	name NVARCHAR2(20) NOT NULL ,		--�ѱ� �� �ٱ��� ���� ����
	email VARCHAR2(20),
	age NUMBER(3),
	reg_date TIMESTAMP DEFAULT SYSDATE
);

--��ǰ ���̺� : ��ǰ�ڵ�(���� ���� 20�ڸ�), ī�װ�(���� ���� 2�ڸ�)
--								A1:������ǰ, B1:��ǰ
CREATE TABLE tbl_product#(
	pcode VARCHAR2(20) CONSTRAINT pk_product PRIMARY KEY ,
	category CHAR(2),
	pname NVARCHAR2(20) NOT NULL ,
	price NUMBER(9)	NOT NULL 
);

--���� ���̺� : ��� ���� ���� ��ǰ�� �����ϴ°�?
--���� ���̺��� �⺻Ű�� ������ �÷��� �߰��մϴ�.
CREATE TABLE tbl_buy#(
	buy_seq NUMBER(8),				--�������� �Ϸù�ȣ
	custom_id VARCHAR2(20),
	pcode VARCHAR2(20),
	quantity NUMBER(5) NOT NULL,		--����
	buy_date TIMESTAMP,
	CONSTRAINT pk_buy_seq PRIMARY KEY(buy_seq),
	CONSTRAINT fk_custom_id FOREIGN KEY (custom_id) --�� ���̺��� �÷���
		REFERENCES tbl_custom#(custom_id),		--�������̺�� �� �÷���
	CONSTRAINT fk_pcode FOREIGN KEY (pcode)
		REFERENCES tbl_product#(pcode)
);
--�ܷ�Ű�� ������ �� �ִ� �÷��� �⺻Ű �Ǵ� unique�� ���ؼ��� �����մϴ�.
--�ܷ�Ű �÷��� ����(REFERENCES)���̺��� �÷��� �� �ϳ��� ������ �� �ֽ��ϴ�.

-- �������� �߰� : INSERT 
INSERT INTO IDEV.TBL_CUSTOM#(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('mina012', '��̳�', 'kimm@gmail.com', 20, sysdate);
INSERT INTO IDEV.TBL_CUSTOM#(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('hongGD', 'ȫ�浿', 'gil@korea.com', 32, sysdate);
INSERT INTO IDEV.TBL_CUSTOM#(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('twice', '�ڸ��', 'momo@daum.net', 29, sysdate);
INSERT INTO IDEV.TBL_CUSTOM#(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('wonder', '�̳���', 'lee@naver.com', 40, sysdate);
-- �߿�1 : custom ���̺��� ��(row)�����͸� ������ CUSTOM_ID ,PCODE �� �ߺ��Ǹ� �ȵ˴ϴ�.
INSERT INTO IDEV.TBL_CUSTOM#(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('wonder', '�ָ��', 'choi@naver.com', 33, sysdate);


INSERT INTO IDEV.TBL_PRODUCT#(PCODE, CATEGORY, PNAME, PRICE)
VALUES('IPAD011', 'A1', '�����е�10', 880000);
INSERT INTO IDEV.TBL_PRODUCT#(PCODE, CATEGORY, PNAME, PRICE)
VALUES('DOWON123a', 'B1', '������ġ������Ʈ', 54000);
INSERT INTO IDEV.TBL_PRODUCT#(PCODE, CATEGORY, PNAME, PRICE)
VALUES('dk_143', 'A2', '��ǵ���ũ', 234500);
-- �߿�2: �������  PRICE , QUANTITY ���� �÷��� �� �ʼ� �����ͷ� ����Ǿ�� �մϴ�.
INSERT INTO IDEV.TBL_PRODUCT#(PCODE, CATEGORY, PNAME)
VALUES('dk_1433', 'A2', '�ڵ���ǵ���ũ');

--����Ŭ������ �Ϸù�ȣ�� �ڵ����� �����ؼ� ����ϰ� �� �� �ִ� ������ ����� �ֽ��ϴ�.
CREATE SEQUENCE tbl_buy_seq;

--������ ���� ����� �ʹٸ� �����ϰ� �ٽ� ���弼��.
DROP SEQUENCE tbl_buy_seq ;
-- ���̺��� �����͵� �����ϼ���. �׸��� �ٽ� ������ ����/������ �߰��ϼ���.

--�� �� ������� ����ϴ� �������� ���� �ǵ��� �� �����ϴ�.
SELECT  * FROM "TBL_BUY#" tb ;
-- ��̳��� �����е� 1���� ���� ����
INSERT INTO IDEV.TBL_BUY#(BUY_SEQ, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(tbl_buy_seq.nextval,'mina012', 'IPAD011', 1, '2022-02-06');
-- ȫ�浿�� �����е� 2���� ���� ����
INSERT INTO IDEV.TBL_BUY#(BUY_SEQ, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(tbl_buy_seq.nextval,'hongGD', 'IPAD011', 2, sysdate);
-- �̳����� ��ġ������Ʈ 3���� ���� ����
INSERT INTO IDEV.TBL_BUY#(BUY_SEQ, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(tbl_buy_seq.nextval,'wonder', 'DOWON123a', 3, '2022-02-06');
-- ��̳��� ��ǵ���ũ 1���� ���� ����
INSERT INTO IDEV.TBL_BUY#(BUY_SEQ, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(tbl_buy_seq.nextval,'mina012', 'dk_143',1, sysdate);
-- �ڸ�� ��ġ������Ʈ 2���� ���� ����
INSERT INTO IDEV.TBL_BUY#(BUY_SEQ, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(tbl_buy_seq.nextval,'twice', 'DOWON123a', 2, '2022-02-07');

-- �߿�3: ���� ��ǰ���̺� ���� CUSTOM_ID,PCODE �÷� ���� ����ϸ� ����Ȯ�� ������
-- �ܷ�Ű�� ������ custom_id�� tbl_custom# ���̺��� �����մϴ�. ���� ���̺���
-- custom_id �÷����� ���� ���� ������ �� �����ϴ�.(�ܷ�Ű ����, ���Ἲ �������� ����)
INSERT INTO IDEV.TBL_BUY#(BUY_SEQ, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(tbl_buy_seq.nextval,'min012', 'dk_143',1, sysdate);
-- �ܷ�Ű�� ������ pcode�� tbl_product# ���̺��� �����մϴ�. ���� ���̺���
-- pcode �÷����� ���� ���� ������ �� �����ϴ�. (�ܷ�Ű ����, ���Ἲ �������� ����)
INSERT INTO IDEV.TBL_BUY#(BUY_SEQ, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(tbl_buy_seq.nextval,'mina012', 'd_143',1, sysdate);

--1. custom# ���̺��� age �� 30�� �̻� ��� ���� ��ȸ
SELECT * FROM "TBL_CUSTOM#" tc WHERE age >=30;
--2. custom# ���̺��� custom_id 'twice' �� email ��ȸ
SELECT email FROM "TBL_CUSTOM#" tc WHERE custom_id = 'twice';
--3. product# ���̺��� category 'A2' �� pname ��ȸ
SELECT pname FROM "TBL_PRODUCT#" tp WHERE category ='A2';
--4. product# ���̺��� price �� �ְ� ��ȸ
SELECT MAX(price) FROM "TBL_PRODUCT#" tp ; 
--5. buy# ���̺��� 'IPAD011' �ѱ��� ���� ��ȸ
SELECT SUM(quantity) FROM "TBL_BUY#" tb WHERE pcode = 'IPAD011'; 
--6. buy# ���̺��� custom_id 'mina012' �� ��� ���� ��ȸ
SELECT * FROM "TBL_BUY#" tb WHERE custom_id = 'mina012';
--7. buy# ���̺��� pcode �� '1'�� ���Ե� �� ��ȸ
SELECT * FROM "TBL_BUY#" tb WHERE pcode ='1';		--������ġ ��ȸ
SELECT * FROM "TBL_BUY#" tb WHERE pcode LIKE '%1%'; --�κ���ġ ��ȸ.1�� ����
SELECT * FROM "TBL_BUY#" tb WHERE pcode LIKE '1%'; 	--�κ���ġ ��ȸ.1�� ����
SELECT * FROM "TBL_BUY#" tb WHERE pcode LIKE '%1'; 	--�κ���ġ ��ȸ.1�� ����
--8. buy# ���̺��� pcode�� 'on'�� �����ϴ� �� ��ȸ
SELECT * FROM "TBL_BUY#" tb WHERE LOWER(pcode) LIKE '%on%';