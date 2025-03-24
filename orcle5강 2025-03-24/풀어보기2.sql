create sequence mysale_seq
increment by 1
start with 1
maxvalue 999999;

create table mysale(
seqid number not null primary key,
code varchar2(50) not null,
subject varchar2(100)not null,
price number default 0,
saledt timestamp
);

insert into mysale(SEQID,CODE,SUBJECT,PRICE,SALEDT) values(mysale_seq.nextval,'a101','java책','5000',sysdate);
insert into mysale(SEQID,CODE,SUBJECT,PRICE,SALEDT) values(mysale_seq.nextval,'a102','html책','',sysdate);
insert into mysale(SEQID,CODE,SUBJECT,PRICE,SALEDT) values(mysale_seq.nextval,'a103','리눅스책','1500',sysdate);

commit;

select SEQID seqid
      ,CODE  code
      ,SUBJECT sybhect
      ,PRICE price
      ,to_char(SALEDT,'YYYY-MM-DD')
from 
    mysale;
-- ----------------------------
select CODE  아이디
      ,SUBJECT 상품명
      ,nvl2(price,'결제완료','미결제') 결제여부
from 
    mysale;
-- -------------------------------------------------
select code||subject||decode(price,null,'미결제','결제완료')from mysale;






