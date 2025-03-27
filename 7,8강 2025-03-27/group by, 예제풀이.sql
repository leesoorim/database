-- emp - NULL 출력 제외
-- (1) 부서번호가 아닌 부서명을 출력 부서명/평균급여
select dname 부서명
      ,round(avg(sal))평균급여 
from emp e,dept d 
where e.deptno=d.deptno 
group by dname
order by avg(sal) asc;

-- (2)입사년도/사원수 >> 입사년도 별로 사원수를 출력한다. 2000년이후
select to_char(hiredate,'yyyy') 입사년도
      ,count(*) 사원수
from emp 
where hiredate is not null
group by to_char(hiredate,'yyyy')
having to_char(hiredate,'yyyy')>='2000'
order by to_char(hiredate,'yyyy') desc;

-- (3) 매니저명/사원수 >> 매니저별로 그룹화를 하여 관리하는 사원수를 출력한다. 이름출력어케하지
select e1.empno 사원번호
      ,e1.ename 사원이름
      ,e1.mgr   매니저번호
      ,e2.ename 매니저이름
from emp e1, emp e2
where e1.mgr = e2.empno;
--^JOIN^-------------------------------
select    
      e2.ename 매니저이름
     ,count(*) 사원수
from emp e1, emp e2
where e1.mgr = e2.empno
group by e2.ename
order by 매니저이름;






--post 테이블 ==========================================================
-- (1) 서울특별시에 각 구들을 출력한다.
select distinct(p3) from post1 where p2 like '%서울%' order by p3;

select p3 from post1 where p2 like '%서울%' group by p3 order by p3;

--(2) 서울특별시에 각 구들의 하위 동의 개수를 출력한다.
select p3,count(*) from post1 where p2 like '%서울%' group by p3 order by p3;

select p4       동이름
      ,count(*) 주소개수
 from post1 
 where p3 = '구리시' 
 having p4 is not null
 group by p4;
 
--resinfo 테이블 ===================================
-- (1) 각 사용자들의 예약 건수를 출력한다.
select usrid,count(*) from resinfo group by usrid;

-- (2) 각 사용자들의 예약 건수를 출력한다 -단 2024년도만-
select usrid,count(*) from resinfo where to_char(sdt,'yyyy')='2024' group by usrid;





