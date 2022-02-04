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
