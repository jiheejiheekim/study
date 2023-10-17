-- 예제 1 : 오늘, 3일 후, 3일 전 날짜를 출력
SELECT SYSDATE "오늘", SYSDATE+3 "3일후", SYSDATE-3 "3일전" FROM DUAL;

-- 예제 2 : 23년 9월 23일과 오늘(23년 10월 17일) 사이의 일수는?
SELECT CEIL(TO_DATE('23/09/23','YY/MM/DD')-SYSDATE) FROM DUAL;

-- 예제 3 : 현재 23년 10월 17일 시각은 9시 44분이다. 3시간 후를 출력
SELECT TO_CHAR(SYSDATE+ 3/24,'YY/MM/DD HH:MI:SS') FROM DUAL;

-- 예제 4 : 고객테이블의?등록일자를?0000-00-00?의?형태로?출력하세요.
SELECT TO_CHAR(REG_DATE, 'YYYY-MM-DD') FROM MEMBER;

-- 예제 5 : 고객테이블에 있는 고객 정보 중 등록일자가 2013년 5월1일보다 늦은 정보를 출력하세요. 
--         단, 고객등록 정보는 년, 월만 보이도록 합니다.
SELECT * FROM MEMBER;
SELECT NUM, NAME, TO_CHAR(REG_DATE, 'YYYY-MM') FROM MEMBER WHERE REG_DATE > '13/05/01';

-- 예제 6 : 1000000원을 쉼표를 사용하여 출력
SELECT TO_CHAR(1000000, '9,999,999') FROM DUAL;
SELECT TO_CHAR(25000, '$99G999') FROM DUAL;

-- 예제 7 : '$30,000'값의 2배 값을 구해 같은 형식($00,000)으로 출력하세요
SELECT TO_CHAR(TO_NUMBER('$30,000','$99,999')*2, '$99,999') FROM DUAL;

-- 예제 8 : EMP에서?입사년도별?입사한?사원수를?구하고 빠른 연도 순으로?출력하세요
SELECT TO_CHAR(HIREDATE, 'YY') YY, COUNT(*) COUNT FROM EMP GROUP BY TO_CHAR(HIREDATE, 'YY') ORDER BY  1 ASC;

-- 예제 9 : 고객 테이블에서 직업의 종류, 각 직업에 속한 최대 마일리지 정보를 보여주세요.
SELECT JOB, MAX(MILEAGE) FROM MEMBER GROUP BY JOB;
