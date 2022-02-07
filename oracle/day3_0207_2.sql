--문자열 타입
--CHAR(길이) : 고정길이, 단위는 바이트
--VARCHAR(길이) : 오라클에서 존재하고 사용하지 않는 예비자료형.
--VARCHAR2(길이) : 가변길이, 단위는 바이트, 길이는 최대 길이이고 실제 메모리는 데이터 크기만큼 사용합니다.
--				최대 2000바이트입니다. UTF-8 인코딩에서 한글은 3바이트, 영문/숫자/기호는 1바이트

CREATE TABLE table_string(
	acol CHAR(10),
	bcol VARCHAR2(10),
	ccol NCHAR(10),
	dcol NVARCHAR2(10)
);
--CHAR 타입 확인 : 남는 길이는 공백으로 채웁니다.
INSERT INTO table_string(acol) VALUES ('abcdefghij');
INSERT INTO table_string(acol) VALUES ('abcde');
INSERT INTO table_string(acol) VALUES ('가나다라');	--3바이트 * 4글자
INSERT INTO table_string(acol) VALUES ('가나다');

--VARCHAR2 타입 확인 : CHAR와 비교했을 때 추가되는 공백 없습니다.
INSERT INTO table_string(bcol) VALUES ('abcdefghij');
INSERT INTO table_string(bcol) VALUES ('abcde');
INSERT INTO table_string(bcol) VALUES ('가나다라');	--3바이트 * 4글자
INSERT INTO table_string(bcol) VALUES ('가나다');

--NCHAR 타입 확인 : 고정 길이, 단위는 문자 개수
INSERT INTO table_string(ccol) VALUES ('abcdefghij');
INSERT INTO table_string(ccol) VALUES ('abcde');
INSERT INTO table_string(ccol) VALUES ('가나다라마바사아자차');	
INSERT INTO table_string(ccol) VALUES ('가나다라');
INSERT INTO table_string(ccol) VALUES ('가나다라마바사아자차카'); --11글자 오류

--NVARCHAR 타입 확인 : 가변 길이, 단위는 문자 개수
INSERT INTO table_string(dcol) VALUES ('abcdefghij');
INSERT INTO table_string(dcol) VALUES ('abcde');
INSERT INTO table_string(dcol) VALUES ('가나다라마바사아자차');	
INSERT INTO table_string(dcol) VALUES ('가나다라');
INSERT INTO table_string(dcol) VALUES ('가나다라마바사아자차카'); --11글자 오류

--여러가지 언어 문자가 사용되고 저장될 때 NVARCHAR2 글자 수로 계산하는 것이 권고사항입니다.