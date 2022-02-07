--���� : ���θ�(���� ��ǰ�� �����մϴ�.)
--�� ���̺�
CREATE TABLE tbl_custom(
	custom_id VARCHAR2(20),	--����/����/��ȣ
	name NVARCHAR2(20),		--�ѱ� �� �ٱ��� ���� ����
	email VARCHAR2(20),
	age NUMBER(3),
	reg_date TIMESTAMP DEFAULT SYSDATE
);

--��ǰ ���̺� : ��ǰ�ڵ�(���� ���� 20�ڸ�), ī�װ�(���� ���� 2�ڸ�)
--								A1:������ǰ, B1:��ǰ
CREATE TABLE tbl_product(
	pcode VARCHAR2(20),
	category CHAR(2),
	pname NVARCHAR2(20),
	price NUMBER(9)
);

--���� ���̺� : ��� ���� ���� ��ǰ�� �����ϴ°�?
CREATE TABLE tbl_buy(
	custom_id VARCHAR2(20),
	pcode VARCHAR2(20),
	quantity NUMBER(5),		--����
	buy_date TIMESTAMP
);

-- �������� �߰� : INSERT
INSERT INTO IDEV.TBL_CUSTOM (CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('mina012', '��̳�', 'kimm@gmail.com', 20, SYSDATE);
INSERT INTO IDEV.TBL_CUSTOM (CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('hongGD', 'ȫ�浿', 'gil@koera.com', 32, SYSDATE);
INSERT INTO IDEV.TBL_CUSTOM (CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('twice', '�ڸ��', 'momo@daum.net', 29, SYSDATE);
INSERT INTO IDEV.TBL_CUSTOM (CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('wonder', '�̳���', 'lee@naver.com', 40, SYSDATE);

INSERT INTO IDEV.TBL_PRODUCT (PCODE, CATEGORY, PNAME, PRICE)
VALUES('IPAD011', 'A1', '�����е�10', 880000);
INSERT INTO IDEV.TBL_PRODUCT (PCODE, CATEGORY, PNAME, PRICE)
VALUES('DOWON123a', 'B1', '������ġ������Ʈ', 54000);
INSERT INTO IDEV.TBL_PRODUCT (PCODE, CATEGORY, PNAME, PRICE)
VALUES('dk_143', 'A2', '��ǵ���ũ', 234500);

--��̳��� �����е� 1���� ���� ����




INSERT INTO IDEV.TBL_BUY (CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES('mina012', 'IPAD011', 1, '2022-02-06');
--ȫ�浿�� �����е� 2���� ���� ����
INSERT INTO IDEV.TBL_BUY (CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES('hongGD', 'IPAD011', 2, '2022-02-07');
--�̳����� ��ġ������Ʈ 3���� ���� ����
INSERT INTO IDEV.TBL_BUY (CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES('wonder', 'DOWON123a', 3, '2022-02-06');
--��̳��� ��ǵ���ũ 1���� ���� ����
INSERT INTO IDEV.TBL_BUY (CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES('mina012', 'dk_143', 1, '2022-02-07');
--�ڸ�� ��ġ������Ʈ 2���� ���� ����
INSERT INTO IDEV.TBL_BUY (CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES('twice', 'DOWON123a', 2, '2022-02-07');
SELECT * FROM TBL_BUY tb ;

--�߿�1 : custom ���̺��� �� �����͸� ������ custom_id ,pcode�� �ߺ��Ǹ� �ȵ˴ϴ�.
--�߿�2 : product ���̺��� price , quantity ���� �÷��� �� �ʼ� �����ͷ� ����Ǿ�� �մϴ�.
--�߿�3 : ���� ��ǰ���̺� ���� custom_id , pcode �÷� ���� ����ϸ� ����Ȯ�� �������Դϴ�.