-- ���� 1 : �������� �ִ� �޿��� �޴� ����� �����ȣ�� �̸��� ����ϼ���.
SELECT JOB,MAX(SAL) FROM EMP GROUP BY JOB;

SELECT ENAME, EMPNO, JOB, SAL
FROM EMP
WHERE (JOB, SAL)
IN (SELECT JOB,MAX(SAL) FROM EMP GROUP BY JOB);

-- ���� 2 : SALESMAN�� �ּұ޿� ���� ū ��������� �����Ͷ�
SELECT SAL FROM EMP WHERE JOB='SALESMAN';

SELECT ENAME, SAL FROM EMP
WHERE SAL > ANY(SELECT SAL FROM EMP WHERE JOB='SALESMAN');

-- ���� 3 : SALESMAN�� �ִ� �޿����� ������ �����Ͷ�
SELECT ENAME, SAL FROM EMP
WHERE SAL < ANY(SELECT SAL FROM EMP WHERE JOB='SALESMAN');

-- ���� 4 : SALESMAN�� �ִ�޿� ���� ū ��������� �����Ͷ�
SELECT ENAME, SAL FROM EMP
WHERE SAL > ALL(SELECT SAL FROM EMP WHERE JOB='SALESMAN');

-- ���� 5 : ������ 'SALESMAN'�� ����� �ִ�޿�����
--	       �����鼭 �μ���ȣ�� 20���� �ƴ� ����� �̸��� �޿��� ���
SELECT DEPTNO, ENAME, SAL, JOB FROM EMP
WHERE DEPTNO<>'20' AND SAL > ALL(SELECT SAL FROM EMP WHERE JOB='SALESMAN');

-- ���� 6 : ����� ������ �� �ִ� ����� ������ ������
SELECT E.EMPNO, ENAME FROM EMP E
WHERE EXISTS (SELECT EMPNO FROM EMP WHERE E.EMPNO=MGR);

-- ���� 7 : �μ����� �ּ� �޿��� �޴� ����� ���,�̸�,����,�μ���ȣ�� ����ϼ���. 
--         �� �������� �����ϼ���.
SELECT EMPNO, ENAME, JOB, DEPTNO
FROM EMP
WHERE (JOB, SAL) 
IN(SELECT JOB, MIN(SAL) FROM EMP GROUP BY JOB) ORDER BY 4;

-- ���� 8 : �� ���̺� �ִ� �� ���� �� ���ϸ����� ���� ���� �ݾ��� �� ������ �����ּ���.
SELECT * FROM MEMBER 
WHERE MILEAGE=(SELECT MAX(MILEAGE) FROM MEMBER);

-- ���� 9 : ��ǰ ���̺� �ִ� ��ü ��ǰ ���� �� ��ǰ�� �ǸŰ����� 
--         �ǸŰ����� ��պ��� ū  ��ǰ�� ����� �����ּ���. 
--         ��, ����� ���� ���� ����� ������ ���� �Ǹ� ������
--         50������ �Ѿ�� ��ǰ�� ���ܽ�Ű����.
SELECT AVG(OUTPUT_PRICE) FROM PRODUCTS WHERE OUTPUT_PRICE<500000;

SELECT * FROM PRODUCTS 
WHERE OUTPUT_PRICE>(SELECT AVG(OUTPUT_PRICE) FROM PRODUCTS WHERE OUTPUT_PRICE<500000)
 AND OUTPUT_PRICE<500000;

-- ���� 10 : �� ���̺� �ִ� �� ���� �� ���ϸ����� ���� ���� �ݾ���
--          ������ ������ ���ʽ� ���ϸ��� 5000���� �� �ִ� SQL�� �ۼ��ϼ���
SELECT * FROM MEMBER;
SELECT MAX(MILEAGE) FROM MEMBER;

UPDATE MEMBER SET MILEAGE=MILEAGE+5000
WHERE MILEAGE=(SELECT MAX(MILEAGE) FROM MEMBER);
ROLLBACK;

-- ���� 11 : ��ǰ ���̺��� ��ǰ ����� ���� ��ü���� ������ ��,
--          �� ���޾�ü���� �ּ� �Ǹ� ������ ���� ��ǰ�� �����ϼ���.
DELETE FROM PRODUCTS WHERE (EP_CODE_FK, OUTPUT_PRICE)
IN(SELECT EP_CODE_FK, MIN(OUTPUT_PRICE) FROM PRODUCTS GROUP BY EP_CODE_FK); 
ROLLBACK;
SELECT * FROM PRODUCTS;

-- ���� 12 : EMP�� DEPT ���̺��� ������ MANAGER�� ����� �̸�, ����,�μ���,�ٹ����� ���
SELECT ENAME, JOB, DNAME, LOC
FROM (SELECT * FROM EMP WHERE JOB='MANAGER') A JOIN DEPT D
ON A.DEPTNO=D.DEPTNO;
