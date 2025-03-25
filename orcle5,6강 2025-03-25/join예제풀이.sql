create table roominfo(
rno number primary key, -- 1001
ras varchar2(50),
rprc number default 50000 not null, -- 원
rsiz number default 15  -- 평수
);

create table resinfo(
resno number primary key,   -- 10001
rno number,
sdt date,
edt date,
usrid varchar2(50) not null,
pay char(1) default 0,
constraint resinfo_fk foreign key(rno) references roominfo(rno),
constraint resinfo_ck check(pay in('Y','N'))
);

create table p_member(
usrid varchar2(50) primary key,
pass varchar2(100) not null,
name varchar2(50),
phone varchar2(50)not null,
regdt date
);

insert into roominfo values(1001,'별사랑방','150000','15');
insert into roominfo values(1002,'달이야기','200000','20');
insert into roominfo values(1003,'바다뷰','300000','30');
insert into roominfo values(1004,'산뷰','150000','15');

insert into p_member values('a1','1111','홍길동','010-7777-8888','2025-03-21');
insert into p_member values('a2','121212','손흥민','010-2222-8888','2025-03-23');
insert into p_member values('a3','56565','차범근','010-7775-4556','2025-03-25');

commit;

-- 1. 각테이블들의 기본 출력
select * from roominfo;

select * from resinfo;

select * from p_member;

-- 2. 예약번호/입실일(년-월-일)/퇴실일(년-월-일)/사용자ID
select 
    resno                     예약번호
    ,to_char(sdt,'yyyy-mm-dd')입실일
    ,to_char(edt,'yyyy-mm-dd')퇴실일
    ,usrid                    사용자ID 
from 
    resinfo;

-- 3. 예약번호/방번호/방가격/입실일(년-월-일)/퇴실일(년-월-일)/사용자ID -조인
select 
    s.resno                         예약번호
   ,s.rno                           방번호
   ,to_char(m.rprc,'FM999,999,999') 방가격
   ,to_char(s.sdt,'yyyy-mm-dd')     입실일
   ,to_char(s.edt,'yyyy-mm-dd')     퇴실일
   ,s.usrid                         사용자ID
from 
    resinfo s,roominfo m
where
    s.rno=m.rno;

-- 4. 예약번호/입실일(년-월-일)/퇴실일(년-월-일)/사용자ID/연락처 -조인
select 
    s.resno                     예약번호
   ,to_char(s.sdt,'yyyy-mm-dd') 입실일
   ,to_char(s.edt,'yyyy-mm-dd') 퇴실일
   ,s.usrid                     사용자ID
   ,p.phone                     연락처
from 
    resinfo s,p_member p
where
    s.usrid=p.usrid;

-- 5. 예약번호/입실일(년-월-일)/퇴실일(년-월-일)/사용자ID - 작년에 등록한 정보
select 
    res.resno                 예약번호
   ,to_char(sdt,'yyyy-mm-dd') 입실일
   ,to_char(edt,'yyyy-mm-dd') 퇴실일
   ,usrid                     사용자ID
from 
    resinfo res
where
    to_char(sdt,'yyyy')=to_char(sysdate,'yyyy')-1;

-- 6. 예약번호/입실일(년-월-일)/퇴실일(년-월-일)/결재여부(결재완료/미결재)

select 
    resno                                예약번호
   ,to_char(sdt,'yyyy-mm-dd')            입실일
   ,to_char(edt,'yyyy-mm-dd')            퇴실일
   ,decode(pay,'Y','결재완료','N','미결재') 결재여부
from 
    resinfo ;




