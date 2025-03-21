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


select ename 사원이름
      ,nvl(mgr,'7839') 매니저번호
from emp;
-- -----------------------------------
-- (1)실급여 계산 -> 실적이 있는 직원들은 100만원 추가
select ename        사원명
      ,sal          기본급
      ,(sal+comm)   실급여1 -- 함수처리 안함
      ,sal+nvl(comm,0) 실급여2     -- nvl()함수 처리
    from
        emp;
        
-- (2) 커미션이 있는 직원들은 Y,없는 직원들은 N
 select ename        사원명
      ,sal          기본급
      ,(sal+comm)   실급여1 -- 함수처리 안함
      ,sal+nvl(comm,0) 실급여2     -- nvl()함수 처리
      ,nvl2(comm,'Y','N') 수당여부 -- nvl2() 함수처리
    from
        emp;   
        
-- (3) 매니저가 있으면 '있음' 없으면 '없음'
select ename,nvl2(mgr,'있음','없음')매니저 from emp;

-- ---------------------------
select 
       deptno
      ,dname
      ,decode(deptno,10,'회계'
                    ,20,'조사'
                    ,30,'영업'
                    ,40,'기획'
                    ,'미등록') dname2
from
    dept;
    
-- (2) 10번 부서의 직원들만 급여 인상
select empno    사원명
      ,deptno   부서번호
      ,decode(deptno,10,sal*1.1,sal)  급여
from emp;

-- ---------------------------
    
-- (풀어보기1) 10->10%,20->20% 다른,안함
select empno    사원명
      ,deptno   부서번호
      ,sal      기본급
      ,decode(deptno,10,sal*1.1,20,sal*1.2,sal)  급여
from emp;

-- ---------------------------

-- (풀어보기2) 풀어보세요~


-- ---------------------------

-- (풀어보기3)
--(1)
select ename,sal,'상' from emp where sal>=2000
union -- (출력SQL을 연결해주는 함수)
select ename,sal,'하' from emp where sal<2000;

--(2)
select ename
      ,sal
      ,decode(sign(sal-1999),'1','상','-1','하') grade
from emp;

select sign(100) from dual;
select sign(7) from dual;
select sign(-100) from dual;
select sign(-3) from dual;
select sign(0) from dual; -- 0

-- 풀어보기 5
select
    (select count(*) from emp where to_char(hiredate,'mm')= '01')  "1월"
    ,(select count(*) from emp where to_char(hiredate,'mm')= '02') "2월"
    ,(select count(*) from emp where to_char(hiredate,'mm')= '03') "3월" from dual;

-- ------------------------
select 
    count(decode(to_char(hiredate,'mm'),01,'1')) a1
from emp;

select 
    decode(to_char(hiredate,'mm'),01,'1') a1
from emp;

select
    count (decode((to_char(hiredate,'mm')),'01','1')) a1
    ,count (decode((to_char(hiredate,'mm')),'02','1')) a2
    ,count (decode((to_char(hiredate,'mm')),'03','1')) a3
from emp;
-- ------------------------
select count(*) 전체개수
      ,count(mgr) 매니저개수
      ,count(comm) 커미션개수
from 
    emp;
    






