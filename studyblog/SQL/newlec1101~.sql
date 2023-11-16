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

------------------------------------------------------------------------11/15
--아이디 귀찮으니 시퀀스 만들기
create sequence notice_seq
start with 22 
increment by 1 
nocache;

insert into notice values(notice_seq.nextval, '11월 중순', '김일월', '아니 벌써?', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '11월 15일', '김이월', '프로젝트어떡하냐', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '날이 춥다', '강동구', '비대면인데', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '세탁기 돌려야돼', '강서구', '무슨 조를 자율로 짜라는겁니까ㅠ', sysdate, 0 ,'');

select * from notice;

insert into notice values(notice_seq.nextval, '닭강정 시켰다', '김영등포', '근데 배가 안고파', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '배가 안고파', '강남순', '프로젝트 걱정돼서 그런가', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '괜히 시켰나', '도봉순', '비대면인데', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '일단 공부부터 하자', '유광진', '무슨 조를 자율로 짜라는겁니까ㅠ', sysdate, 0 ,'');

insert into notice values(notice_seq.nextval, '노트북 수명이 다 해간다', '심삼성', '산 지 2년', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '배터리 왜이래', '김이월', 'ㅁ', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '갤럭시북', '강동구', 'ㅁ', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '다음엔 뭘로 사지', '강서구', 'ㅁ', sysdate, 0 ,'');

insert into notice values(notice_seq.nextval, '글을 몇개나 써야되냐', '서문구', 'ㄴ', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '60개는 써야하나', '이금천', 'ㄴ', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '겨울 싫다', '강동구', 'ㅁ', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '그래도 옷 사야지', '강서구', 'ㅁ', sysdate, 0 ,'');

insert into notice values(notice_seq.nextval, '이미 패딩 2개 삼', '기패딩', 'ㄴ', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '주말에 사주보러간다', '까치산', 'ㄴ', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '진로에 대해 여쭤봐야지', '심진로', 'ㅁ', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '질문 리스트 뽑아야겠다', '아이유', 'ㅁ', sysdate, 0 ,'');

insert into notice values(notice_seq.nextval, '뉴진스 귀여워..', '뉴진스', 'ㅁ', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '레드벨벳 신곡나왔다', '아이린', 'ㅁ', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '들어봐야지', '웬디', 'ㅁ', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '그치만 점점 속세에서 멀어지는 중', '슬기', 'ㅁ', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '근데 이렇게 감자인데 수료는 어케함', '전소미', 'ㄴ', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '나보다 감자도 있어라 제발....ㅠ', '권은비', 'ㄴ', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '남은 닭강정 먹으면서 콩콩팥팥이나 봐야지', '김우빈', 'ㅁ', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '에스파도 신곡나왔더라', '카리나', 'ㅁ', sysdate, 0 ,'');
    
select * from notice;
    
insert into notice values(notice_seq.nextval, '아이유 당신은 언제 새 곡 낼꺼야', '이지은', 'ㅁ', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '드라마 찍어줘 차라리', '이지금', 'ㅁ', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '그래서 시간이 없음', '윈터', 'ㅁ', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '이거 다 들으면 스프링 강의 들어야됨', '닝닝', 'ㅁ', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '근데 그래도 모자람', '지젤', 'ㄴ', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '당연함 맨날 그래야함', '수지', 'ㄴ', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '오늘 강의 10개 채워야 공부 끝남', '로제', 'ㅁ', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '저녁 7시 21분', '제니', 'ㅁ', sysdate, 0 ,'');

insert into notice values(notice_seq.nextval, '내일은 뭐먹냐', '박문대', 'ㅁ', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '웹툰보고싶다', '민지', 'ㅁ', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '현생이 슬픈 오타쿠..', '해린', 'ㅁ', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '오타쿠 티내지말자', '혜인', 'ㅁ', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '데뷔 못하면 죽는병 걸림 명작이잖아', '하니', 'ㄴ', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '당연함 맨날 그래야함', '다니엘', 'ㄴ', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '에휴', '로제', '유진', sysdate, 0 ,'');
insert into notice values(notice_seq.nextval, '텀블러 사고싶다', '미미', 'ㅁ', sysdate, 0 ,'');

commit;

-----댓글 기능
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










