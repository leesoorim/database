select empno 사원번호
      ,ename 사원이름
      ,sal   기본급여
      ,(sal+comm) 실급여1
      ,(sal+nvl(comm,0)) 실급여2
from emp;

select nvl(100,0)+100 from dual; -- 200

select nvl(null,0)+100 from dual; -- 100

select nvl(null,200)+100 from dual; -- 300

select nvl('html','설정안됨')||'입니다.' from dual;

select nvl(null,'설정안됨')||'입니다.' from dual;