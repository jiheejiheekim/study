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

