CREATE TABLE NOTICE (
    ID NUMBER,
    TITLE NVARCHAR2(100),
    WRITER_ID NVARCHAR2(50),
    CONTENT CLOB,
    REGDATE TIMESTAMP DEFAULT SYSTIMESTAMP,
    HIT NUMBER DEFAULT 0,
    FILES NVARCHAR2(1000)
);

DROP TABLE NOTICE;

CREATE TABLE "COMMENT" (
    ID NUMBER,
    CONTENT NVARCHAR2(2000),
    REGDATE TIMESTAMP,
    WRITER_ID NVARCHAR2(50),
    NOTICE_ID NUMBER
);

CREATE TABLE ROLE (
    ID VARCHAR2(50),
    DISCRIPTION NVARCHAR2(500)
);

CREATE TABLE MEMBER_ROLE (
    MEMBER_ID NVARCHAR2(50),
    ROLE_ID VARCHAR2(50)
);


INSERT INTO NOTICE VALUES(1, 'jdbc란 무엇인가?', 'newlec', 'aaa', SYSDATE, 0, '');
COMMIT;

-----------------------------------------------------------------------10/29
INSERT INTO NOTICE VALUES(2, 'jdbc란 무엇인가?', 'newlec', 'aaa', SYSDATE, 0, '');
INSERT INTO NOTICE VALUES(3, 'jdbc란 무엇인가?', 'newlec', 'aaa', SYSDATE, 0, '');
COMMIT;

select * from NOTICE;

-----------------------------------------------------------------------10/30
CREATE TABLE MEMBER (
    ID NVARCHAR2(50),
    PWD NVARCHAR2(50),
    NAME NVARCHAR2(50),
    GENDER NCHAR(2),
    BIRTHDAY CHAR(10),
    PHONE CHAR(13),
    REGDATE DATE,
    EMAIL VARCHAR2(200)
);

SELECT * FROM NOTICE ORDER BY ID DESC;

SELECT NOTICE_SEQ.NEXTVAL FROM DUAL;

INSERT INTO NOTICE (title, writer_id,content,files)
VALUES ('TEST', 'newlec', 'tset content', '');

SELECT * FROM NOTICE;

ROLLBACK;
COMMIT;

UPDATE NOTICE
SET
    TITLE ='테스트',
    CONTENT = '공부중',
    FILES = ''
WHERE ID=6;
ROLLBACK;

UPDATE NOTICE
SET
    ID=3
WHERE ID=9;

INSERT INTO NOTICE VALUES(8, 'jdbc란 무엇인가?', '뉴버지', 'aaa', SYSDATE, 0, '');
INSERT INTO NOTICE VALUES(9, 'jdbc공부', 'A', '뉴렉처최고', SYSDATE, 0, '');
INSERT INTO NOTICE VALUES(4, 'jdbc를', 'LAST', 'JDBC 얼른 끝내자', SYSDATE, 0, '');

SELECT * FROM NOTICE ORDER BY ID;

-----------------------------------------------------------------------10/31
select * from notice;

INSERT INTO NOTICE VALUES(7, '할 수 있다', 'right', 'best woman', SYSDATE, 0, '');
INSERT INTO NOTICE VALUES(8, '나는 잘 한다', 'good', 'good girl', SYSDATE, 0, '');
INSERT INTO NOTICE VALUES(9, '힘을 내자 화이팅', 'great', 'can you study with me', SYSDATE, 0, '');

delete from notice where id=5;
delete from notice where id=6;

update notice set id=5 where id=7;
update notice set id=6 where id=8;
update notice set id=7 where id=9;

INSERT INTO NOTICE VALUES(8, 'JDBC 뽀개기', 'rib', 'code', SYSDATE, 0, '');
INSERT INTO NOTICE VALUES(9, '슬슬 졸리다', 'goodsleep', 'youtube', SYSDATE, 0, '');
INSERT INTO NOTICE VALUES(10, '키보드 소리가 좋네', 'keyboard', '내일은 1일', SYSDATE, 0, '');
INSERT INTO NOTICE VALUES(11, '오늘은 10월의 마지막 날이에요', '1010', 'miss you october', SYSDATE, 0, '');

select * from notice;

select rownum, notice.* from notice
where rownum between 1 and 10; --잘 됨

select rownum, notice.* from notice
where rownum between 2 and 10; --잘 안됨 => 서브쿼리 이용

select * from 
(select rownum num, notice.* from notice order by regdate desc)
where num between 1 and 10; --잘 안됨

select * from 
    (select rownum num, n.* from
        (select * from notice order by regdate desc) n
    )
where num between 3 and 10;


