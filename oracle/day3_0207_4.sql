--예시 : 쇼핑몰(고객이 상품을 구매합니다.)
--고객 테이블
CREATE TABLE tbl_custom(
	custom_id VARCHAR2(20),	--회원ID	--영문/숫자/기호
	name NVARCHAR2(20),		--이름 	--한글 등 다국어 문자 갯수
	email VARCHAR2(20),		--이메일
	age NUMBER(3),			--나이
	reg_date TIMESTAMP DEFAULT SYSDATE	--가입 일자
);

--상품 테이블 : 상품코드(가변 길이 20자리), 카테고리(고정 길이 2자리)
--								A1:전자제품, B1:식품
CREATE TABLE tbl_product(
	pcode VARCHAR2(20),		--상품코드
	category CHAR(2),		--카테고리
	pname NVARCHAR2(20),	--상품명
	price NUMBER(9)			--가격
);

--구매 테이블 : 어느 고객이 무슨 상품을 구입하는가?
CREATE TABLE tbl_buy(
	custom_id VARCHAR2(20),	--구매 회원ID
	pcode VARCHAR2(20),		--구매 상품코드
	quantity NUMBER(5),		--수량
	buy_date TIMESTAMP		--구매 일자
);

-- 데이터의 추가 : INSERT
INSERT INTO IDEV.TBL_CUSTOM (CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('mina012', '김미나', 'kimm@gmail.com', 20, SYSDATE);
INSERT INTO IDEV.TBL_CUSTOM (CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('hongGD', '홍길동', 'gil@koera.com', 32, SYSDATE);
INSERT INTO IDEV.TBL_CUSTOM (CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('twice', '박모모', 'momo@daum.net', 29, SYSDATE);
INSERT INTO IDEV.TBL_CUSTOM (CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('wonder', '이나나', 'lee@naver.com', 40, SYSDATE);

INSERT INTO IDEV.TBL_PRODUCT (PCODE, CATEGORY, PNAME, PRICE)
VALUES('IPAD011', 'A1', '아이패드10', 880000);
INSERT INTO IDEV.TBL_PRODUCT (PCODE, CATEGORY, PNAME, PRICE)
VALUES('DOWON123a', 'B1', '동원참치선물세트', 54000);
INSERT INTO IDEV.TBL_PRODUCT (PCODE, CATEGORY, PNAME, PRICE)
VALUES('dk_143', 'A2', '모션데스크', 234500);

--김미나가 아이패드 1개를 어제 구매
INSERT INTO IDEV.TBL_BUY (CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES('mina012', 'IPAD011', 1, '2022-02-06');
--홍길동이 아이패드 2개를 오늘 구매
INSERT INTO IDEV.TBL_BUY (CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES('hongGD', 'IPAD011', 2, '2022-02-07');
--이나나가 참치선물세트 3개를 어제 구매
INSERT INTO IDEV.TBL_BUY (CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES('wonder', 'DOWON123a', 3, '2022-02-06');
--김미나가 모션데스크 1개를 오늘 구매
INSERT INTO IDEV.TBL_BUY (CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES('mina012', 'dk_143', 1, '2022-02-07');
--박모모가 참치선물세트 2개를 오늘 구매
INSERT INTO IDEV.TBL_BUY (CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES('twice', 'DOWON123a', 2, '2022-02-07');


SELECT * FROM TBL_CUSTOM tc  ;
SELECT * FROM TBL_PRODUCT tp  ;
SELECT * FROM TBL_BUY tb ;

--중요1 : custom 테이블의 행 데이터를 구분한 custom_id ,pcode는 중복되면 안됩니다.
--중요2 : product 테이블의 price , quantity 등의 컬럼은 꼭 필수 데이터로 저장되어야 합니다.
--중요3 : 고객과 상품테이블에 없는 custom_id , pcode 컬럼 값을 사용하면 부정확한 데이터입니다.