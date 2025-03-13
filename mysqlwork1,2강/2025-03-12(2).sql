/*create table typeTest(
a1 char(20), 	-- 고정길이 : 고정크기설정 - 작은데이터 입력 시에도 설정 크기가 그대로 세팅됨(공간낭비)
				-- 255(최대)
a2 varchar(20),	-- 가변길이 : 최대크기설정 - 작은데이터 입력 시에 그 크기만큼 공간이 확보됨
				-- 최대공간크기 : 65300
                -- 5.x 버전 : 255(최대), 8.x : 65300
a3 text,		-- 가변길이 : 65300으로 크기가 고정됨
a4 tinyint,		-- -128 ~ 127
a5 int,
a6 double,
a7 date,
a8 datetime,
a9 enum('M','F'),
a10 set('a','b','c','d'));*/

-- (1)
insert into typeTest values('aa1','aa2','aa3',10,10,10,'2025-03-12','2025-03-12 10:35:30','M','a');
select * from typeTest;

insert into typeTest values('aa1','aa2','aa3',127,300,10.123,'2025/03/12','2025-03-12','F','b');
-- 테이블 구조 변경
alter table typeTest modify a1 char(5);
alter table typeTest modify a2 varchar(5);

insert into typeTest values('12345','abcde','aa3',127,300,10.123,'2025/03/12','2025-03-12','F','b');

-- 정상 입력 : 정수타입에 실수값을 넣었을 경우 (자동)정수형으로 변환됨
insert into typeTest values('111','222','aa3',77.123,77.123,77.123,'2025-03-12','2025-03-12','F','b');

-- 정상 입력
insert into typeTest values('3434','bbb','aa3',77.123,77.123,77.123,'2025-03-12','2025-03-12','f','b');

-- 오류 발생 :
insert into typeTest values('444','ccc','aa3',77.123,77.123,77.123,'2025-03-12','2025-03-12','F','Z');

-- 오류 발생 :
insert into typeTest values('444','ccc','aa3',77.123,77.123,77.123,'2025-03-12','2025-03-12','M,F','Z');

-- 정상입력
insert into typeTest values('444','ccc','aa3',77.123,77.123,77.123,'2025-03-12','2025-03-12','M','a,b,c,d');

















