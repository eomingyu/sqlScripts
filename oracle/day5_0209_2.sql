--commit, rollback �׽�Ʈ
-- �� ���� auto commit ������ �����ؾ� �մϴ�.
-- �� 1) *���� �����⿡ ���ؼ��� ���� (�����ͺ��̽� �޴� - Ʈ����� ��� - manual commit)
-- �� 2) DB���� ������ Auto Commit�� ����(������ �޴�-����-����-��������-auto commit ����)
--���� ���� 1��
SELECT * FROM  tbl#;
DELETE FROM tbl# WHERE acol = 'momo';
SELECT * FROM  tbl#;	--Ȯ��

ROLLBACK; --DELETE ����� ������ �ǵ����� (���)
SELECT * FROM  tbl#;	--Ȯ��

--���� ���� 2��
DELETE FROM tbl# WHERE acol='momo';
SELECT * FROM  tbl#;
COMMIT;
SELECT * FROM  tbl#;
ROLLBACK;			--������ COMMIT�� �����Ƿ� DELETE�� ����� �� �����ϴ�.
SELECT * FROM  tbl#;

--���� ���� 3��
INSERT INTO tbl# (acol,age) VALUES ('nana',33);
SELECT * FROM  tbl#;
ROLLBACK ;
SELECT * FROM  tbl#;

--���� ���� 4��
INSERT INTO tbl# (acol,age) VALUES ('nana22',33);
INSERT INTO tbl# (acol,age) VALUES ('����',29);
COMMIT ;				--���� COMMIT �Ǵ� ROLLBACK �� �� ������ ����� COMMIT 
UPDATE tbl# SET bcol='test' WHERE acol='nana22';
DELETE FROM tbl# WHERE acol ='main';
ROLLBACK ;				--���� COMMIT �Ǵ� ROLLBACK �� �� ������ ����� ROLLBACK 