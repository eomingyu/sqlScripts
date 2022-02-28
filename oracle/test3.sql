-- 제출자 : 어민규
--3번 문제
--1) TBL_POSTCODE 테이블의 데이터를 아래와 같이 추가하는 DDL명령을 모두 작성하세요.
INSERT INTO TBL_POSTCODE(POSTCODE, AREA1) VALUES('137964', '서울특별시 서초구 서초2동');
INSERT INTO TBL_POSTCODE(POSTCODE, AREA1) VALUES('138761', '서울특별시 송파구 장지동 409880');
INSERT INTO TBL_POSTCODE(POSTCODE, AREA1) VALUES('412510', '경기도 고양시 덕양구 벽제동');
INSERT INTO TBL_POSTCODE(POSTCODE, AREA1) VALUES('409880', '인천광역시 옹진군 자월면');

--2) 1번 문제에서 TBL_CUSTOM# 테이블에  POSTCODE 컬럼을 추가하였습니다. 그 후에 아래와 같이 각 행의
--POSTCODE 컬럼값을 변경하기 위한 DDL명령을 모두 작성하세요.
UPDATE TBL_CUSTOM# SET POSTCODE= '137964' WHERE CUSTOM_ID='mina012';
UPDATE TBL_CUSTOM# SET POSTCODE= '412510' WHERE CUSTOM_ID='hongGD';
UPDATE TBL_CUSTOM# SET POSTCODE= '409880' WHERE CUSTOM_ID='wonder';
UPDATE TBL_CUSTOM# SET POSTCODE= '138761' WHERE CUSTOM_ID='sana';

--3) 아래와 같이 select 쿼리를 실행시킨 결과가 조회되는  v_custom_info 이름의 뷰(VIEW)를 생성하세요.위의 2개 테이블을 이용합니다.
CREATE VIEW v_custom_info
AS
SELECT tc.CUSTOM_ID, tc.POSTCODE, tp.AREA1 
FROM TBL_CUSTOM# tc 
JOIN TBL_POSTCODE tp 
ON tc.POSTCODE=tp.POSTCODE; 

