-- ���� 1 : EMP���̺��� �̸��� ������ "KING: 1 YEAR SALARY = 60000" �������� ���
SELECT ENAME||': 1 YEAR SALARY = '||(SAL*12+NVL(COMM,0))
FROM EMP;

-- ���� 2 : �б�.�б޹�ȣ = �л�.�б޹�ȣ�� ������ �ϳ��� ���� ������� �����ͼ� ����ض�
SELECT C.SNUM, SNAME, SROOM, TEL, ADDR, INDATE
FROM SCLASS C JOIN STUDENT T
JOIN C.SUM = T.SNUM_FK;


----------------------------------------------------------------------DAY02
-- ���� 1 : EMP���̺��� �޿��� 3000 �̻��� ����� �����ȣ,�̸�, ������,�޿��� ����ϼ���.
SELECT EMPNO, ENAME, JOB, SAL
FROM EMP WHERE SAL>=3000;

-- ���� 2 : emp���̺��� �޿��� 1300���� 1500������ ����� �̸�,����,�޿�,�μ���ȣ�� ����ϼ���.
SELECT ENAME, JOB, SAL, DEPTNO
FROM EMP WHERE SAL BETWEEN 1300 AND 1500;

-- ���� 3 : EMPNO�� 7902, 7788, 7566�� ����� ������ ����ϼ���
SELECT * FROM EMP WHERE EMPNO IN(7902, 7788, 7566);

-- ���� 4 : �̸��� N�� �� �ִ� ��� ���
SELECT ENAME FROM EMP WHERE ENAME LIKE '%N%';

-- ���� 5 : �̸��� �ι�°�� I�� �� �ִ� ��� ���
SELECT ENAME FROM EMP WHERE ENAME LIKE '_I%';

