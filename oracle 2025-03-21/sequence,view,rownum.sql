create sequence nboard_seq
increment by 1      -- 증감요건
start with 1        -- 시작값
maxvalue 999999;    -- 마지막값(최대값)
-- --------------------------------
create table nboard(
seqid number not null primary key,
title varchar2(100) not null,
pass varchar2(100) not null,
name varchar2(20),
hits number default 0,
content varchar2(4000),
rdate timestamp,    -- 등록날짜
udate timestamp     -- 업데이트날짜 (변경일,최종일)
);
-- ------------------------------------
insert into nboard(SEQID ,TITLE,PASS,NAME,HITS,CONTENT,RDATE,UDATE) 
     values(nboard_seq.nextval,'abc1','1111','홍길동','0','aaa1112',sysdate,'');
     
insert into nboard(SEQID ,TITLE,PASS,NAME,HITS,CONTENT,RDATE,UDATE) 
     values(nboard_seq.nextval,'abc2','1111','홍길동22','0','bbbb',sysdate,'');
     
insert into nboard(SEQID ,TITLE,PASS,NAME,HITS,CONTENT,RDATE,UDATE) 
     values(nboard_seq.nextval,'abc3','1111','홍길동33','0','cccc',sysdate,'');
     
insert into nboard(SEQID ,TITLE,PASS,NAME,HITS,CONTENT,RDATE,UDATE) 
     values(nboard_seq.nextval,'abc4','1111','홍길동44','0','dddd',sysdate,'');
     
insert into nboard(SEQID ,TITLE,PASS,NAME,HITS,CONTENT,RDATE,UDATE) 
     values(nboard_seq.nextval,'abc5','1111','홍길동55','0','eeee',sysdate,'');
     
insert into nboard(SEQID ,TITLE,PASS,NAME,HITS,CONTENT,RDATE,UDATE) 
     values(nboard_seq.nextval,'abc6','1111','홍길동66','0','ffff',sysdate,'');
     
insert into nboard(SEQID ,TITLE,PASS,NAME,HITS,CONTENT,RDATE,UDATE) 
     values(nboard_seq.nextval,'abc7','1111','홍길동77','0','gggg',sysdate,'');
     
insert into nboard(SEQID ,TITLE,PASS,NAME,HITS,CONTENT,RDATE,UDATE) 
     values(nboard_seq.nextval,'abc8','1111','떡볶이','0','맛있음',sysdate,'');
     
insert into nboard(SEQID ,TITLE,PASS,NAME,HITS,CONTENT,RDATE,UDATE) 
     values(nboard_seq.nextval,'abc9','1111','라면','0','iiii',sysdate,'');
     
insert into nboard(SEQID ,TITLE,PASS,NAME,HITS,CONTENT,RDATE,UDATE) 
     values(nboard_seq.nextval,'abc10','1111','만두','0','jjjj',sysdate,'');
     
insert into nboard(SEQID ,TITLE,PASS,NAME,HITS,CONTENT,RDATE,UDATE) 
     values(nboard_seq.nextval,'abc11','1111','호떡','0','kkkk',sysdate,'');
     
insert into nboard(SEQID ,TITLE,PASS,NAME,HITS,CONTENT,RDATE,UDATE) 
     values(nboard_seq.nextval,'abc12','1111','만수르','0','llll',sysdate,'');

commit;

select nboard_seq.nextval from dual;
select nboard_seq.currval from dual;

     
insert into nboard(SEQID ,TITLE,PASS,NAME,HITS,CONTENT,RDATE,UDATE) 
     values(nboard_seq.nextval,'dasasa','1111','만수르','0','llll',sysdate,'');

-- 2
select seqid,title,name,hits,rdate from nboard;

-- 2풀이
select seqid
      ,title
      ,name
      ,hits
      ,to_char(rdate,'yyyy-mm-dd') rdate 
from nboard 
order by seqid desc;

-- 3
select seqid,title,name,content,hits,to_char(rdate,'yyyy-mm-dd'),to_char(udate,'yyyy-mm-dd') from nboard where seqid=29;

-- 4
update nboard set hits=hits+1 where seqid=29;

-- 5
update nboard set title='맛있는거', -- user
                  name='나'        -- user
                  ,content='치킨'   -- user
                  ,udate=sysdate   -- system
    where seqid=26          -- system
    and pass='1111';        -- user

-- 6
delete from nboard where seqid=28 and pass=1111;

-- 7
select seqid
      ,title
      ,name
      ,hits
      ,to_char(rdate,'yyyy-mm-dd') rdate 
from nboard 
where title like 'a%'
order by seqid desc;

-- 8
select b.* from(
    select rownum rn,a.* from(
        select seqid
              ,title
              ,name
              ,hits
              ,to_char(rdate,'yyyy-mm-dd') rdate 
        from nboard 
        order by seqid desc)a ) b 
       -- where rn>=1 and rn<=10; -- 1페이지
        where rn>=11 and rn<=20; -- 2페이지
       -- where rn>=21 and rn<=30; -- 3페이지
       
-- 뷰처리   
create view v_nboardList as 
select b.* from(
    select rownum rn,a.* from(
        select seqid
              ,title
              ,name
              ,hits
              ,to_char(rdate,'yyyy-mm-dd') rdate 
        from nboard 
        order by seqid desc)a ) b 
        
-- 뷰를 이용한 처리
select * from v_nboardList where rn>=1 and rn<=10;

select * from nboard;












