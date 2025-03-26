-- 7. 예약정보를 최근일 순으로 출력한다.
select 
       resno                      예약번호
      ,rno                        방번호
      ,to_char(sdt,'yyyy-mm-dd')  입실일
      ,to_char(edt,'yyyy-mm-dd')  퇴실일
      ,usrid                      사용자ID
      ,decode(pay,'Y','결재완료','N','미결재') 결재여부
from 
    resinfo
order by
    sdt desc;

-- --------------------------------------------
select b.* from  
    (select rownum rn,a.* from
        (select  
               resno                      예약번호
              ,rno                        방번호
              ,to_char(sdt,'yyyy-mm-dd')  입실일
              ,to_char(edt,'yyyy-mm-dd')  퇴실일
              ,usrid                      사용자ID
              ,decode(pay,'Y','결재완료','N','미결재') 결재여부
        from 
            resinfo
        order by
            sdt desc)a) b 
--where rn between 11 and 20;
where rn>=11 and rn<=20;

-- =============================================

-- 8. 2025년 01월의 이용정보 출력
select 
    resno                      예약번호
   ,rno                        방번호 
   ,to_char(sdt,'yyyy-mm-dd')  입실일
   ,to_char(edt,'yyyy-mm-dd')  퇴실일
from
    resinfo
where
    to_char(sdt,'yyyy-mm')='2025-01';

-- =============================================

-- 9-1. 아이디 'a1' 회원의 이용정보를 출력한다.(최근이용순)
select 
    resno
   ,rno
   ,to_char(sdt,'yyyy-mm-dd')
   ,to_char(edt,'yyyy-mm-dd')
from
    resinfo
where
    usrid='a1'
order by
    sdt desc;
    
-- 9-2 -------------------------------------------
select 
    s.usrid
   ,p.phone
   ,s.resno
   ,to_char(s.sdt,'yyyy-mm-dd')sdt
   ,to_char(s.edt,'yyyy-mm-dd')edt
   ,s.rno
   ,m.rprc
from
    resinfo s,p_member p,roominfo m
where
    s.usrid=p.usrid 
and
    s.rno=m.rno 
and
    s.usrid='a1'
order by
    s.sdt desc;
 -- -----------------   
select 
    s.usrid
   ,p.phone
   ,s.resno
   ,to_char(s.sdt,'yyyy-mm-dd')sdt
   ,to_char(s.edt,'yyyy-mm-dd')edt
   ,s.rno
   ,m.rprc
from resinfo s
join p_member p on p.usrid=s.usrid
join roominfo m on m.rno=s.rno 
where s.usrid='a1'
order by s.sdt desc;

-- =============================================

-- 10. 사용자별 이용회수를 출력하려고 한다.
select 
    usrid
   ,phone
   ,(select count(*) from resinfo where usrid=p.usrid)cnt
from
    p_member p;

-- =============================================

-- 11. (1)예약번호/방번호/입실일/퇴실일/몇박수 -->1/2,2/3
select 
    resno
   ,rno
   ,to_char(sdt,'yyyy-mm-dd')   sdt
   ,to_char(edt,'yyyy-mm-dd')   edt
   ,edt-sdt||'/'||(edt-sdt+1) result
from
    resinfo;
-- 박수 ---------------------
select 
    (to_date('2025-03-25','yyyy-mm-dd')
    - to_date('2025-03-24','yyyy-mm-dd')) || '/' || 
    (to_date('2025-03-25','yyyy-mm-dd')
    - to_date('2025-03-24','yyyy-mm-dd')+1) from dual;
    
--11 (2)예약번호/방번호/입실일/퇴실일/몇박수/금액(단가*숙박일) ------------------------------------
select
    s.rno
   ,s.rno
   ,s.sdt
   ,s.edt
   ,(s.edt-s.sdt) || '/' || (s.edt-s.sdt+1) result
   ,to_char(m.rprc*(s.edt-s.sdt),'FML999,999,999') price
from
    resinfo s,roominfo m
where
    s.rno=m.rno;

-- =============================================

-- 12. 작년도 매출액을 출력하려고 한다.
select
    to_char(sum(m.rprc*(s.edt-s.sdt)),'FML999,999,999') result
from 
    resinfo s,roominfo m
where
    s.rno=m.rno
and
    to_char(edt,'yyyy')='2024'
and
    s.pay='Y';
    
-- -------------------------------------------------
select
    ('2024년 매출액 : ' ||
    to_char(sum((m.rprc*(edt-sdt))),'FML999,999,999')) salesum
from
    resinfo s, roominfo m
where
    s.rno=m.rno
and
    s.pay = 'Y'
and
    to_char(s.sdt,'yyyy')='2024';
-- =============================================

-- 13. 룸별 이용 회수를 출력하려고 한다.
select 
    rno
   ,(select count(*) from resinfo where rno=m.rno)
from 
    roominfo m;

select * from roominfo;

select * from resinfo;

select * from p_member;