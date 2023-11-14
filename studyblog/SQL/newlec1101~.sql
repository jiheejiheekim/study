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

------------------------------------------------------------------------11/14
select * from notice;

--getNoticeList
SELECT ROWNUM, NOTICE.* FROM NOTICE ORDER BY REGDATE DESC;
--�������� ROWNUM�� ���Ұ�


--��� 1
SELECT * FROM (
    SELECT ROWNUM NUM, N.* 
    FROM (SELECT * FROM NOTICE ORDER BY REGDATE DESC) N
)
WHERE NUM BETWEEN 6 AND 10;
--���� ��¥ ���� �������� ���� �� N���� ��Ī�� ����, �� ���� ROWNUM ��밡��

--��� 2
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
--�ۼ����� ���̵�3���� �ۼ��Ϻ��� ū �Խñ��� ���̵� ���ϴ� ����

--�� ���忡�� 4���� ����
SELECT ID FROM NOTICE
WHERE REGDATE > (SELECT REGDATE FROM NOTICE WHERE ID=3)
AND ROWNUM=1;

--getPrevNotice
SELECT ID FROM (SELECT * FROM NOTICE ORDER BY REGDATE DESC) 
WHERE REGDATE < (SELECT REGDATE FROM NOTICE WHERE ID=3)
AND ROWNUM=1;



    