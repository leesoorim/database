create table board101(
seqid number primary key,
title varchar2(100) not null,
pass varchar2(100) not null,
name varchar2(50) not null,
content varchar2(4000),
regdt timestamp
);

insert into board101 values(1,'aa','1234','홍','',sysdate);
insert into board101 values(3,'bbb','1212','김','33',sysdate);
insert into board101 values(2,'dfdf','1212','김22','33',sysdate);
insert into board101 values(3,'dfdf','1212','김22','33',sysdate); -- 오류

create table board102(
seqid number,
title varchar2(100) not null,
pass varchar2(100) not null,
name varchar2(50) not null,
content varchar2(4000),
regdt timestamp,
constraint board102_pk1 primary key(seqid)
);

--  테이블에는 하나의 기본 키만 가질 수 있습니다.
create table board103(
seqid number primary key,
title varchar2(100) not null,
pass varchar2(100) not null,
name varchar2(50) primary key,
content varchar2(4000),
regdt timestamp
);


create table board104(
seqid number,
title varchar2(100) not null,
pass varchar2(100) not null,
name varchar2(50) not null,
content varchar2(4000),
regdt timestamp,
constraint board104_pk1 primary key(seqid,name)
);

insert into board104 values(1,'aa','1234','홍1','',sysdate); -- ok
insert into board104 values(2,'aa','33334','홍7','',sysdate); -- ok
insert into board104 values(2,'aa','33334','김','',sysdate); -- ok(name,seqid모두 동시에 봄)
insert into board104 values(1,'aa','66334','홍1','sss',sysdate); --> error
insert into board104 values(3,'aa','66334','홍1','sss',sysdate); --> ok
insert into board104 values(3,'aa','7777','홍1','sss',sysdate); --> error
insert into board104 values(3,'aa','66334','만두','',sysdate); --> ok
-- =============================================================================






