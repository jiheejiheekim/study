--���� 1 : ������̺��� �Ի����� ������ �����Ͽ� ���,�̸�,����,�޿�, �Ի����ڸ� ����ϼ���.(��������)
SELECT EMPNO, ENAME, JOB, SAL, HIREDATE 
FROM EMP ORDER BY HIREDATE ASC;

--���� 2 : ��ǰ ���̺��� �Ǹ� ������ ��� ������� ��ǰ�� �����ؼ� �����ּ���.
SELECT * FROM PRODUCTS
ORDER BY OUTPUT_PRICE DESC;

--���� 3 : �� ���̺��� ������ ������ �� ������ ���� ����� ���� 
-- 	      ���� ������� �����ּ���.
SELECT JOB, COUNT(*) FROM MEMBER
GROUP BY JOB ORDER BY COUNT(*) DESC;

SELECT JOB, COUNT(*) FROM MEMBER
GROUP BY JOB ORDER BY 2 DESC;

-- ���� 4 : ��ǰ���̺��� ���޾�ü�ڵ庰�� ����ǸŰ� AVG(�÷���)�� ���ϵ� ����ǸŰ� ������������
SELECT EP_CODE_FK, AVG(OUTPUT_PRICE) FROM PRODUCTS 
GROUP BY EP_CODE_FK ORDER BY AVG(OUTPUT_PRICE) ASC;

-- ���� 5 : ������ �ҹ��ڷθ�, �빮�ڷθ� ���
SELECT LOWER('Hi My Name Is SunnY'), UPPER('Hi My Name Is SunnY') FROM DUAL;

-- ���� 6 : 
SELECT ENAME, INITCAP(ENAME) FROM EMP;

-- ���� 7 : MY NUMBER IS �� 12345�� ����
SELECT CONCAT('MY NUMBER IS ',12345) FROM DUAL;

-- ���� 8 : HIEVERYONE���� 4��°���� 3���� ���ڿ��� �����ϼ���
SELECT SUBSTR('HIEVERYONE', 4, 3) FROM DUAL;

-- ���� 9 : �ֹι�ȣ ���ڸ��� ����ϼ���
SELECT SUBSTR('990322-2084687',-7) FROM DUAL;

-- ���� 10 :
SELECT LENGTH('990322-2084687') FROM DUAL;

-- ���� 11 : ��� ���̺��� ��� �̸��� ù���ڰ� 'K'���� ũ�� 'Y'���� ���� �����
--	       ���,�̸�,����,�޿��� ����ϼ���. �� �̸������� �����ϼ���.
SELECT EMPNO, ENAME, JOB, SAL
FROM EMP 
WHERE SUBSTR(ENAME,1,1)>'K' AND SUBSTR('ENAME',1,1)<'Y' ORDER BY ENAME ASC;

-- ���� 12 : ENAME ��ü�� 15�ڸ��� ���� ������ ���ʰ� ���������� *�� ä��
SELECT LPAD(ENAME, 15, '*'), RPAD(ENAME, 15, '*') FROM EMP;

-- ���� 13 : 'AAAAPPLEAA'�� A�� ���� ����/ ������ �����ؼ� ���켼��
SELECT LTRIM('AAA APPLE AA','A'), RTRIM('AAA APPLE AA','A') FROM DUAL;

-- ���� 14 : 'GOOD AND GREAT'���� 'GOOD'�� 'GOOOOD'�� ��ü
SELECT REPLACE('GOOD AND GREAT', 'GOOD', 'GOOOOD') FROM DUAL;

-- ���� 14 : �� ���̺� �ּҿ��� �λ�ø� �λ걤���÷� �����ϼ���
SELECT * FROM MEMBER;
UPDATE MEMBER SET ADDR=(REPLACE(ADDR, '�λ��', '�λ걤����'))
WHERE ADDR LIKE '�λ��%';
ROLLBACK;

-- ���� 15 : 

