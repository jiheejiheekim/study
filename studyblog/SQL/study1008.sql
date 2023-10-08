select * from student;

--예제 1 : STUDENT1 테이블 생성 후 확인
CREATE TABLE STUDENT1 (
    NUM NUMBER(4) PRIMARY KEY,
    NAME VARCHAR2(20) NOT NULL,
    TEL VARCHAR2(20) NOT NULL,
    ADDR VARCHAR2(50),
    INDATE DATE DEFAULT SYSDATE,
    SNAME VARCHAR2(30), 
    SROOM NUMBER(3)
    );

--예제 2 :?STUDENT1에 1번 김고수 연락처알아서 주소인천 학급자바반 교실201호 데이터를 넣으세요
INSERT INTO STUDENT1 (NUM, NAME, TEL, ADDR, SNAME, SROOM)
VALUES (1, '김고수', '010-5555-7777', '인천', '자바반', 201);

DESC STUDENT;
-- 예제 3 : 데이터를 조회하세요
SELECT * FROM STUDENT1;

-- 예제 4 : 2번?이민기?연락처?수원?빅데이터반?301
INSERT INTO STUDENT1 (NUM, NAME, TEL, ADDR, SNAME, SROOM) 
VALUES (2, '이민기', '010-4456-0621', '수원', '빅데이터반', 301);

-- 예제 5 : 데이터를 저장하세요
COMMIT;

-- 예제 6 : 1번?학생의?학급명을?'파이썬반'으로?수정하세요
UPDATE STUDENT1 SET SNAME='파이썬반' WHERE NUM=1;
SELECT * FROM STUDENT1;

-- 예제 7 : 1번?김고수?학생의?데이터를?삭제하세요
DELETE FROM STUDENT1 WHERE NAME='김고수';

-- 예제 8 : 삭제했던 김고수 학생의 데이터를 되돌리세요
ROLLBACK;
