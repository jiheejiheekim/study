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


    