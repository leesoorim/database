-- funtion 함수
-- select fn_sum(90,80) from dual;

create function fn_sum( v_num1 in number,v_num2 in number )
    return number
is
    v_sum number;
begin
    v_sum := v_num1 + v_num2;
    return v_sum;
end;
/

select fn_sum(90,80) from dual;

-- =========================================

create function fn_sum_sal(v_deptno in number)
    return number
is
    v_sum number;
begin
    select sum(sal) into v_sum from emp where deptno=v_deptno;
    
    return v_sum;
        
end;
/

select '20번부서의 급여합계 :'||fn_sum_sal(20)as 급여합계 from dual;

-- 풀어보기1
create function fn_emp_sal(v_empno in number)
    return number
    
is
    v_sum_salcomm number;
begin
    select (sal+nvl(comm,0)) into v_sum_salcomm from emp where empno=v_empno;
    
    return v_sum_salcomm;
end;
/

select fn_emp_sal(7499) from dual;


-- 풀어보기2
create function fn_dept_name(v_name in emp.ename%type)
    return varchar2
    
is
    v_dname dept.dname%type;
begin
    select d.dname into v_dname from dept d join emp e on d.deptno=e.deptno where e.ename=v_name;
    -- = select (select dname from dept where deptno=emp.deptno)
    
    return v_dname;
end;
/
select fn_dept_name('호동이') from dual;

-- 풀어보기5=============================

create or replace function fn_dept_no(p_tablename in varchar2)
    return number

is
    v_no number;
begin
    select nvl(max(no),0)+1 into v_no from dept;
    return v_no;
end;
/

-- --------------------------------------------
create or replace function fn_dept_deptno(p_tablename in varchar2)
    return number

is
    v_no number;
begin
    select nvl(max(deptno),0)+10 into v_no from dept;
    return v_no;
end;
/
select fn_dept_deptno('dept') from dual;


-- ========================================
insert into dept(no,deptno,dname,loc) values(fn_dept_no('dept'),fn_dept_deptno('dept'),'개발부','서울');

select * from dept order by deptno;

























































