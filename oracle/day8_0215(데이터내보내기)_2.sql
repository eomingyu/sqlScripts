--데이터 내보내기 :  1) 다른 컴퓨터로 데이터베이스 테이블(데이터 포함)을 복사할 때. -> sql 스크립트 생성
--				2) 같은 컴퓨터의 다른 스키마로 데이터베이스 테이블(데이터 포함) 복사할 때.

--스크립트 파일(.sql)로 테이블 생성과 데이터 추가하기
--	1) DDL(create)과 DML(insert)이 모두 필요합니다.
--	2) DDL은 테이블 properties에서 복사합니다.
--	3) insert 데이터는 데이터 내보내기로 합니다.
--	4) 2)와 3)을 한개의 스크립트 파일(.sql)로 저장해서 실행해 봅니다.
--	5) 테이블 참조관계를 보고 순서를 고려합니다.

--설명 : SQL> @파일명.sql과 같이 실행합니다.
--		체크사항 1) 현재 디렉토리 경로 - sql 파일이 있는 위치에서 cmd 실행합니다. -> sqlplus
--			  2) @ 기호 꼭 써주세요. 파일명 정확히 하세요.
			
CREATE TABLE "EMPLOYEES" 
   ("EMPLOYEE_ID" NUMBER(6,0), 
	"FIRST_NAME" VARCHAR2(20), 
	"LAST_NAME" VARCHAR2(25) CONSTRAINT "EMP_LAST_NAME_NN" NOT NULL , 
	"EMAIL" VARCHAR2(25) CONSTRAINT "EMP_EMAIL_NN" NOT NULL, 
	"PHONE_NUMBER" VARCHAR2(20), 
	"HIRE_DATE" DATE CONSTRAINT "EMP_HIRE_DATE_NN" NOT NULL , 
	"JOB_ID" VARCHAR2(10) CONSTRAINT "EMP_JOB_NN" NOT NULL , 
	"SALARY" NUMBER(8,2), 
	"COMMISSION_PCT" NUMBER(2,2), 
	"MANAGER_ID" NUMBER(6,0), 
	"DEPARTMENT_ID" NUMBER(4,0), 
	CONSTRAINT "EMP_EMP_ID_PK" PRIMARY KEY ("EMPLOYEE_ID")
);

CREATE TABLE "DEPARTMENTS" 
   ("DEPARTMENT_ID" NUMBER(4,0), 
	"DEPARTMENT_NAME" VARCHAR2(30) CONSTRAINT "DEPT_NAME_NN" NOT NULL, 
	"MANAGER_ID" NUMBER(6,0), 
	"LOCATION_ID" NUMBER(4,0), 
	 CONSTRAINT "DEPT_ID_PK" PRIMARY KEY ("DEPARTMENT_ID")
);