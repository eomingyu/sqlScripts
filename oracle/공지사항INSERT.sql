SELECT * 
FROM(SELECT
	n.*,
	LEAD(notice_idx,1,99999) OVER(ORDER BY notice_idx) AS next_idx,
	LAG(notice_idx,1,-1) OVER(ORDER BY notice_idx) AS last_idx, 
	LEAD(notice_title,1,'다음글이 없습니다.') OVER(ORDER BY notice_idx) AS next_title, 
	LAG(notice_title,1,'이전글이 없습니다.') OVER(ORDER BY notice_idx) AS last_title 
	FROM NOTICE n)
WHERE notice_idx =1;
SELECT
	n.*,
	LEAD(notice_idx,1,99999) OVER(ORDER BY notice_idx) AS next_idx,
	LAG(notice_idx,1,-1) OVER(ORDER BY notice_idx) AS last_idx, 
	LEAD(notice_title,1,'다음글이 없습니다.') OVER(ORDER BY notice_idx) AS next_title, 
	LAG(notice_title,1,'이전글이 없습니다.') OVER(ORDER BY notice_idx) AS last_title 
	FROM NOTICE n;



CREATE SEQUENCE notice_idx_seq;						--9.공지사항 테이블 /공지사항 번호
--DROP SEQUENCE notice_idx_seq;						--9.공지사항 테이블 /공지사항 번호

INSERT INTO IDEV.NOTICE
(NOTICE_IDX, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE, NOTICE_VIEW)
VALUES(notice_idx_seq.nextval, '[이벤트] 할인 시작', '가격 할인 정보', '2021-12-29', '0');

INSERT INTO IDEV.NOTICE
(NOTICE_IDX, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE, NOTICE_VIEW)
VALUES(notice_idx_seq.nextval, '[공지] 홈페이지 점검 안내', '리모델링 공사 진행 중', '2022-01-01', '0');
INSERT INTO IDEV.NOTICE
(NOTICE_IDX, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE, NOTICE_VIEW)
VALUES(notice_idx_seq.nextval, '[공지] 휴관 안내', '리모델링 공사 진행 중', '2022-01-02', '0');

INSERT INTO IDEV.NOTICE
(NOTICE_IDX, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE, NOTICE_VIEW)
VALUES(notice_idx_seq.nextval, '[공지] 극단 인어 <화로> 공연 안내', '안녕하세요? 2월 19일부터 아르코예술극장 대극장에서 연극 <화로>를 공연하는 극단 인어입니다.
코로나19 오미크론 변이 확산세가 높아지는 가운데, <화로> 연습기간 중 확진자가 발생되어 즉각 자가격리 조치하였으며, 방역지침에 의거하여 2022.2.15.(화) 0시를 기점으로 자가격리가 해제되었습니다.
공연팀은 확진자 발생 직후부터 비대면 화상통화로 연습을 진행하였고, 격리 해제 후 신속항원검사 또는 자가진단키트를 통해 전원 음성을 확인하였습니다.  
극단 인어는 여러 사안을 고려한 논의 끝에 예정된 일정대로 공연을 진행하기로 결정하였으며, 
공연이 끝나는 날까지 안전한 공연 환경을 위해 최선의 노력을 다하겠습니다. 감사합니다.
연극 <화로>는 관객 여러분을 만나기 위해 이렇게 준비하고 있습니다.
  - 모든 출연진 및 스태프는 매일 자가진단키트를 사용해 코로나19 음성 확인
  - 극장과의 협력을 통한 방역수칙 준수 철저
예매 취소를 원하실 경우 각 예매처에서 수수료 없이 취소 가능합니다.', '2022-02-18', '0');

INSERT INTO IDEV.NOTICE
(NOTICE_IDX, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE, NOTICE_VIEW)
VALUES(notice_idx_seq.nextval, '[공지] [2.19(토) 시행] 프레또극장 전자출입명부 미운영 안내', '정부의 방역지침에 따라 2월 19일(토)부터 출입자 명부 작성·관리 의무 적용이 해제되었습니다.
   이에 프레또극장 이용 시 전자출입명부(안심콜 또는 QR코드)는 미운영 하오니 참고하시기 바랍니다.
   단, 공연장 입장 시 출입구에서의 체온 측정은 기존대로 운영합니다', '2022-02-19', '0');

INSERT INTO IDEV.NOTICE
(NOTICE_IDX, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE, NOTICE_VIEW)
VALUES(notice_idx_seq.nextval, '[모집] 배리어프리 공연제작을 위한 온라인 워크숍', '프레또극장은 경계 없는 무대예술의 확산을 위해 예술극장에서 공연을 예정하는 6단체와 함께 배리어프리 공연제작을 준비하고 있습니다. 공연제작에 앞서 배리어프리 공연제작 분야에서 활동하고 있는 전문가 사례와 컨설팅, 장애인의 공연장 재난대피 교육까지 다양한 정보를 공유하고자 워크숍을 진행합니다.
이번 워크숍은 코로나19 변이 확산으로 부득이하게 온라인 교육 및 컨설팅의 형태로 진행됩니다. 이에 따라 예술극장 배리어프리 공연제작 6단체의 제작진과 더불어, 사전 신청을 접수해주시는 분들도 워크숍 수강이 가능합니다. 공연예술인 여러분의 많은 관심과 참여를 바랍니다. ', '2022-03-03', '0');

INSERT INTO IDEV.NOTICE
(NOTICE_IDX, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE, NOTICE_VIEW)
VALUES(notice_idx_seq.nextval, '[공지] 극장 공사로 인한 임시휴관 및 주차장 이용불가 안내(2022.3.1~5.29)', '안녕하세요.
1981년 개관하여 40년 간 다양한 작품으로 관객 여러분을 만났던 극장이 옥탑 방수 보강공사로 임시휴관(2022.3.1(화)~5.29(일) / 90일간) 합니다.
더욱 안전한 극장으로 관객 여러분을 만나겠습니다. 
공사 기간 동안 크레인 설치, 대형트럭 이동 등 안전상의 이유로 극장 주차장은 운영하지 않습니다.
가급적 대중교통 이용을 부탁드리며, 극장 주차장을 비롯한 인근 주차장을 이용해주시면 감사하겠습니다.', '2022-02-20', '0');