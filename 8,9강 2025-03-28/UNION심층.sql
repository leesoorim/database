select empno,ename,comm,deptno from emp where deptno=10
union
select empno,ename,sal,deptno from emp where deptno=20;

---------------------

select deptno,dname from dept
union
select empno,ename from emp where deptno=10;

------------------------------
-- union:중복데이터 한개만 출력
select empno,job,deptno from emp where sal>1000
union
select empno,job,deptno from emp where deptno=20;

select empno,job,deptno from emp where sal>1000
union all
select empno,job,deptno from emp where deptno=20;





