select * from 
    (select rownum num, n.* from
        (select * from notice order by regdate desc) n
    )
where num between 3 and 10;

insert into notice values(12, '������ 11���� ù ��', 'november', '������ 11�� ����', sysdate, 0 ,'');
insert into notice values(13, '��ȹ �� �����ϱ�', 'plan', '��� �ؾߵ�', sysdate, 0 ,'');
insert into notice values(14, 'ex', 'exercise', '����� �Ա�����', sysdate, 0 ,'');
insert into notice values(15, '�౹�� ���ߵ�', 'medi', '������', sysdate, 0 ,'');
insert into notice values(16, '���� 50% ����', 'fighting', '������ �� �ؾߵ�', sysdate, 0 ,'');
commit;
select * from notice;



select * from 
    (select rownum num, n.* from
        (select * from notice order by regdate desc) n
    )
where num between 3 and 10;


--view ����
create view notice_view
as
select * from 
    (select rownum num, n.* from
        (select * from notice order by regdate desc) n
    );
    
select * from notice_view 
where num between 11 and 20;
    
select count(id) count from notice;

insert into notice values(17, '������ 11���� ù ��', 'november', '������ 11�� ����', sysdate, 0 ,'');
insert into notice values(18, '��ȹ �� �����ϱ�', 'plan', '��� �ؾߵ�', sysdate, 0 ,'');
insert into notice values(19, 'ex', 'exercise', '����� �Ա�����', sysdate, 0 ,'');
insert into notice values(20, '�౹�� ���ߵ�', 'medi', '������', sysdate, 0 ,'');
insert into notice values(21, '���� 50% ����', 'fighting', '������ �� �ؾߵ�', sysdate, 0 ,'');


    