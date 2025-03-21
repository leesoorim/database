--[구매테이블]
create sequence pay_seq
increment by 1      -- 증감요건
start with 1        -- 시작값
maxvalue 999999;    -- 마지막값(최대값)

create table pay(
seqid number not null primary key,
name varchar(50),
title varchar(50),
price number,
pdate timestamp
);

insert into pay (seqid,name,title,price,pdate) values(pay_seq.nextval,'a101','java책','5000','2025-03-01 01:30:10');
insert into pay (seqid,name,title,price,pdate) values(pay_seq.nextval,'a102','html책','','2025-03-03 22:30:10');
insert into pay (seqid,name,title,price,pdate) values(pay_seq.nextval,'a103','리눅스책','1500','2025-03-01 15:30:10');









