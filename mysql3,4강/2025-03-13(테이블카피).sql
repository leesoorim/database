-- 테이블 카피 --
-- 1:1복사
create table post11 as select * from post1;

select count(*) from post11;


-- 부분 카피 --
create table post1_seoul as select * from post1 where p2 like '서울%';

-- 구조만 카피
create table post12 as select * from post1 where 1=2;

select * from post12;








