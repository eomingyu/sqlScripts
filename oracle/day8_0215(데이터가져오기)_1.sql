--��ü ������ ������?
SELECT COUNT(*) FROM TBL_CAMPAREA tc  ; --2300
--������ ������ ������?
SELECT COUNT(*) FROM TBL_CAMPAREA tc WHERE address LIKE '������%'; --367
--�������� �ڵ��� �߿��� �̸�,�δ�ü� ��ȸ�ϱ�
SELECT camp_name, etc1, etc2 FROM TBL_CAMPAREA tc WHERE address LIKE '������%' AND camp_type LIKE '%�ڵ���%';
SELECT COUNT(*) FROM TBL_CAMPAREA tc WHERE address LIKE '������%' AND camp_type LIKE '%�ڵ���%';
--�ڵ��� �߿��� ������ 50�� �̻��� �� �߿��� �̸�, �ּ� ��ȸ�ϱ�
SELECT camp_name ,address FROM TBL_CAMPAREA tc WHERE CAR_CNT >= 50;
--ī��� �ִ� �߿��� �̸�, �ּ�, ī��� ���� ��ȸ�ϱ�
SELECT camp_name,address, cara_cnt FROM TBL_CAMPAREA tc WHERE cara_cnt > 0;

SELECT DISTINCT substr(address,1,instr(ADDRESS,' '))
FROM TBL_CAMPAREA tc ; --���� �ձ��� ���ڿ� ����