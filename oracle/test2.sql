-- 제출자 : 어민규
--2번 문제
-- 1) 2022년 2월11일부터 그 이후에 판매된 상품을 아래와 같이 조회 합니다.
SELECT * FROM TBL_BUY# WHERE BUY_DATE >='2022-02-11';

-- 2) 가장 가격이 높은 상품을 다음과 같이 조회합니다.
SELECT pcode,pname,price 
FROM TBL_PRODUCT# 
WHERE price = (SELECT MAX(price) FROM TBL_PRODUCT#); 

-- 3) 상품의 카테고리별로 가장 비싼 상품을 조회 합니다. 조회결과는 category 컬럼으로 정렬합니다.
SELECT category,MAX(price)
FROM TBL_PRODUCT# 
GROUP BY category
ORDER BY category;

-- 4) IPAD011 을 구매한 고객정보와 구매수량을 아래와 같이 조회합니다.
SELECT tc.CUSTOM_ID, tc.NAME, tb.QUANTITY
FROM "TBL_CUSTOM#" tc
JOIN "TBL_BUY#" tb  
ON tc.CUSTOM_ID = tb.CUSTOM_ID
WHERE  tb.PCODE ='IPAD011';

-- 5) 아직까지 상품을 구매하지 않은 고객을 아래와 같이 조회합니다. (outer join)
SELECT tc.CUSTOM_ID , tc.NAME , tc.AGE 
FROM "TBL_CUSTOM#" tc 
LEFT OUTER JOIN "TBL_BUY#" tb 
ON tc.CUSTOM_ID = tb.CUSTOM_ID
WHERE tb.PCODE IS NULL;

-- 6) 날짜별로 총판매금액을 아래와 같이 조회합니다. (join과 group by)
SELECT BUY_DATE2, SUM(price*quantity) AS "SUM(MONEY)" 
FROM (SELECT TO_CHAR(BUY_DATE,'YYYY-MM-DD') AS BUY_DATE2,PCODE,QUANTITY  FROM "TBL_BUY#" ) tb
JOIN "TBL_PRODUCT#" tp
ON tb.PCODE =tp.PCODE
GROUP BY BUY_DATE2
ORDER BY BUY_DATE2;

