--DML : select, insert, update, delete ���� �˾ƺ���

-- ������ ��ȸ : select �÷���1, �÷���2, ... from ���̺���;

SELECT STUNO, STU_NAME, EMAIL, ADDRESS, ENTER_DATE, ETC 
FROM IDEV.STUDENTS;

-- ���õǴ� �÷��� �ʿ��� �͵�� �մϴ�. 
-- (���ɾ� 1�� ������ ctrl+enter , ���� ���� �� ���� ������ ���� �巡�� �� alt+x)
SELECT STUNO, STU_NAME  FROM STUDENTS;

-- ��� �÷��� ������ ���� wildcard ���� *�� ��ü
SELECT * FROM STUDENTS;

-- ������ ��ȸ�� ���Ǵ� ���� �߰��� where �ڿ� ���ǽ� �ۼ�
SELECT * FROM STUDENTS WHERE STUNO =1;
SELECT * FROM STUDENTS WHERE STU_NAME ='�ֳ���';
SELECT * FROM STUDENTS WHERE ENTER_DATE  >'2020-06-01'; --dataŸ���� ���ڿ� '' ��ȣ ���

-- ������ �߰�(����) : insert into ���̺���(�÷���1, �÷���2, ...) values(��1, ��2,...);
INSERT INTO IDEV.STUDENTS
(STUNO, STU_NAME, EMAIL, ADDRESS, ENTER_DATE, ETC)
VALUES(0, '', '', '', '', '');

-- ������ ���� : update ���̺��� set �÷���1=��1, �÷���2=��2, ...;
UPDATE IDEV.STUDENTS
SET STUNO=0, STU_NAME='', EMAIL='', ADDRESS='', ENTER_DATE='', ETC='';

-- ������ ����� ���� : delete from ���̺��� where �÷���1=��1 and �÷Ÿ�2=��2,...;
--									 where ������ �࿡ ���� ����
DELETE FROM IDEV.STUDENTS
WHERE STUNO=0 AND STU_NAME='' AND EMAIL='' AND ADDRESS='' AND ENTER_DATE='' AND ETC='';

-- null �� �����͸� ��ȸ�ϴ� ���ǽ�
SELECT STUNO, STU_NAME, ENTER_DATE, ETC FROM STUDENTS WHERE ETC IS NULL;
SELECT STUNO, STU_NAME, ENTER_DATE, ETC FROM STUDENTS WHERE ETC IS NOT NULL;

-- ������ ��ȸ�� �� �÷��� ��ſ� �Լ�(count,sum,avg,max,min)�� ���
SELECT COUNT(*) FROM STUDENTS ;
SELECT MAX(STUNO) FROM STUDENTS s;  --s�� ��Ī(alias)
SELECT MIN(STUNO) FROM STUDENTS s;  

SELECT MAX(STU_NAME) FROM STUDENTS s ; --���ڿ� Ÿ���� �÷��� ������ ���Ͽ� ����� ����.
SELECT MIN(STU_NAME) FROM STUDENTS s ;

--������ ��ȸ ���ǽĿ� IN �Ǵ� NOT IN : or ���ǽ� ��ſ� ����մϴ�.
SELECT * FROM STUDENTS s WHERE STUNO =1 OR STUNO =3;
SELECT * FROM STUDENTS s WHERE STUNO IN (1,3); 		--������ �÷��� ���� ������ ���� OR ���ǰ˻�