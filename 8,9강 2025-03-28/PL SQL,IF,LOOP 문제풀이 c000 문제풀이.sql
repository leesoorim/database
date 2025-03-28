delete from goods1;

declare
    v_number number := 1;
    v_code varchar2(10);

begin
    loop
        if v_number < 10 then
            v_code := 'c000'||v_number;
        elsif v_number <100 then
            v_code := 'c00'||v_number;
        elsif v_number <1000 then
            v_code := 'c0'||v_number;
        else 
            v_code := 'c'||v_number;
        end if;
        insert into goods1(code) values(v_code);
        v_number := v_number+1;
        exit when v_number>10000;
    end loop;

end;
/

select * from goods1 order by code;
select min(code),max(code) from goods1;


-- 부서테이블에 일련번호 입력하기==============================================
alter table dept add no number;

declare
   v_number number :=10;
   v_no number := 1;

begin
     loop
       update dept set  no=v_no where deptno=v_number;
       
       v_number := v_number +10;
       v_no := v_no+1;
       exit when v_number > 80;
    end loop;

end;
/














