-- set SERVEROUTPUT on;

declare -- 정의
    v_sal number := 3000;
    m_sal number;
    v_eng number := 98;
    v_ret number;
begin -- 프로그램
    m_sal := v_sal/12;
    v_ret := mod(v_eng,10);
    dbms_output.put_line('내 급여는 '|| m_sal ||'입니다.'); -- =java: System.out.prinltn()
    dbms_output.put_line('결과: '|| v_ret );
end;
/

-- 2. 부서테이블 : BOSTON을 검색 조건으로 조회한다. (부서번호,부서이름)
declare
    v_deptno dept.deptno%type; -- 테이블 컬럼 타입을 따르겠다.
    v_dname dept.dname%type;
begin
    select deptno,dname into v_deptno,v_dname from dept
    where loc='BOSTON';
    
    dbms_output.put_line(v_deptno || ',' || v_dname);
end;
/
-- ------------------------------------------------------
-- 3. 사원테이블 : 사원번호가 7788인 사원의 사원이름,업무를 출력한다.
declare
    v_ename emp.ename%type; -- 출력용도
    v_job emp.job%type;     -- 출력용도
begin
    select ename,job into v_ename,v_job from emp
    where empno=7788;
    
    dbms_output.put_line(v_ename || ',' || v_job);
end;
/

-- ---------------------------------------------
-- 4. 부서테이블 : 내용저장
declare
    v_deptno number := 90;
    v_dname varchar2(100) := '총무부';
    v_loc varchar2(100) := '부산';

begin
    insert into dept values(v_deptno,v_dname,v_loc);
    dbms_output.put_line('저장완료');
end;
/

-- ---------------------------------------------
-- 5. 부서테이블 : 내용저장 (외부에서 데이터를 받는 변(함수 &)
-- 매개변수(p_deptno등) : 외부데이터 값을 받는 변수
-- 매개변수 : 받는 용도로만 사용, 일반변수처럼 사용불가
declare
    v_deptno number := &p_deptno;
    v_dname varchar2(100) := '&p_dname';
    v_loc varchar2(100) := '&p_loc';

begin
    insert into dept values(v_deptno,v_dname,v_loc);
    dbms_output.put_line('저장완료');
end;
/


-- 풀어보기1 나 --------------------------------
declare
v_sal emp.sal%type;
v_deptno emp.deptno%type;

begin
select deptno,avg(sal)into v_deptno,v_sal from emp where deptno=10 group by deptno;

dbms_output.put_line(v_deptno || '번 부서의 평균급여 : ' || v_sal);

end;
/

-- 풀어보기1 쌤--------------------------------
declare
v_deptno number := &p_deptno;
v_sum_sal number;

begin
select sum(sal) into v_sum_sal from emp where deptno=v_deptno;

dbms_output.put_line(v_deptno || '번 부서의 평균급여 : ' || v_sum_sal || '입니다.');

end;
/

-- 풀어보기2 ----------------------------
declare
v_comm emp.comm%type:= 400;

begin
update emp set comm=nvl(comm,0)+v_comm where deptno=10;

end;
/
-- 다른방법
declare
v_deptno number := &부서번호;
v_comm number := &수당;

begin
update emp set comm=nvl(comm,0)+v_comm where deptno=10;
dbms_output.put_line(v_deptno||'번 부서에 수당을 ' ||v_comm||'증가시켰습니다.');
end;
/

--{ 조건문 } if예제
declare
v_deptno number := &부서번호;
v_comm number := &수당;
v_cnt number;

begin
    select count(*) into v_cnt from emp where deptno=v_deptno;
    if   v_cnt=0 then dbms_output.put_line('해당부서에 속한 사원이 없습니다.'); 
    else update emp set comm=nvl(comm,0)+v_comm where deptno=10;
         dbms_output.put_line(v_deptno||'번 부서에 수당을 ' ||v_comm||'증가시켰습니다.');
    end if;
   
    
    
end;
/

-- 조건문 삭제
declare
    v_deptno dept.deptno%type := &dept_no;
    v_cnt number(3);

begin
    select count(*) into v_cnt from emp where deptno=v_deptno;
    dbms_output.put_line('삭제할 개수:'||v_cnt);
    
    if v_cnt=0 then
    dbms_output.put_line('삭제할 내용이 없습니다.');
    else
    delete from emp where deptno=v_deptno;
    dbms_output.put_line('내용이 삭제되었습니다.');
    end if;

end;
/


rollback;








