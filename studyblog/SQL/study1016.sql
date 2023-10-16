--예제 1 : 사원테이블에서 입사일자 순으로 정렬하여 사번,이름,업무,급여, 입사일자를 출력하세요.(오름차순)
SELECT EMPNO, ENAME, JOB, SAL, HIREDATE 
FROM EMP ORDER BY HIREDATE ASC;

--예제 2 : 상품 테이블에서 판매 가격이 비싼 순서대로 상품을 정렬해서 보여주세요.
SELECT * FROM PRODUCTS
ORDER BY OUTPUT_PRICE DESC;

--예제 3 : 고객 테이블에서 직업의 종류와 각 직업에 속한 사람의 수가 
-- 	      많은 순서대로 보여주세요.
SELECT JOB, COUNT(*) FROM MEMBER
GROUP BY JOB ORDER BY COUNT(*) DESC;

SELECT JOB, COUNT(*) FROM MEMBER
GROUP BY JOB ORDER BY 2 DESC;

-- 예제 4 : 상품테이블에서 공급업체코드별로 평균판매가 AVG(컬럼명)를 구하되 평균판매가 오름차순으로
SELECT EP_CODE_FK, AVG(OUTPUT_PRICE) FROM PRODUCTS 
GROUP BY EP_CODE_FK ORDER BY AVG(OUTPUT_PRICE) ASC;

-- 예제 5 : 문장을 소문자로만, 대문자로만 출력
SELECT LOWER('Hi My Name Is SunnY'), UPPER('Hi My Name Is SunnY') FROM DUAL;

-- 예제 6 : 
SELECT ENAME, INITCAP(ENAME) FROM EMP;

-- 예제 7 : MY NUMBER IS 와 12345를 결합
SELECT CONCAT('MY NUMBER IS ',12345) FROM DUAL;

-- 예제 8 : HIEVERYONE에서 4번째부터 3개의 문자열을 추출하세요
SELECT SUBSTR('HIEVERYONE', 4, 3) FROM DUAL;

-- 예제 9 : 주민번호 뒷자리를 출력하세요
SELECT SUBSTR('990322-2084687',-7) FROM DUAL;

-- 예제 10 :
SELECT LENGTH('990322-2084687') FROM DUAL;

-- 예제 11 : 사원 테이블에서 사원 이름의 첫글자가 'K'보다 크고 'Y'보다 작은 사원의
--	       사번,이름,업무,급여를 출력하세요. 단 이름순으로 정렬하세요.
SELECT EMPNO, ENAME, JOB, SAL
FROM EMP 
WHERE SUBSTR(ENAME,1,1)>'K' AND SUBSTR('ENAME',1,1)<'Y' ORDER BY ENAME ASC;

-- 예제 12 : ENAME 전체를 15자리로 놓고 공백은 왼쪽과 오른쪽으로 *를 채움
SELECT LPAD(ENAME, 15, '*'), RPAD(ENAME, 15, '*') FROM EMP;

-- 예제 13 : 'AAAAPPLEAA'의 A를 각각 왼쪽/ 오른쪽 기준해서 지우세요
SELECT LTRIM('AAA APPLE AA','A'), RTRIM('AAA APPLE AA','A') FROM DUAL;

-- 예제 14 : 'GOOD AND GREAT'에서 'GOOD'을 'GOOOOD'로 대체
SELECT REPLACE('GOOD AND GREAT', 'GOOD', 'GOOOOD') FROM DUAL;

-- 예제 14 : 고객 테이블 주소에서 부산시를 부산광역시로 수정하세요
SELECT * FROM MEMBER;
UPDATE MEMBER SET ADDR=(REPLACE(ADDR, '부산시', '부산광역시'))
WHERE ADDR LIKE '부산시%';
ROLLBACK;

-- 예제 15 : 

