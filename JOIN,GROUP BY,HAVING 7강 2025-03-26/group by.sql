select sum(sal) from emp where deptno=10;
select sum(sal) from emp where deptno=20;

-- 2방법
select 
    (select sum(sal) from emp where deptno=10),
    (select sum(sal) from emp where deptno=20)
    from dual;
 
    
-- 3방법 부서별 합계(레코드 형식 - UNION 사용)
select 10 deptno,sum(sal) from emp where deptno=10
union
select 20 deptno,sum(sal) from emp where deptno=20
union
select 30 deptno,sum(sal) from emp where deptno=30
union
select 40 deptno,sum(sal) from emp where deptno=40;


-- 4방법 (레코드 형식 - GROUP BY 사용)
select deptno,sum(sal) from emp; -- error

-- 5방법 부서번호를 그룹으로 만들어서 부서번호와 급여합계를 출력한다.
select deptno,sum(sal) from emp group by deptno;
select deptno,round(avg(sal),2) avg from emp group by deptno order by deptno asc;

-- 정상출력--------------------------------------------------------
select 
    deptno    부서번호
   ,sum(sal)  급여합계
   ,round(avg(sal),2) 급여평균
   ,max(sal)  최고급여
   ,min(sal)  최저급여
from emp 
group by deptno 
order by deptno asc;

-- 오류사항1 group by와 order by의 순서 바뀌면 오류------------------------------------------------
select 
    deptno    부서번호
   ,sum(sal)  급여합계
   ,round(avg(sal),2) 급여평균
   ,max(sal)  최고급여
   ,min(sal)  최저급여
from emp 
order by deptno asc
group by deptno ;

-- 오류사항2 그룹묶음의 주체 컬럼 이외에는 출력불가 ------------------------
select 
    empno     사원번호
   ,deptno    부서번호
   ,sum(sal)  급여합계
   ,round(avg(sal),2) 급여평균
   ,max(sal)  최고급여
   ,min(sal)  최저급여
from emp 
group by deptno 
order by deptno asc;


-- HAVING 부서별 그룹 후 평균이 500 이상인 부서들만 출력 =================================
-- 정상출력
select deptno
      ,round(avg(sal),2) 급여평균
from
    emp
group by
    deptno
having  -- 그룹에 대한 조건식
    avg(sal) >=500;


-- 잘못된 사례
select deptno
      ,round(avg(sal),2) 급여평균
from
    emp
where
    avg(sal) >=500 -- where조건에 그룹함수 사용 불가
group by
    deptno;
    
-- 일반 where 조건과 같이 쓰는 경우-----------------------------------
select deptno
      ,round(avg(sal),2) 급여평균
from
    emp
where
    sal>=1000   -- 1번째 해석 : 전직원에서 1000만원 이상만 추려냄
group by        -- 2번째 해석 : 1000만원 이상의 직원들에서 그룹으로 묶음
    deptno;
-- 업무별 그룹화========================================================
-- (1) 업무별 급여합계
select 
    job 업무명
   ,sum(sal) 급여합계
   ,min(sal) 최저급여
   ,max(sal) 최고급여
   ,count(*) 인원수
from
    emp
group by job;


-- (1)==========================
select avg(sal) from emp group by deptno;
--(2)
select min(avg(sal)) from emp group by deptno ;

--(3)
select empno,ename,sal from emp where sal<=250;

--(4)
select empno,ename,sal from emp where sal<=(select min(avg(sal)) from emp group by deptno);


-- 풀어보기==================================================================
-- 1. 부서별 사원수 조회
select deptno ,count(*) fromemp
group by deptno order by deptno;

-- 1-1 부서지정이 안되어있는 사원들은 제외(부서번호가 null로 되어있음)
select deptno ,count(*) from emp
group by deptno having deptno is not null  order by deptno;

-- 1-2 부서지정이 안되어있는 사원들은 제외 (부서번호가 null로 되어있음)
select deptno ,count(*) from emp
where deptno is not null group by deptno  order by deptno;


-- 2. 부서별 사원수 급여평균 급여합계 출력
select decode(deptno,null,'수습',deptno)
      ,count(*)
      ,round(avg(sal))
      ,sum(sal)
from emp
group by deptno;

-- 3. 사원수가 5명이 넘는 부서명과 사원수를 출력한다.
select
    deptno
   ,count(*)
from emp
group by deptno
having count(*)>=5;

-- 4. 부서별 최저급여를 출력한다.
select
    job
   ,min(sal)
from emp
group by job;

-- 5.
select
    ename
   ,job
   ,2025-to_char(nvl(hiredate,sysdate),'yyyy') 연차
   ,sal
from emp;









