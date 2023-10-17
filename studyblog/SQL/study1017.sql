-- ���� 1 : ����, 3�� ��, 3�� �� ��¥�� ���
SELECT SYSDATE "����", SYSDATE+3 "3����", SYSDATE-3 "3����" FROM DUAL;

-- ���� 2 : 23�� 9�� 23�ϰ� ����(23�� 10�� 17��) ������ �ϼ���?
SELECT CEIL(TO_DATE('23/09/23','YY/MM/DD')-SYSDATE) FROM DUAL;

-- ���� 3 : ���� 23�� 10�� 17�� �ð��� 9�� 44���̴�. 3�ð� �ĸ� ���
SELECT TO_CHAR(SYSDATE+ 3/24,'YY/MM/DD HH:MI:SS') FROM DUAL;

-- ���� 4 : �����̺���?������ڸ�?0000-00-00?��?���·�?����ϼ���.
SELECT TO_CHAR(REG_DATE, 'YYYY-MM-DD') FROM MEMBER;

-- ���� 5 : �����̺� �ִ� �� ���� �� ������ڰ� 2013�� 5��1�Ϻ��� ���� ������ ����ϼ���. 
--         ��, ����� ������ ��, ���� ���̵��� �մϴ�.
SELECT * FROM MEMBER;
SELECT NUM, NAME, TO_CHAR(REG_DATE, 'YYYY-MM') FROM MEMBER WHERE REG_DATE > '13/05/01';

-- ���� 6 : 1000000���� ��ǥ�� ����Ͽ� ���
SELECT TO_CHAR(1000000, '9,999,999') FROM DUAL;
SELECT TO_CHAR(25000, '$99G999') FROM DUAL;

-- ���� 7 : '$30,000'���� 2�� ���� ���� ���� ����($00,000)���� ����ϼ���
SELECT TO_CHAR(TO_NUMBER('$30,000','$99,999')*2, '$99,999') FROM DUAL;

-- ���� 8 : EMP����?�Ի�⵵��?�Ի���?�������?���ϰ� ���� ���� ������?����ϼ���
SELECT TO_CHAR(HIREDATE, 'YY') YY, COUNT(*) COUNT FROM EMP GROUP BY TO_CHAR(HIREDATE, 'YY') ORDER BY  1 ASC;

-- ���� 9 : �� ���̺��� ������ ����, �� ������ ���� �ִ� ���ϸ��� ������ �����ּ���.
SELECT JOB, MAX(MILEAGE) FROM MEMBER GROUP BY JOB;
