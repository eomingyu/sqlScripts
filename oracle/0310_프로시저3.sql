--프로시저를 오라클 객체로 생성하면 호출해서 다시 실행할 수 있습니다.
/*기본형식
CREATE OR REPLACE dept_max_salary(

)
IS
BEGIN 
	
END;
*/
--프로시저를 생성할 때 create : 없으면 만들기, replace : 있으면 대체하기

CREATE OR REPLACE PROCEDURE dept_max_salary(
	dept_name IN hr.DEPARTMENTS.DEPARTMENT_NAME %TYPE 
)
IS 	
	dept_id departments.department_id%TYPE;
	max_sal NUMBER;		
	emp EMPLOYEES %ROWTYPE;
BEGIN 
	SELECT DEPARTMENT_ID  
	INTO dept_id 	
	FROM DEPARTMENTS d WHERE DEPARTMENT_NAME= dept_name;	
	SELECT MAX(salary) 
	INTO max_sal	
	FROM EMPLOYEES e WHERE DEPARTMENT_ID =dept_id;
	DBMS_OUTPUT.PUT_LINE(dept_name || ' 최고 연봉금액() : ' || max_sal);
	SELECT *
	INTO emp		
	FROM EMPLOYEES e 
	WHERE DEPARTMENT_ID =dept_id AND salary =max_sal;
	DBMS_OUTPUT.PUT_LINE(dept_name || ' 최고 연봉 직원 : '|| emp.last_name||','||emp.hire_date);	
END;
BEGIN
dept_max_salary('IT');
END;

--일반 join 
select d.department_id id, d.department_name dept , max_sal from departments d,
        (select DEPARTMENT_ID id, max(salary) max_sal
        from employees 
        GROUP by DEPARTMENT_ID) max_sal# 
    where d.DEPARTMENT_ID = max_sal#.id AND d.DEPARTMENT_NAME ='Sales';

--부서별 최고 연봉
select DEPARTMENT_ID, max(salary) max_sal
        FROM employees 
        GROUP by DEPARTMENT_ID
      	HAVING DEPARTMENT_ID =80;

CREATE OR REPLACE PROCEDURE dept_max_salary2(
	dept_name IN hr.DEPARTMENTS.DEPARTMENT_NAME %TYPE,
	--출력 매개변수
	dept_id OUT hr.DEPARTMENTS.DEPARTMENT_ID %TYPE,
	max_sal OUT NUMBER
)    
IS       
	vdept_id NUMBER;
BEGIN 
	select d.department_id
	INTO vdept_id
	from departments d
	WHERE d.DEPARTMENT_NAME = dept_name;
	--
	select DEPARTMENT_ID, max(salary)
	INTO dept_id, max_sal			--조회 결과를 출력 매개변수에 저장.
        FROM employees 
        GROUP by DEPARTMENT_ID
      	HAVING DEPARTMENT_ID =vdept_id;
END;
--실행할 때 출력 매개변수를 선언해야합니다.
DECLARE
	dept_id hr.departments.department_id %TYPE;
	max_sal NUMBER;
BEGIN
	hr.dept_max_salary2('Sales', dept_id, max_sal); --프로시저 실행후에 출력 매개변수를 통해서 조회된 값을 전달 받습니다.
	DBMS_OUTPUT.PUT_LINE('부서코드 : '|| dept_id ||',연봉금액 : '|| max_sal);
END;
