-- �б�.�б޹�ȣ = �л�.�б޹�ȣ�� ������ �ϳ��� ���� ������� �����ͼ� ����ض�
SELECT C.SNUM, SNAME, SROOM, TEL, ADDR, INDATE
FROM SCLASS C JOIN STUDENT T
JOIN C.SUM = T.SNUM_FK;