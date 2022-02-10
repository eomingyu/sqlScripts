--DISTINCT : 별개의

SELECT pcode FROM "TBL_PRODUCT#" tp ;	--참고
SELECT pcode FROM "TBL_BUY#" tb  ;		--모든 행에 pcode 컬럼을 조회

SELECT DISTINCT pcode FROM "TBL_BUY#" tb ; --pcode 값 중에 동일한 것은 한 번만 조회됩니다.

