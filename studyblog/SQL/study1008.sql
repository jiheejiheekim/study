select * from student;

--���� 1 : STUDENT1 ���̺� ���� �� Ȯ��
CREATE TABLE STUDENT1 (
    NUM NUMBER(4) PRIMARY KEY,
    NAME VARCHAR2(20) NOT NULL,
    TEL VARCHAR2(20) NOT NULL,
    ADDR VARCHAR2(50),
    INDATE DATE DEFAULT SYSDATE,
    SNAME VARCHAR2(30), 
    SROOM NUMBER(3)
    );

--���� 2 :?STUDENT1�� 1�� ���� ����ó�˾Ƽ� �ּ���õ �б��ڹٹ� ����201ȣ �����͸� ��������
INSERT INTO STUDENT1 (NUM, NAME, TEL, ADDR, SNAME, SROOM)
VALUES (1, '����', '010-5555-7777', '��õ', '�ڹٹ�', 201);

DESC STUDENT;
-- ���� 3 : �����͸� ��ȸ�ϼ���
SELECT * FROM STUDENT1;

-- ���� 4 : 2��?�̹α�?����ó?����?�����͹�?301
INSERT INTO STUDENT1 (NUM, NAME, TEL, ADDR, SNAME, SROOM) 
VALUES (2, '�̹α�', '010-4456-0621', '����', '�����͹�', 301);

-- ���� 5 : �����͸� �����ϼ���
COMMIT;

-- ���� 6 : 1��?�л���?�б޸���?'���̽��'����?�����ϼ���
UPDATE STUDENT1 SET SNAME='���̽��' WHERE NUM=1;
SELECT * FROM STUDENT1;

-- ���� 7 : 1��?����?�л���?�����͸�?�����ϼ���
DELETE FROM STUDENT1 WHERE NAME='����';

-- ���� 8 : �����ߴ� ���� �л��� �����͸� �ǵ�������
ROLLBACK;
