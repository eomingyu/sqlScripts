--��¥ Ÿ�� : DATE, TIMESTAMP(timezone ����)
CREATE TABLE table_date(
	acol DATE,
	bcol TIMESTAMP,
	ccol TIMESTAMP DEFAULT SYSDATE
	--���� ���� ������ �� �⺻��(default) : sysdate�� ���� ��¥/�ð�(����)
);
--��¥ ������ ���ڿ� Ÿ�԰� �ڵ� ĳ������ �˴ϴ�. ''�ȿ� yyyy-MM-dd hh:mm:ss ���ڿ� �������� �ۼ��մϴ�.
INSERT INTO IDEV.TABLE_DATE (ACOL, BCOL)
VALUES('2022-02-07', '2022-02-07');
