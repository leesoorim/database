select sum(sal) from emp where deptno=10
union
select sum(sal) from emp where deptno=20
union
select sum(sal) from emp where deptno=30;

select deptno,sum(sal) from emp where deptno is not null group by deptno;

select deptno,sum(sal) from emp group by deptno having deptno is not null ;



-- { UNION }
select * from emp where deptno=10
union
select * from emp where deptno=20 ;

-- ---------------------------------------
select * from dept
union
select * from emp;


select empno,ename,sal from emp where deptno=10
union
select empno,ename,sal from emp where deptno=20;

-- 개수 불일치--------------------------------------------------
select empno,ename,sal from emp where deptno=10
union
select empno,ename,sal,job from emp where deptno=10;

-- 컬럼명은 다르지만 개수와 타입이 동일함 -------------------------------------------------------
select empno,ename,comm from emp where deptno=10
union
select empno,ename,sal from emp where deptno=20;








