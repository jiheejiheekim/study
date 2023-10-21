-- 예제 1 : 고객 테이블에서 직업의 종류와 각 직업에 속한 최대 마일리지 정보를 보여주세요.
--         단, 직업군의 최대 마일리지가 0인 경우는 제외시킵시다.
SELECT JOB, MAX(MILEAGE) FROM MEMBER
GROUP BY JOB HAVING MAX(MILEAGE)<>0;

-- 예제 2 : 상품 테이블에서 각 공급업체 코드별로 상품 판매가의 평균값 중 단위가 100단위로 떨어
--	       지는 항목의 정보를 보여주세요.
SELECT * FROM PRODUCTS;

SELECT EP_CODE_FK, AVG(OUTPUT_PRICE) 
FROM PRODUCTS
GROUP BY EP_CODE_FK 
HAVING MOD(AVG(OUTPUT_PRICE),100)=0;

-- 예제 3 : JOB이 'CLERK'이면 급여인상을 15%, SALESMAN=>10%, MANAGER->5%, ANALYST=>3%를 인상한 급여액을
--         사원명, 업무, 급여액, 인상액 을 함께 보여주세요
SELECT ENAME, JOB, SAL,  
DECODE(JOB, 'CLERK',SAL*1.15, 'SALESMAN',SAL*1.1, 'MANAGER',SAL*1.05, 'ANALYST',SAL*1.03, SAL) SALINCREASE
FROM EMP;


-- 예제 4 : EMP에서 사번, 사원명, 업무, 보너스를 함께 출력하되
--    보너스(COMM)이 NULL일 경우는 그 옆에 '해당사항 없음',
--    COMM이 0인 경우는 '보너스 없음',
--    COMM이 0보다 큰 경우는 '보너스 있음'을 함께 출력하세요
--    컬럼명은 "보너스 수령 여부"
SELECT EMPNO, ENAME, JOB, COMM, 
CASE
    WHEN COMM IS NULL THEN '해당사항 없음'
    WHEN COMM=0 THEN '보너스 없음'
    WHEN COMM>0 THEN '보너스 있음 : '||COMM
    ELSE ''
END "보너스 수령 여부"
FROM EMP;

-- 예제 5 :  급여에 순위를 두어 1등부터 끝까지 순서대로 출력하세요
SELECT RANK() OVER(ORDER BY SAL DESC) RANKING, EMP.* FROM EMP; 

-- 예제 6 : 급여 제일많은 TOP3만 가져와 보여주세요
SELECT * FROM (SELECT RANK() OVER(ORDER BY SAL DESC) RANKING, EMP.* FROM EMP) WHERE RANKING<4;

-- 예제 7 : 입사일을 최근에 입사한 순으로 나열
SELECT RANK()OVER(ORDER BY HIREDATE DESC) RANKING, EMP.* FROM EMP;

-- 예제 8 : 8번째~13번째로 일찍 입사한 사람을 구하세요
SELECT * FROM
(SELECT ROW_NUMBER() OVER(ORDER BY HIREDATE DESC) RANKING, EMP.* FROM EMP) WHERE RANKING BETWEEN 8 AND 13;

-------------------------------------------------------------10/21
-- 예제 1 : 입사일이 최근인 사람부터 번호를 부여하고 최근 입사자 3번부터 8번까지를 출력하세요
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
    
-- 예제 1 : SALESMAN의 사원번호,이름,급여,부서명,근무지를 출력하여라.
SELECT EMPNO, ENAME, SAL, DNAME, LOC 
FROM EMP E JOIN DEPT D 
ON E.DEPTNO = D.DEPTNO AND JOB='SALESMAN';

-- 예제 2 : 서로 연관이 있는 카테고리 테이블과 상품 테이블을 이용하여 각 상품별로 카테고리
--         이름과 상품 이름을 함께 보여주세요.
SELECT * FROM PRODUCTS;
SELECT * FROM CATEGORY;

SELECT CATEGORY_CODE, CATEGORY_NAME, PRODUCTS_NAME 
FROM CATEGORY C, PRODUCTS P
WHERE C.CATEGORY_CODE = P.CATEGORY_FK;

-- 예제 3 : 카테고리 테이블과 상품 테이블을 조인하여 화면에 출력하되 상품의 정보 중
--         제조업체가 삼성인 상품의 정보만 추출하여 카테고리 이름과 상품이름, 상품가격
--         제조사 등의 정보를 화면에 보여주세요.
SELECT * FROM PRODUCTS;
SELECT * FROM CATEGORY;

SELECT CATEGORY_NAME, PRODUCTS_NAME, OUTPUT_PRICE, COMPANY
FROM CATEGORY C JOIN PRODUCTS P
ON C.CATEGORY_CODE = P.CATEGORY_FK AND P.COMPANY='삼성';

-- 예제 4 : 각 상품별로 카테고리 및 상품명, 가격을 출력하세요. 단 카테고리가 'TV'인 것은 
--         제외하고 나머지 정보는 상품의 가격이 저렴한 순으로 정렬하세요.
SELECT CATEGORY_NAME, PRODUCTS_NAME, OUTPUT_PRICE 
FROM CATEGORY C JOIN PRODUCTS P
ON C.CATEGORY_CODE = P.CATEGORY_FK WHERE CATEGORY_NAME<>'TV' ORDER BY OUTPUT_PRICE ASC;

-- 예제 5 : 

-- 예제 6 : 

-- 예제 7 : 

-- 예제 8 : 




