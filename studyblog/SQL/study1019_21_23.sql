-- ���� 1 : �� ���̺��� ������ ������ �� ������ ���� �ִ� ���ϸ��� ������ �����ּ���.
--         ��, �������� �ִ� ���ϸ����� 0�� ���� ���ܽ�ŵ�ô�.
SELECT JOB, MAX(MILEAGE) FROM MEMBER
GROUP BY JOB HAVING MAX(MILEAGE)<>0;

-- ���� 2 : ��ǰ ���̺��� �� ���޾�ü �ڵ庰�� ��ǰ �ǸŰ��� ��հ� �� ������ 100������ ����
--	       ���� �׸��� ������ �����ּ���.
SELECT * FROM PRODUCTS;

SELECT EP_CODE_FK, AVG(OUTPUT_PRICE) 
FROM PRODUCTS
GROUP BY EP_CODE_FK 
HAVING MOD(AVG(OUTPUT_PRICE),100)=0;

-- ���� 3 : JOB�� 'CLERK'�̸� �޿��λ��� 15%, SALESMAN=>10%, MANAGER->5%, ANALYST=>3%�� �λ��� �޿�����
--         �����, ����, �޿���, �λ�� �� �Բ� �����ּ���
SELECT ENAME, JOB, SAL,  
DECODE(JOB, 'CLERK',SAL*1.15, 'SALESMAN',SAL*1.1, 'MANAGER',SAL*1.05, 'ANALYST',SAL*1.03, SAL) SALINCREASE
FROM EMP;


-- ���� 4 : EMP���� ���, �����, ����, ���ʽ��� �Բ� ����ϵ�
--    ���ʽ�(COMM)�� NULL�� ���� �� ���� '�ش���� ����',
--    COMM�� 0�� ���� '���ʽ� ����',
--    COMM�� 0���� ū ���� '���ʽ� ����'�� �Բ� ����ϼ���
--    �÷����� "���ʽ� ���� ����"
SELECT EMPNO, ENAME, JOB, COMM, 
CASE
    WHEN COMM IS NULL THEN '�ش���� ����'
    WHEN COMM=0 THEN '���ʽ� ����'
    WHEN COMM>0 THEN '���ʽ� ���� : '||COMM
    ELSE ''
END "���ʽ� ���� ����"
FROM EMP;

-- ���� 5 :  �޿��� ������ �ξ� 1����� ������ ������� ����ϼ���
SELECT RANK() OVER(ORDER BY SAL DESC) RANKING, EMP.* FROM EMP; 

-- ���� 6 : �޿� ���ϸ��� TOP3�� ������ �����ּ���
SELECT * FROM (SELECT RANK() OVER(ORDER BY SAL DESC) RANKING, EMP.* FROM EMP) WHERE RANKING<4;

-- ���� 7 : �Ի����� �ֱٿ� �Ի��� ������ ����
SELECT RANK()OVER(ORDER BY HIREDATE DESC) RANKING, EMP.* FROM EMP;

-- ���� 8 : 8��°~13��°�� ���� �Ի��� ����� ���ϼ���
SELECT * FROM
(SELECT ROW_NUMBER() OVER(ORDER BY HIREDATE DESC) RANKING, EMP.* FROM EMP) WHERE RANKING BETWEEN 8 AND 13;

-------------------------------------------------------------10/21
-- ���� 1 : �Ի����� �ֱ��� ������� ��ȣ�� �ο��ϰ� �ֱ� �Ի��� 3������ 8�������� ����ϼ���
SELECT * FROM EMP ORDER BY HIREDATE DESC;

SELECT ROWNUM RN, EMP.*
FROM EMP
ORDER BY HIREDATE
DESC;


    SELECT * FROM (
        SELECT ROWNUM RN, A.*
        FROM
        (SELECT * FROM EMP ORDER BY HIREDATE DESC) A
        )
    WHERE RN BETWEEN 3 AND 8;
    
-- ���� 1 : SALESMAN�� �����ȣ,�̸�,�޿�,�μ���,�ٹ����� ����Ͽ���.
SELECT EMPNO, ENAME, SAL, DNAME, LOC 
FROM EMP E JOIN DEPT D 
ON E.DEPTNO = D.DEPTNO AND JOB='SALESMAN';

-- ���� 2 : ���� ������ �ִ� ī�װ� ���̺�� ��ǰ ���̺��� �̿��Ͽ� �� ��ǰ���� ī�װ�
--         �̸��� ��ǰ �̸��� �Բ� �����ּ���.
SELECT * FROM PRODUCTS;
SELECT * FROM CATEGORY;

SELECT CATEGORY_CODE, CATEGORY_NAME, PRODUCTS_NAME 
FROM CATEGORY C, PRODUCTS P
WHERE C.CATEGORY_CODE = P.CATEGORY_FK;

-- ���� 3 : ī�װ� ���̺�� ��ǰ ���̺��� �����Ͽ� ȭ�鿡 ����ϵ� ��ǰ�� ���� ��
--         ������ü�� �Ｚ�� ��ǰ�� ������ �����Ͽ� ī�װ� �̸��� ��ǰ�̸�, ��ǰ����
--         ������ ���� ������ ȭ�鿡 �����ּ���.
SELECT * FROM PRODUCTS;
SELECT * FROM CATEGORY;

SELECT CATEGORY_NAME, PRODUCTS_NAME, OUTPUT_PRICE, COMPANY
FROM CATEGORY C JOIN PRODUCTS P
ON C.CATEGORY_CODE = P.CATEGORY_FK AND P.COMPANY='�Ｚ';

-- ���� 4 : �� ��ǰ���� ī�װ� �� ��ǰ��, ������ ����ϼ���. �� ī�װ��� 'TV'�� ���� 
--         �����ϰ� ������ ������ ��ǰ�� ������ ������ ������ �����ϼ���.
SELECT CATEGORY_NAME, PRODUCTS_NAME, OUTPUT_PRICE 
FROM CATEGORY C JOIN PRODUCTS P
ON C.CATEGORY_CODE = P.CATEGORY_FK WHERE CATEGORY_NAME<>'TV' ORDER BY OUTPUT_PRICE ASC;

----------------------------------------------------------------10/23

-- ���� 5 : EMP�� SALGRADE���̺��� �̿��Ͽ� ��� �޿��� ����� �����ؼ� ��Ÿ���ÿ�
SELECT * FROM SALGRADE;
SELECT ENAME, E.SAL, GRADE, LOSAL, HISAL
FROM EMP E, SALGRADE S 
WHERE E.SAL BETWEEN S.LOSAL AND HISAL ORDER BY SAL;

-- ���� 6 : ��ǰ���̺��� ��� ��ǰ�� ���޾�ü, ī�װ���, ��ǰ��, ��ǰ�ǸŰ�
--         ������ ����ϼ���. ��, ���޾�ü�� ��ǰ ī�װ��� ���� ��ǰ��
--         ����մϴ�.(3�� ����)
SELECT * FROM PRODUCTS; --EP_CODE_FK
SELECT * FROM CATEGORY;
SELECT * FROM SUPPLY_COMP;  --EP_CODE

SELECT EP_CODE, EP_NAME, CATEGORY_NAME, PRODUCTS_NAME, OUTPUT_PRICE 
FROM PRODUCTS P RIGHT OUTER JOIN CATEGORY C
ON P.CATEGORY_FK=C.CATEGORY_CODE
LEFT OUTER JOIN SUPPLY_COMP S
ON P.EP_CODE_FK=S.EP_CODE;

SELECT EP_CODE, EP_NAME, CATEGORY_NAME, PRODUCTS_NAME, OUTPUT_PRICE 
FROM SUPPLY_COMP S RIGHT OUTER JOIN PRODUCTS P 
ON S.EP_CODE=P.EP_CODE_FK 
JOIN CATEGORY C 
ON  P.CATEGORY_FK=C.CATEGORY_CODE;

-- ���� 7 : SELF JOIN�� �̿��Ͽ� �ش� ��� �������� �����ȣ�� �˾Ƴ���
SELECT * FROM EMP;
SELECT E.EMPNO, E.ENAME, E.MGR, M.ENAME 
FROM EMP E JOIN EMP M 
ON E.MGR=M.EMPNO;


-- ���� 8 : emp���̺��� "������ �����ڴ� �����̴�"�� ������ ����ϼ���.
--         ex) "FORD�� �����ڴ� JOINES�Դϴ�"
SELECT E.ENAME||'�� �����ڴ� '||M.ENAME||'�Դϴ�'
FROM EMP E JOIN EMP M 
ON E.MGR=M.EMPNO;

-- ���� 9 : �Ʒ��� ����� ����ϴ� ������ �ۼ��ϼ���
--         (�����ڰ� ���� King�� �����Ͽ� ��� ����� ���)

	---------------------------------------------
  Employee	    Emp#	    Manager	    Mgr#
	---------------------------------------------
	KING		7839
	BLAKE		7698		KING		7839
	CKARK		7782		KING		7839
	.....
	---------------------------------------------
	14ROWS SELECTED.

SELECT * FROM EMP;

SELECT E.ENAME "Employee", E.EMPNO "Emp#", M.ENAME "Manager", E.MGR "Mgr#"
FROM EMP E LEFT OUTER JOIN EMP M
ON E.MGR=M.EMPNO;

-- ���� 10 : ���������� �̿��Ͽ� ������̺��� scott�� �޿����� ���� ����� �����ȣ,�̸�,���� �޿��� ����ϼ���.
SELECT EMPNO, ENAME, JOB
FROM EMP 
WHERE SAL>(SELECT SAL FROM EMP WHERE ENAME='SCOTT');


-- ���� 11 : ������̺��� �޿��� ��պ��� ���� ����� ���,�̸�,����,�޿�,�μ���ȣ�� ����ϼ���.
SELECT EMPNO, ENAME, JOB, SAL ,EMPNO
FROM EMP
WHERE SAL<(SELECT AVG(SAL) FROM EMP);

-- ���� 12 : ������̺��� ����� �޿��� 20�� �μ��� �ּұ޿����� 
--          ���� �μ��� �μ���ȣ�� �� �μ��� �ּұ޿��� ����ϼ���.
SELECT DEPTNO, MIN(SAL)
FROM EMP
GROUP BY DEPTNO HAVING MIN(SAL) > (SELECT MIN(SAL) FROM EMP WHERE DEPTNO=20);

-- ���� 13 : 

-- ���� 14 : 

-- ���� 15 : 




