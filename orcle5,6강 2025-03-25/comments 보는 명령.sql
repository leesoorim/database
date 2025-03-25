select * from all_tab_comments where table_name='member2'; -- 테이블내용

select * from all_col_comments where table_name='member2'; -- 컬럼내용
-- -----------------------------------------------------
select * from user_constraints where table_name='MEMBER2'; -- 제약내용

select * from all_indexes where table_name='MEMBER2';      -- 인덱스내용(primary key, unique)
