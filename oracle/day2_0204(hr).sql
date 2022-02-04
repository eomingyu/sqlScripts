-- 연습문제 : 작성자 어민규

--1. JOBS 테이블 문제
--1) MIN_SALARY 컬럼이 10000이상인 JOB_TITLE 조회
SELECT JOB_TITLE FROM JOBS j WHERE MIN_SALARY >=10000;

--2) JOB_TITLE 컬럼이 PROGRAMMER인 행의 모든 컬럼 조회
SELECT * FROM JOBS j WHERE JOB_TITLE ='Programmer';
-- 대소문자 상관없이 조건 검색한다면 문자열 관련 오라클 함수 : UPPER(), LOWER()
SELECT * FROM JOBS j WHERE UPPER(JOB_TITLE) ='PROGRAMMER';
SELECT * FROM JOBS j WHERE LOWER(JOB_TITLE) ='programmer';

--3) MAX_SALARY 컬럼의 최대값 조회
SELECT MAX(MAX_SALARY) FROM JOBS j ;

--2. LOCATIONS 테이블 문제
--1) CITY 필드값이 LONDON인 POSTAL_CODE 컬럼 조회
SELECT POSTAL_CODE FROM LOCATIONS l WHERE CITY ='London';

--2) LOCATION_ID 컬럼이 1700, 2700, 2500이 아니고 CITY 컬럼이 Tokyo인 행의 모든 컬럼 조회
SELECT * FROM LOCATIONS l WHERE LOCATION_ID NOT IN (1700,2500,2700) AND  CITY = 'Tokyo';
