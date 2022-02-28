--commit, rollback 테스트
-- ㄴ 디비버 auto commit 설정을 변경해야 합니다.
-- ㄴ 1) *현재 편집기에 대해서만 변경 (데이터베이스 메뉴 - 트랜잭션 모드 - manual commit)
-- ㄴ 2) DB연결 유형을 Auto Commit을 해제(윈도우 메뉴-설정-연결-연결유형-auto commit 해제)
--실행 순서 1번
SELECT * FROM  tbl#;
DELETE FROM tbl# WHERE acol = 'momo';
SELECT * FROM  tbl#;	--확인

ROLLBACK; --DELETE 명령을 원래로 되돌리기 (취소)
SELECT * FROM  tbl#;	--확인

--실행 순서 2번
DELETE FROM tbl# WHERE acol='momo';
SELECT * FROM  tbl#;
COMMIT;
SELECT * FROM  tbl#;
ROLLBACK;			--위에서 COMMIT을 했으므로 DELETE를 취소할 수 없습니다.
SELECT * FROM  tbl#;

--실행 순서 3번
INSERT INTO tbl# (acol,age) VALUES ('nana',33);
SELECT * FROM  tbl#;
ROLLBACK ;
SELECT * FROM  tbl#;

--실행 순서 4번
INSERT INTO tbl# (acol,age) VALUES ('nana22',33);
INSERT INTO tbl# (acol,age) VALUES ('쯔위',29);
COMMIT ;				--최종 COMMIT 또는 ROLLBACK 한 그 이후의 명령을 COMMIT 
UPDATE tbl# SET bcol='test' WHERE acol='nana22';
DELETE FROM tbl# WHERE acol ='main';
ROLLBACK ;				--최종 COMMIT 또는 ROLLBACK 한 그 이후의 명령을 ROLLBACK 