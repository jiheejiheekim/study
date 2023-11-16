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

------------------------------------------------------------------------11/15
--���̵� �������� ������ �����
create sequence notice_seq
start with 22 
increment by 1 
nocache;

insert into notice values(notice_seq.nextval, '11�� �߼�', '���Ͽ�', '�ƴ� ����?', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '11�� 15��', '���̿�', '������Ʈ��ϳ�', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '���� ���', '������', '�����ε�', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '��Ź�� �����ߵ�', '������', '���� ���� ������ ¥��°̴ϱ��', sysdate, 0 ,'');

select * from notice;

insert into notice values(notice_seq.nextval, '�߰��� ���״�', '�迵����', '�ٵ� �谡 �Ȱ���', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '�谡 �Ȱ���', '������', '������Ʈ �����ż� �׷���', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '���� ���׳�', '������', '�����ε�', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '�ϴ� ���κ��� ����', '������', '���� ���� ������ ¥��°̴ϱ��', sysdate, 0 ,'');

insert into notice values(notice_seq.nextval, '��Ʈ�� ������ �� �ذ���', '�ɻＺ', '�� �� 2��', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '���͸� ���̷�', '���̿�', '��', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '�����ú�', '������', '��', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '������ ���� ����', '������', '��', sysdate, 0 ,'');

insert into notice values(notice_seq.nextval, '���� ��� ��ߵǳ�', '������', '��', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '60���� ����ϳ�', '�̱�õ', '��', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '�ܿ� �ȴ�', '������', '��', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '�׷��� �� �����', '������', '��', sysdate, 0 ,'');

insert into notice values(notice_seq.nextval, '�̹� �е� 2�� ��', '���е�', '��', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '�ָ��� ���ֺ�������', '��ġ��', '��', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '���ο� ���� ���������', '������', '��', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '���� ����Ʈ �̾ƾ߰ڴ�', '������', '��', sysdate, 0 ,'');

insert into notice values(notice_seq.nextval, '������ �Ϳ���..', '������', '��', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '���座�� �Ű�Դ�', '���̸�', '��', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '��������', '����', '��', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '��ġ�� ���� �Ӽ����� �־����� ��', '����', '��', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '�ٵ� �̷��� �����ε� ����� ������', '���ҹ�', '��', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '������ ���ڵ� �־�� ����....��', '������', '��', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '���� �߰��� �����鼭 ���������̳� ������', '����', '��', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '�����ĵ� �Ű�Դ���', 'ī����', '��', sysdate, 0 ,'');
    
select * from notice;
    
insert into notice values(notice_seq.nextval, '������ ����� ���� �� �� ������', '������', '��', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '��� ����� ����', '������', '��', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '�׷��� �ð��� ����', '����', '��', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '�̰� �� ������ ������ ���� ���ߵ�', '�״�', '��', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '�ٵ� �׷��� ���ڶ�', '����', '��', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '�翬�� �ǳ� �׷�����', '����', '��', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '���� ���� 10�� ä���� ���� ����', '����', '��', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '���� 7�� 21��', '����', '��', sysdate, 0 ,'');

insert into notice values(notice_seq.nextval, '������ ���Գ�', '�ڹ���', '��', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '��������ʹ�', '����', '��', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '������ ���� ��Ÿ��..', '�ظ�', '��', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '��Ÿ�� Ƽ��������', '����', '��', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '���� ���ϸ� �״º� �ɸ� �������ݾ�', '�ϴ�', '��', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '�翬�� �ǳ� �׷�����', '�ٴϿ�', '��', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '����', '����', '����', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '�Һ� ���ʹ�', '�̹�', '��', sysdate, 0 ,'');

commit;

-----��� ���
create view notice_view
as
select  n.id, n.title, n.writer_id, n.regdate, n.hit, n.files, count(c.id) cmt_count
from notice n left join "COMMENT" c
on n.id=c.notice_id
group by n.id, n.title, n.writer_id, n.regdate, n.hit, n.files;
--order by n.id desc;


SELECT * FROM (
SELECT ROWNUM NUM, N.* 
FROM (SELECT * FROM NOTICE_VIEW WHERE TITLE LIKE '%%' ORDER BY ID DESC) N
)
WHERE NUM BETWEEN 1 AND 10;










