-- 1. 등가조인 => 기본적
-- (1) 사원번호,사원이름,부서이름

select empno
      ,ename
      ,dname
from
    emp,dept
where
    emp.deptno=dept.deptno;

-- (2) 사원번호,사원이름,부서이름,부서번호

select empno
      ,ename
      ,dname
      ,emp.deptno -- emp or dept 로 써야 나옴 (둘 중 어디서 가져오지 하는 오류)
from
    emp,dept
where
    emp.deptno=dept.deptno;
    
-- (3) 사원번호,사원이름,부서이름,부서번호

select e.empno  empno
      ,e.ename  ename
      ,d.dname  dname
      ,e.deptno deptno
from
    emp e,dept d
where
    e.deptno=d.deptno;   
    
    
    
    
    
    
    




