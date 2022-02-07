--���ڿ� Ÿ��
--CHAR(����) : ��������, ������ ����Ʈ
--VARCHAR(����) : ����Ŭ���� �����ϰ� ������� �ʴ� �����ڷ���.
--VARCHAR2(����) : ��������, ������ ����Ʈ, ���̴� �ִ� �����̰� ���� �޸𸮴� ������ ũ�⸸ŭ ����մϴ�.
--				�ִ� 2000����Ʈ�Դϴ�. UTF-8 ���ڵ����� �ѱ��� 3����Ʈ, ����/����/��ȣ�� 1����Ʈ

CREATE TABLE table_string(
	acol CHAR(10),
	bcol VARCHAR2(10),
	ccol NCHAR(10),
	dcol NVARCHAR2(10)
);
--CHAR Ÿ�� Ȯ�� : ���� ���̴� �������� ä��ϴ�.
INSERT INTO table_string(acol) VALUES ('abcdefghij');
INSERT INTO table_string(acol) VALUES ('abcde');
INSERT INTO table_string(acol) VALUES ('�����ٶ�');	--3����Ʈ * 4����
INSERT INTO table_string(acol) VALUES ('������');

--VARCHAR2 Ÿ�� Ȯ�� : CHAR�� ������ �� �߰��Ǵ� ���� �����ϴ�.
INSERT INTO table_string(bcol) VALUES ('abcdefghij');
INSERT INTO table_string(bcol) VALUES ('abcde');
INSERT INTO table_string(bcol) VALUES ('�����ٶ�');	--3����Ʈ * 4����
INSERT INTO table_string(bcol) VALUES ('������');

--NCHAR Ÿ�� Ȯ�� : ���� ����, ������ ���� ����
INSERT INTO table_string(ccol) VALUES ('abcdefghij');
INSERT INTO table_string(ccol) VALUES ('abcde');
INSERT INTO table_string(ccol) VALUES ('�����ٶ󸶹ٻ������');	
INSERT INTO table_string(ccol) VALUES ('�����ٶ�');
INSERT INTO table_string(ccol) VALUES ('�����ٶ󸶹ٻ������ī'); --11���� ����

--NVARCHAR Ÿ�� Ȯ�� : ���� ����, ������ ���� ����
INSERT INTO table_string(dcol) VALUES ('abcdefghij');
INSERT INTO table_string(dcol) VALUES ('abcde');
INSERT INTO table_string(dcol) VALUES ('�����ٶ󸶹ٻ������');	
INSERT INTO table_string(dcol) VALUES ('�����ٶ�');
INSERT INTO table_string(dcol) VALUES ('�����ٶ󸶹ٻ������ī'); --11���� ����

--�������� ��� ���ڰ� ���ǰ� ����� �� NVARCHAR2 ���� ���� ����ϴ� ���� �ǰ�����Դϴ�.