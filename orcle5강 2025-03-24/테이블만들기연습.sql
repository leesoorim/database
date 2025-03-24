create table goods_tb1(
gds_cd number primary key,         -- 상품코드
gds_nm varchar2(50) not null,      -- 상품이름
gds_prc number default 0 not null, -- 상품단가
gds_com varchar2(50) not null,     -- 공급업체
gds_dts timestamp,                 -- 등록일시
gds_mgr varchar2(50) check(gds_mgr in('a1','a2','a3')) not null      -- 담당자id
);

create table sale_tb1(
sale_cd number primary key,                         -- 판매코드
gds_cd number ,                                     -- 상품코드
sale_qty number default 0,                          -- 판매수량
sale_dts timestamp,                                 -- 판매일시
sale_pay char(1) check(sale_pay in('Y','N')),       -- 지불여부
constraint sale_tb1_fk foreign key(gds_cd) references goods_tb1(gds_cd)
);
-- --------------------------------------------
insert into goods_tb1 values( (select nvl(max(gds_cd),1000)+1 from goods_tb1) -- 단건
                            ,'맥심목화커피'
                            ,'5000'
                            ,'제일제당'
                            ,sysdate
                            ,'a1');


