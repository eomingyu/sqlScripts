--1)
CREATE OR REPLACE PROCEDURE return_book(
	amem_idx IN NUMBER,		--입력값	
	abcode IN varchar2,		--입력값
	areturn_date IN DATE,	--입력값
	success OUT varchar2	--출력값
)
IS
	vrent_no NUMBER;
	v_idx NUMBER;
BEGIN 						--처리내용
	SELECT rent_no,MEM_IDX  
	INTO vrent_no,v_idx 
	FROM TBL_BOOKRENT tb 
	WHERE bcode= abcode AND mem_idx= amem_idx AND return_date IS NULL;
	IF(v_idx=amem_idx) THEN
		UPDATE TBL_BOOKRENT SET RETURN_DATE = areturn_date WHERE rent_no = vrent_no;
		UPDATE TBL_BOOKRENT SET DIFF_DAYS = RETURN_DATE-EXP_DATE WHERE RENT_NO = vrent_no;
	END IF;
	success :='성공';
	COMMIT;
	dbms_output.put_line('success 성공');
	EXCEPTION WHEN OTHERS THEN
		dbms_output.put_line('fail 실패');
		ROLLBACK;
		success :='실패';
END;

--실행 예시
DECLARE
	vresult varchar2(20);
BEGIN
	return_book(10001,'A1101','2021-10-30',vresult);
	dbms_output.put_line('결과 : '||vresult);
END;


--2) 특정 책코드를 검색하여 특정 책을 대여하고 아직 반납하지 않은 회원정보를 검색합니다. 그리고 회원 이름과 연락처를 출력합니다.
--조회 쿼리 예시
SELECT * FROM TBL_BOOKRENT tb, TBL_MEMBER tm  WHERE tb.MEM_IDX =tm.MEM_IDX AND bcode='A1102' AND RETURN_DATE IS NULL;
SELECT name,tel FROM TBL_BOOKRENT tb, TBL_MEMBER tm  WHERE tb.MEM_IDX =tm.MEM_IDX AND bcode='A1102' AND RETURN_DATE IS NULL;

--프로시저 생성
CREATE OR REPLACE PROCEDURE select_name_tel(
	abcode IN varchar2,
	aname OUT varchar2,
	atel OUT varchar2 
)
IS 
	vname varchar2(20);
	vtel varchar2(20); 
BEGIN 
	SELECT name,tel
	INTO vname , vtel
	FROM TBL_BOOKRENT tb, TBL_MEMBER tm
	WHERE tb.MEM_IDX =tm.MEM_IDX AND BCODE =abcode AND RETURN_DATE IS NULL;
	aname :=vname;
	atel :=vtel;
	COMMIT;
	dbms_output.put_line('조회 성공');
	EXCEPTION WHEN OTHERS THEN
		dbms_output.put_line('조회 실패');
		ROLLBACK;
END;

--프로시저 실행
DECLARE
	vname varchar2(20);
	vtel varchar2(20);
BEGIN
	select_name_tel('A1102',vname,vtel);
	dbms_output.put_line('이름 : '||vname||' , 연락처 : '||vtel);
END;

