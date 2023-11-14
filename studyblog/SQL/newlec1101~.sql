select * from 
    (select rownum num, n.* from
        (select * from notice order by regdate desc) n
    )
where num between 3 and 10;

insert into notice values(12, '오늘은 11월의 첫 날', 'november', '힘차게 11월 시작', sysdate, 0 ,'');
insert into notice values(13, '계획 다 이행하기', 'plan', '운동도 해야돼', sysdate, 0 ,'');
insert into notice values(14, 'ex', 'exercise', '저녁밥 먹기전에', sysdate, 0 ,'');
insert into notice values(15, '약국도 가야됨', 'medi', '귀찮다', sysdate, 0 ,'');
insert into notice values(16, '수료 50% 남음', 'fighting', '하지만 다 해야돼', sysdate, 0 ,'');
commit;
select * from notice;



select * from 
    (select rownum num, n.* from
        (select * from notice order by regdate desc) n
    )
where num between 3 and 10;


--view 생성
create view notice_view
as
select * from 
    (select rownum num, n.* from
        (select * from notice order by regdate desc) n
    );
    
select * from notice_view 
where num between 11 and 20;
    
select count(id) count from notice;

insert into notice values(17, '오늘은 11월의 첫 날', 'november', '힘차게 11월 시작', sysdate, 0 ,'');
insert into notice values(18, '계획 다 이행하기', 'plan', '운동도 해야돼', sysdate, 0 ,'');
insert into notice values(19, 'ex', 'exercise', '저녁밥 먹기전에', sysdate, 0 ,'');
insert into notice values(20, '약국도 가야됨', 'medi', '귀찮다', sysdate, 0 ,'');
insert into notice values(21, '수료 50% 남음', 'fighting', '하지만 다 해야돼', sysdate, 0 ,'');

------------------------------------------------------------------------11/14
select * from notice;

--getNoticeList
SELECT ROWNUM, NOTICE.* FROM NOTICE ORDER BY REGDATE DESC;
--역순으로 ROWNUM됨 사용불가


--방법 1
SELECT * FROM (
    SELECT ROWNUM NUM, N.* 
    FROM (SELECT * FROM NOTICE ORDER BY REGDATE DESC) N
)
WHERE NUM BETWEEN 6 AND 10;
--먼저 날짜 내림 차순으로 정렬 후 N으로 별칭을 붙임, 그 다음 ROWNUM 사용가능

--방법 2
SELECT * FROM (
    SELECT ROW_NUMBER() OVER (ORDER BY REGDATE DESC) NUM,
    NOTICE.* FROM NOTICE
    )
WHERE NUM BETWEEN 6 AND 10;







--getNoticeCount



--getNextNotice

SELECT * FROM NOTICE
WHERE ID= (
    SELECT ID FROM NOTICE WHERE 
);

SELECT ID FROM NOTICE
WHERE REGDATE > (SELECT REGDATE FROM NOTICE WHERE ID=3);
--작성일이 아이디3번의 작성일보다 큰 게시글의 아이디를 구하는 문장

--위 문장에서 4번만 나옴
SELECT ID FROM NOTICE
WHERE REGDATE > (SELECT REGDATE FROM NOTICE WHERE ID=3)
AND ROWNUM=1;

--getPrevNotice
SELECT ID FROM (SELECT * FROM NOTICE ORDER BY REGDATE DESC) 
WHERE REGDATE < (SELECT REGDATE FROM NOTICE WHERE ID=3)
AND ROWNUM=1;



    