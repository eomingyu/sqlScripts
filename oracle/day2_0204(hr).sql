-- �������� : �ۼ��� ��α�

--1. JOBS ���̺� ����
--1) MIN_SALARY �÷��� 10000�̻��� JOB_TITLE ��ȸ
SELECT JOB_TITLE FROM JOBS j WHERE MIN_SALARY >=10000;

--2) JOB_TITLE �÷��� PROGRAMMER�� ���� ��� �÷� ��ȸ
SELECT * FROM JOBS j WHERE JOB_TITLE ='Programmer';
-- ��ҹ��� ������� ���� �˻��Ѵٸ� ���ڿ� ���� ����Ŭ �Լ� : UPPER(), LOWER()
SELECT * FROM JOBS j WHERE UPPER(JOB_TITLE) ='PROGRAMMER';
SELECT * FROM JOBS j WHERE LOWER(JOB_TITLE) ='programmer';

--3) MAX_SALARY �÷��� �ִ밪 ��ȸ
SELECT MAX(MAX_SALARY) FROM JOBS j ;

--2. LOCATIONS ���̺� ����
--1) CITY �ʵ尪�� LONDON�� POSTAL_CODE �÷� ��ȸ
SELECT POSTAL_CODE FROM LOCATIONS l WHERE CITY ='London';

--2) LOCATION_ID �÷��� 1700, 2700, 2500�� �ƴϰ� CITY �÷��� Tokyo�� ���� ��� �÷� ��ȸ
SELECT * FROM LOCATIONS l WHERE LOCATION_ID NOT IN (1700,2500,2700) AND  CITY = 'Tokyo';

--3. EMPLOYEES ���̺�
-- ��� �Լ�(���� �Լ�)�� �� �� �����մϴ�.
SELECT COUNT(*) FROM EMPLOYEES e ;							 --�� ���� �� : 107
SELECT COUNT(*) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG';	 --���� JOB_ID ���� �� : 5

SELECT AVG(SALARY) FROM EMPLOYEES e ; 						 --���� ��� �޿� : 6461.83
SELECT AVG(SALARY) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG'; --���� JOB_ID ��� �޿� : 5760

SELECT MAX(SALARY) FROM EMPLOYEES e ;						 --���� �� �ְ� �޿� : 24000
SELECT MAX(SALARY) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG'; --���� JOB_ID  �ְ� �޿� : 9000

SELECT MIN(SALARY) FROM EMPLOYEES e ; 						 --���� �� �ּ� �޿� : 2100
SELECT MIN(SALARY) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG'; --���� JOB_ID �ּ� �޿� : 4200

-- ��� �Լ��� �׷� �Լ��Դϴ�. �ش� �Լ� ��� ���� ���ϱ� ���� �����͸� �׷�ȭ�ϰ� �����մϴ�.
-- �׷��Լ� ����� �ٸ� �÷��� ���� ��ȸ�� �� �����ϴ�. �Ʒ� SQL�� �����Դϴ�.
-- SELECT JOB_ID , MAX(SALARY) FROM EMPLOYEES e ;
SELECT * FROM EMPLOYEES e2 WHERE SALARY =(
--���� AVG,MAX,MIN ���� SQL ����� �ϳ��� ���⿡ �־����.  �� �ǹ̸� �ľ��� ���ô�.
--SELECT MAX(SALARY) FROM EMPLOYEES e
--SELECT MAX(SALARY) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG' 
--SELECT MIN(SALARY) FROM EMPLOYEES e
SELECT MIN(SALARY) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG'
);
-- SELECT �ȿ� ���� �� �ٸ� SELECT �� ���������Դϴ�. �������� ������� 1���̹Ƿ� = ���ǽĿ� ����� �� �ֽ��ϴ�.

-- IT_PROG �߿��� �ּұ޿��� �޴� ����� FIRST_NAME ,LAST_NAME  �÷� ��ȸ�ϱ�
SELECT FIRST_NAME ,LAST_NAME FROM EMPLOYEES e2 
WHERE SALARY =(SELECT MIN(SALARY) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG')
	AND JOB_ID ='IT_PROG';

--���ذ�>>�߰� : MIN_SALARY �� ��հ����� ���� ���� JOB_ID, JOB_TITLE  �÷� ��ȸ 
--�Ʒ� ����� ���� -> �׷��Լ��� �ݵ�� SELECT ������ ����մϴ�.
--SELECT JOB_ID ,JOB_TITLE FROM JOBS j WHERE MIN_SALARY <AVG(MIN_SALARY); 

--��հ�
SELECT AVG(MIN_SALARY) FROM JOBS j2
--��հ��� ���ǽĿ� �̿��ϱ�(��������)
SELECT JOB_ID ,JOB_TITLE FROM JOBS j WHERE MIN_SALARY <(SELECT AVG(MIN_SALARY) FROM JOBS j2);
