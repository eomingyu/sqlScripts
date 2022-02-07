--날짜 타입 : DATE, TIMESTAMP(timezone 설정)
CREATE TABLE table_date(
	acol DATE,
	bcol TIMESTAMP,
	ccol TIMESTAMP DEFAULT SYSDATE
	--값을 지정 안했을 때 기본값(default) : sysdate는 현재 날짜/시간(서버)
);
--날짜 형식은 문자열 타입과 자동 캐스팅이 됩니다. ''안에 yyyy-MM-dd hh:mm:ss 문자열 형식으로 작성합니다.
INSERT INTO IDEV.TABLE_DATE (ACOL, BCOL)
VALUES('2022-02-07', '2022-02-07');
