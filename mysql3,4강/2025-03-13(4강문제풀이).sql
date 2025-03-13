create table post1(
p1 varchar(6),
p2 varchar(100),
p3 varchar(100),
p4 varchar(100),
p5 varchar(100),
p6 varchar(100),
p7 varchar(100),
p8 varchar(100)
);

-- 1
select count(*) from post1;

-- 2 
select count(*) from post1 where p2 like '서울%';

-- 3
select * from post1 where p2 like '서울%' limit 10; -- 0번 ~ 9번
select * from post1 where p2 like '서울%' limit 10,10; -- 10 ~ 19
select * from post1 where p2 like '서울%' limit 20,10; -- 20 ~ 29 

-- 4
select * from post1 where p2 like '서울%' and p3 like '%서초구%';

-- 5
select * from post1 where p4 like '%양재%';

-- 6 양재동, distinct() :: 중복된 내용의 단일 출력
select distinct(p3) from post1 where p4 like '%양재동%';

-- 7
select * from post1 where p8 like '%달서구청%';

select count(*) from post1 where p8 like '%롯데캐슬%';

-- 8 구리시에서 동 이름만 출력
select distinct(p4) from post1 where p3 like '%구리%' ;

-- 9
select concat('[',p1,']',' ',p2,' ',p3,' ',p4,' ',p5,' ',p6,' ',p7,' ',p8) as '결과주소' from post1 where p1='306762';

-- 10 테이블 카피
create table post12 as select * from post1 where 1=2;


select * from post1;














