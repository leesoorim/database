-- LOOP문
declare
    cnt number :=0;

begin
    loop
        cnt := cnt+1;
        exit when cnt>10;
        dbms_output.put_line(cnt);  
    end loop;
end;
/

-- for문 =====================================

declare
   -- cnt number :=0;
   a number := 1;

begin
    for i in reverse 1..10
    loop
       
        dbms_output.put_line(a);  
         a:= a+2;
    end loop;
end;
/

-- 구구단 출력---------------------------
declare
    dan number :=&구구단;
    cnt number :=1;
begin
    loop
    dbms_output.put_line(dan||'x'||cnt||'='||dan*cnt);
    cnt:=cnt+1;
    exit when cnt = 10;
    end loop;

end;
/

--풀어보기(1)--------------------
declare
    v_empno number := '&사원번호';
    v_cnt   number;
    v_ename varchar2(100);
    v_sal number;
    v_year varchar2(100);
    v_dname varchar2(100);

begin
    select count(*) into v_cnt from emp where empno=v_empno;
    if v_cnt = 0 then
       dbms_output.put_line('없는 사원번호입니다.');
    else 
        select  e.ename
              ,(sal+nvl(e.comm,0))
              ,to_char(e.hiredate,'yyyy')
              ,d.dname 
            into v_ename
                ,v_sal
                ,v_year
                ,v_dname
        from emp e,dept d 
        where e.deptno=d.deptno and e.empno=v_empno;
        
        dbms_output.put_line('사원번호:'||v_empno);
        dbms_output.put_line('사원이름:'||v_ename);
        dbms_output.put_line('사원급여:'||v_sal);
        dbms_output.put_line('입사년도:'||v_year);
        dbms_output.put_line('부서이름:'||v_dname);
    end if;

end;
/

--풀어보기(2)
declare
    v_deptno dept.deptno%type := &부서번호;
    v_dname dept.dname%type :='&부서명';
    v_loc dept.loc%type := '&부서위치';
    v_cnt number := 0;

begin
    select count(*) into v_cnt from dept where deptno=v_deptno or dname=v_dname;
    if v_cnt=0 then
    insert into dept values(v_deptno,v_dname,v_loc);
    dbms_output.put_line('입력되었습니다.');
    else
    dbms_output.put_line('이미 있는 부서번호입니다.');
    end if;

end;
/

-- 풀어보기(3)
declare
    v_deptno_set number := &부서번호;
    v_deptno dept.deptno%type := '&입력번호';

begin
    update dept set deptno=v_deptno where deptno=v_deptno_set; 

end;



rollback;

