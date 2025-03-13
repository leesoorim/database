create table stdscore(
no int not null auto_increment,
id varchar(50) not null,
loc varchar(100) not null,
kor tinyint unsigned default 0,
eng tinyint unsigned default 0,
primary key(no)
);
            
select * from stdscore;
/*
update stdscore set loc='서울' where loc='1';
update stdscore set loc='대구' where loc='2';
update stdscore set loc='원주' where loc='3';
update stdscore set loc='전주' where loc='4';*/
-- truncate table stdscore; -- 테이블 초기화
-- (1)
select eng from stdscore order by eng desc;
select * from stdscore order by id asc; -- a ~ z
select * from stdscore order by id desc; -- z ~ a
-- (2)
select max(eng) as '영어 최고점' from stdscore;
-- (3)
select avg(eng) as '영어평균' from stdscore;
-- round 반올림
select round(avg(eng),2) as '영어평균' from stdscore;
select round((eng+kor)/2,2) as '평균' from stdscore where id='spring7';

-- (4)
select * from stdscore where kor<60;

-- (5)
select * from stdscore where kor>=60 and eng>=60;

-- (6)
select * from stdscore where kor<60 or eng<60;

-- (6-1) 평균이 60 이상인 학생들 출력
select id,(eng+kor)/2 as 'avg' from stdscore where (kor+eng/2)>=60;

-- (7)
select id,eng from stdscore order by eng desc limit 5;

-- (8) 6 ~ 10등
select id,eng from stdscore order by eng desc limit 5,5;

select * from stdscore limit 0,5; -- 기본(0번은 생략가능)
select * from stdscore limit 5;
select * from stdscore limit 7,7; -- 7번부터 7개 출력
select * from stdscore limit 10,5; -- 10번부터 5개 출력

-- (10) 'spring7'의 영어점수를 +10 해준다.
update stdscore set eng=eng+10 where id='spring7'; 
-- 무조건 90점으로 만들겠다.
update stdscore set eng=90 where id='spring7'; 

-- spring7의 정보 변경(구리, 80, 70)
update stdscore set eng=70,
					kor=80,
                    loc='구리'
				where id='spring7';

-- (9) 1등의 정보(아이디,총합점수)
select * from stdscore order by (eng+kor) desc limit 0,1;
-- -------------------------------
select * from stdscore where (eng+kor)=(select max(eng+kor) from stdscore);
-- --------------------------------
select max(eng+kor) from stdscore;

-- (11)
select * from stdscore where loc='대구';

-- (12)
select count(*) from stdscore where loc='대구';

-- (13)
select id,eng from stdscore where loc='대구' and eng=(select max(eng) from stdscore where loc='대구');
-- ------------------------------------------
select max(eng) from stdscore where loc='대구';

-- (14)
select id,(eng+kor) as '총점' from stdscore where loc='대구' and eng+kor=(select max(eng+kor) from stdscore
 where loc='대구') ;

-- --------------------------------------------------
update stdscore set loc='서울특별시 강남구' where loc='서울';
update stdscore set loc='대구광역시 수성구' where loc='대구';
update stdscore set loc='강원도 원주시' where loc='원주';
update stdscore set loc='전라북도 전주시' where loc='전주';
update stdscore set loc='구리시 수택동' where loc='구리';

-- ----검색 (LIKE) => % : 임의의 문자열(이 올수도 있고 안 올수도 있다)
-- "수성구"라는 단어가 들어가 있는 주소
select * from stdscore where loc like '%수성구%';
-- "수택"이라는 단어가 들어가 있는 주소
select * from stdscore where loc like '%수택%';

-- "강원"이라는 단어로 시작하는 주소를 검색한다.
select * from stdscore where loc like '강원%';

-- "원주시"라는 단어로 끝나는 주소를 검색한다.
select * from stdscore where loc like '%원주시';

-- "st"로 시작하는 아이디를 검색한다.
select * from stdscore where id like 'st%';

-- "st"로 시작하는 아이디를 검색한다. (정확하게 5자리인 값)
select * from stdscore where id like 'st%' and length(id)=5;

-- --------------------------------------
select count(*) as '대구학생수' from stdscore where loc like '%대구%';
select avg(eng) from stdscore where loc like '강원도%';






-- 행번호(index번호) 존재 (출력 안됨)
select * from stdscore;



