-- 예제 1 : EMP테이블에서 이름과 연봉을 "KING: 1 YEAR SALARY = 60000" 형식으로 출력
SELECT ENAME||': 1 YEAR SALARY = '||(SAL*12+NVL(COMM,0))
FROM EMP;

-- 예제 2 : 학급.학급번호 = 학생.학급번호가 같으면 하나로 합쳐 순서대로 가져와서 출력해라
SELECT C.SNUM, SNAME, SROOM, TEL, ADDR, INDATE
FROM SCLASS C JOIN STUDENT T
JOIN C.SUM = T.SNUM_FK;


----------------------------------------------------------------------DAY02
-- 예제 1 : EMP테이블에서 급여가 3000 이상인 사원의 사원번호,이름, 담당업무,급여를 출력하세요.
SELECT EMPNO, ENAME, JOB, SAL
FROM EMP WHERE SAL>=3000;

-- 예제 2 : emp테이블에서 급여가 1300에서 1500사이의 사원의 이름,업무,급여,부서번호를 출력하세요.
SELECT ENAME, JOB, SAL, DEPTNO
FROM EMP WHERE SAL BETWEEN 1300 AND 1500;

-- 예제 3 : EMPNO가 7902, 7788, 7566인 사원의 정보를 출력하세요
SELECT * FROM EMP WHERE EMPNO IN(7902, 7788, 7566);

-- 예제 4 : 이름에 N이 들어가 있는 사원 출력
SELECT ENAME FROM EMP WHERE ENAME LIKE '%N%';

-- 예제 5 : 이름의 두번째에 I가 들어가 있는 사원 출력
SELECT ENAME FROM EMP WHERE ENAME LIKE '_I%';

