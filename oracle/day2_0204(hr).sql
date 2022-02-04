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

--3. EMPLOYEES 테이블
-- 통계 함수(집계 함수)를 좀 더 연습합니다.
SELECT COUNT(*) FROM EMPLOYEES e ;							 --총 직원 수 : 107
SELECT COUNT(*) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG';	 --조건 JOB_ID 직원 수 : 5

SELECT AVG(SALARY) FROM EMPLOYEES e ; 						 --직원 평균 급여 : 6461.83
SELECT AVG(SALARY) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG'; --조건 JOB_ID 평균 급여 : 5760

SELECT MAX(SALARY) FROM EMPLOYEES e ;						 --직원 중 최고 급여 : 24000
SELECT MAX(SALARY) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG'; --조건 JOB_ID  최고 급여 : 9000

SELECT MIN(SALARY) FROM EMPLOYEES e ; 						 --직원 중 최소 급여 : 2100
SELECT MIN(SALARY) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG'; --조건 JOB_ID 최소 급여 : 4200

-- 통계 함수는 그룹 함수입니다. 해당 함수 결과 값을 구하기 위해 데이터를 그룹화하고 실행합니다.
-- 그룹함수 결과와 다른 컬럼을 같이 조회할 수 없습니다. 아래 SQL은 오류입니다.
-- SELECT JOB_ID , MAX(SALARY) FROM EMPLOYEES e ;
SELECT * FROM EMPLOYEES e2 WHERE SALARY =(
--위의 AVG,MAX,MIN 구한 SQL 명령을 하나씩 여기에 넣어보세요.  그 의미를 파악해 봅시다.
--SELECT MAX(SALARY) FROM EMPLOYEES e
--SELECT MAX(SALARY) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG' 
--SELECT MIN(SALARY) FROM EMPLOYEES e
SELECT MIN(SALARY) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG'
);
-- SELECT 안에 쓰인 또 다른 SELECT 는 서브쿼리입니다. 서브쿼리 결과값이 1개이므로 = 조건식에 사용할 수 있습니다.

-- IT_PROG 중에서 최소급여를 받는 사람의 FIRST_NAME ,LAST_NAME  컬럼 조회하기
SELECT FIRST_NAME ,LAST_NAME FROM EMPLOYEES e2 
WHERE SALARY =(SELECT MIN(SALARY) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG')
	AND JOB_ID ='IT_PROG';

--미해결>>추가 : MIN_SALARY 의 평균값보다 작은 행의 JOB_ID, JOB_TITLE  컬럼 조회 
--아래 명령은 오류 -> 그룹함수는 반드시 SELECT 문으로 사용합니다.
--SELECT JOB_ID ,JOB_TITLE FROM JOBS j WHERE MIN_SALARY <AVG(MIN_SALARY); 

--평균값
SELECT AVG(MIN_SALARY) FROM JOBS j2
--평균값을 조건식에 이용하기(서브쿼리)
SELECT JOB_ID ,JOB_TITLE FROM JOBS j WHERE MIN_SALARY <(SELECT AVG(MIN_SALARY) FROM JOBS j2);
