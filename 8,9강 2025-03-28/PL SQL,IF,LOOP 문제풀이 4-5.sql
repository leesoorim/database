-- 풀어보기4
-- 1.부서테이블의 정보를 삭제 (올바른 부서번호인지 체크/사원테이블에서 소속 직원의 유무 체크)
set serveroutput on;

declare
    v_deptno number := &삭제할부서번호;
    v_cnt number;
    v_cnt2 number;

begin
    select count(*) into v_cnt from dept where deptno=v_deptno;
    if v_cnt=0 then
        dbms_output.put_line(v_deptno||'부서번호는 없는 번호입니다.');
    else
        select count(*) into v_cnt2 from emp where deptno=v_deptno;
        if v_cnt2=0 then
            delete from dept where deptno=v_deptno;
            dbms_output.put_line( '해당 부서정보를 삭제했습니다.');
        else
            dbms_output.put_line('해당 부서에 소속 사원들이 '|| v_cnt2||'명 있습니다.');
        end if;
    end if;

end;
/

-- 풀어보기5

declare
    v_cnt1 number;
    v_num number := 1;
    
begin
    --select count(*) into v_cnt1 from all_tables where table_name='GOODS1';
    
    --if v_cnt1=0 then
     --   execute immediate
      --      'create table goods1(code varchar2(10), name varchar2(10))';  
    --end if;
    
    
    loop
        insert into goods1(code) values('c'||v_num);
        v_num := v_num+1;
    exit when v_num>10;
    end loop;
    
    dbms_output.put_line('저장완료!');

end;
/

select * from all_tables where table_name='EMP';

rollback;






