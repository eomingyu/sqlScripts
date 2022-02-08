--UPDATE ����
--UPDATE ���̺��
--SET ������ �÷�=�� �� ,�� �����ؼ� ����
--WHERE ������ �࿡ ���� ���ǽ�;

SELECT * FROM "TBL_CUSTOM#" tc ;

--** UPDATE �� DELETE�� WHERE ���ǽ��� ����ϴ� ���� �����մϴ�.
UPDATE "TBL_CUSTOM#" 
SET age=39 
WHERE CUSTOM_ID = 'twice';		
--�⺻Ű �÷� ��� ���ǽ��� 1�� �ุ �����˴ϴ�.

UPDATE "TBL_CUSTOM#" 
SET age=23, email = 'nana@korea.kr'
WHERE CUSTOM_ID = 'wonder';

--custom_id : wonder�� twice�� ���� reg_date �� 2022�� 2�� 5�Ϸ� ����
UPDATE "TBL_CUSTOM#" 
SET reg_date = '2022-02-05'
WHERE CUSTOM_ID IN('wonder','twice');	--IN �����ڴ� OR ��ü


--���� ������ �߰�
INSERT INTO "TBL_PRODUCT#" (pcode,CATEGORY,PNAME,PRICE)
VALUES('GAL0112','A1','������20',910000);

--DELETE ����
--DELETE FROM ���̺�� WHERE ���ǽ�;
DELETE FROM "TBL_PRODUCT#" tp WHERE pcode = 'GAL0112';	-- ���� : buy#���� �������� �ʴ� ��
DELETE FROM "TBL_PRODUCT#" tp WHERE pcode = 'IPAD011';	-- ���� : ���Ἲ ����

UPDATE "TBL_PRODUCT#" SET pname = '�����е�����'	--���� : pname�� �������� �ʴ� ��
WHERE pcode = 'IPAD011';

UPDATE "TBL_PRODUCT#" SET pcode = 'IPAD011X'	--���� : pcode�� buy#���� �����ϴ� ��
WHERE pcode = 'IPAD011';						--�ٸ� ���̺��� ���� ���� ���� ����/������ �� ����.

SELECT * FROM "TBL_CUSTOM#" tc ;
SELECT * FROM "TBL_PRODUCT#" tp ;
SELECT * FROM "TBL_BUY#" tb ;

--on DELETE, on UPDATE(����Ŭ�� �ȵ�) �Ӽ� �����Ͽ� �ܷ�Ű �ٽ� �����մϴ�.
ALTER TABLE IDEV."TBL_BUY#" 
		DROP CONSTRAINT "FK_TBL_PRODUCT#";
ALTER TABLE IDEV."TBL_BUY#" 
		ADD CONSTRAINT "FK_TBL_PRODUCT#" 
		FOREIGN KEY (PCODE) REFERENCES IDEV."TBL_PRODUCT#"(PCODE) 
		ON DELETE CASCADE; 
		--���Ἲ�� ���ؼ� �����ϴ� �� ������ �����ϴ� �൵ ���޾Ƽ� ����
--ALTER TABLE ���� : DROP , ADD, MODIFY(���������� ���մϴ�.)

--SELECT �� JOIN : �� �̻��� ���̺�(�ַ� ���������� ���̺�)�� �����Ͽ� �����͸� ��ȸ�ϴ� ���
--				�� �̻��� ���̺��� ����� �÷��� ���� �� �÷��� �̿��Ͽ� JOIN �մϴ�.
--����: SELECT ~ FROM ���̺�1 a, ���̺�2 b,... WHERE a.�����÷�1=b.�����÷�1;
	
SELECT * FROM "TBL_PRODUCT#" tp,"TBL_BUY#" tb 
		 WHERE tp.pcode = tb.pcode;			--���� ����.
		 
--JOIN �� ���� ��ɹ� ����(ǥ��)
SELECT * FROM "TBL_PRODUCT#" tp 
		 JOIN  "TBL_BUY#" tb 
		 ON tp.pcode = tb.pcode;
		 
--mina012�� ������ ��ǰ���� �����ΰ�?
SELECT pname FROM "TBL_PRODUCT#" tp,"TBL_BUY#" tb 
			WHERE tp.pcode=tb.pcode AND CUSTOM_ID ='mina012';
SELECT pname FROM "TBL_PRODUCT#" tp 
			JOIN "TBL_BUY#" tb 
			ON tp.pcode = tb.pcode 
			WHERE CUSTOM_ID ='mina012';
--mina012�� ������ ��ǰ��� ���� ��ȸ�ϱ�
SELECT tp.pname, tp.price FROM "TBL_PRODUCT#" tp,"TBL_BUY#" tb  --tp.���� �Ҽ��� ���
			WHERE tp.pcode=tb.pcode AND CUSTOM_ID ='mina012';
SELECT pname, price FROM "TBL_PRODUCT#" tp 
			JOIN "TBL_BUY#" tb 
			ON tp.pcode = tb.pcode 
			WHERE CUSTOM_ID ='mina012';		
--JOIN�� ��, ����� �÷��� ���̺� ���� �� �����ؾ� �մϴ�.		
SELECT tp.pcode, tp.price FROM "TBL_PRODUCT#" tp,"TBL_BUY#" tb  --�� pcode�� �Ҽ� ���
			WHERE tp.pcode=tb.pcode AND CUSTOM_ID ='mina012';

-- �ܺ����� ���� 2����
SELECT * FROM "TBL_PRODUCT#" tp,"TBL_BUY#" tb 
		 WHERE tp.pcode = tb.pcode(+);			--�ܺ� ����.
		 
--JOIN �� ���� ��ɹ� ����2(ǥ��)
SELECT * FROM "TBL_PRODUCT#" tp 			--pcode�� �ִ� ������ �����ֱ�
		 LEFT OUTER JOIN  "TBL_BUY#" tb 	--������ �Ǵ� ���̺��� ������ product#
		 ON tp.pcode = tb.pcode;		
		
		
--������ �׽�Ʈ �Ǵ� ������ ������ ���� ��� ������ �����ϱ�
TRUNCATE TABLE "TBL_BUY#" ;
