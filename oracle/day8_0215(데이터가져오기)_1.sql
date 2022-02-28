--전체 데이터 개수는?
SELECT COUNT(*) FROM TBL_CAMPAREA tc  ; --2300
--강원도 데이터 개수는?
SELECT COUNT(*) FROM TBL_CAMPAREA tc WHERE address LIKE '강원도%'; --367
--강원도의 자동차 야영장 이름,부대시설 조회하기
SELECT camp_name, etc1, etc2 FROM TBL_CAMPAREA tc WHERE address LIKE '강원도%' AND camp_type LIKE '%자동차%';
SELECT COUNT(*) FROM TBL_CAMPAREA tc WHERE address LIKE '강원도%' AND camp_type LIKE '%자동차%';
--자동차 야영장 개수가 50개 이상인 곳 야영지 이름, 주소 조회하기
SELECT camp_name ,address FROM TBL_CAMPAREA tc WHERE CAR_CNT >= 50;
--카라반 있는 야영장 이름, 주소, 카라반 갯수 조회하기
SELECT camp_name,address, cara_cnt FROM TBL_CAMPAREA tc WHERE cara_cnt > 0;

SELECT DISTINCT substr(address,1,instr(ADDRESS,' '))
FROM TBL_CAMPAREA tc ; --공백 앞까지 문자열 추출