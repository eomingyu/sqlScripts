--view : ���� ���̺�(���������� �������� �ʰ� �������� ������� ���̺�)
--			�� �������� ���̺��� �̿��Ͽ� �����մϴ�.
--			�� �����(������)�� ���̺�ó�� SELECT�� ��ȸ�� �� �ִ� ���̺�
--			�� grant resource, connect to idev; -> resource�� view ������ �����Դϴ�.

CREATE VIEW v_buy
AS
SELECT pcode, custom_id FROM tbl_buy#;
/*	idev �������� create view ������ �ּ���(sql plus���� �����ϱ�)
SQL> connect system
Enter password:
Connected.
SQL> grant create view to idev;

Grant succeeded.
*/

--view�� �̿��� select ��ȸ
SELECT * FROM V_BUY vb WHERE pcode='dk_143';

--buy#, custom#�� �����Ͽ� custom_id ,pcode ,���̸�,�̸���,���ż���,���ų�¥
-- �� v_sale �̸��� view�� ���弼��

CREATE VIEW v_sale
AS
SELECT tc.custom_id, tb.pcode, tc.name, tc.email, tb.quantity, tb.buy_date 
FROM tbl_custom# tc, tbl_buy tb
WHERE tc.CUSTOM_ID = tb.CUSTOM_ID ;

SELECT * FROM v_sale;