create table member1(
seqid number primary key,            -- 중복방지,not null(내장o)
userid varchar2(50) not null unique, -- 중복방지,not null(내장x)
pass varchar2(100) not null,
name varchar2(50),
gender char(1) check(gender in('M','F')),
birth date default '1900-01-01',
regdt timestamp
);

comment on table member1 is '회원정보1';
comment on column member1.seqid is '고유번호';
comment on column member1.userid is '사용자ID';

-- ---------------------------------------------------
create table member2(
seqid number,                 -- primary key
userid varchar2(50) not null, -- unipue
pass varchar2(100) not null,
name varchar2(50),
gender char(1),         -- check
birth date default '1900-01-01', -- default
regdt timestamp,
constraint member2_seqid_pk primary key(seqid),
constraint member2_userid_un unique(userid),
constraint member2_gender_ck check(gender in('M','F'))
);

insert into member2 values('1','test2','1234','테스트2','M','2000-07-05',sysdate);

-- 사용자ID 중복 시 오류 메세지 --
-- 무결성 제약 조건(C##JAVA.MEMBER2_SEQID_PK)에 위배됩니다 --
-- 체크 제약조건(C##JAVA.MEMBER2_GENDER_CK)이 위배되었습니다 --

-- 암호 공백 시 오류 메세지 --
insert into member2 values('2','test2','123456','테스트2','N','2000-07-05',sysdate);

insert into member2 values('3','test3','1111','테스트3','F','',sysdate);

insert into member2(SEQID,USERID,PASS,NAME,GENDER,REGDT) values('4','test4','1111','테스트4','F',sysdate);

create table member3(
seqid number,                
userid varchar2(50) not null, 
pass varchar2(100) not null,
name varchar2(50) not null,
gender char(1) not null,         
birth date default '1900-01-01' not null, 
regdt timestamp,
constraint member3_seqid_pk primary key(seqid),
constraint member3_userid_un unique(userid),
constraint member3_gender_ck check(gender in('M','F'))
);
-- ============================================
create table jumsu(
seqid number not null,
eng number,
kor number,
userid varchar2(50) not null,
constraint jumsu_fk foreign key(userid) references member2(userid)
);
-- ------------------------------
create table jumsu2(
seqid number not null,
eng number,
kor number,
p_userid varchar2(50) not null,
constraint jumsu2_fk foreign key(p_userid) references member2(userid)
);
-- --------------------------------
create table jumsu3(
seqid number not null,
eng number,
kor number,
p_seqid number not null,
constraint jumsu3_fk foreign key(p_seqid) references member2(seqid)
);
-- 오류 제약조건 이름이 위와 같음(이미쓰인 별칭은 사용안됨)-----------------------------------
create table jumsu4(
seqid number not null,
eng number,
kor number,
p_seqid number not null,
constraint jumsu3_fk foreign key(p_seqid) references member2(seqid)
);

--고유 또는 기본 키가 없습니다. 즉, 고유값 설정의 컬럼이 아닌 경우 오류 발생 ----------------------------
create table jumsu5(
seqid number not null,
eng number,
kor number,
p_name varchar2(50) not null,
constraint jumsu5_fk foreign key(p_name) references member2(name)
);
-- ---------------------------------

create table jumsu(
seqid number not null,
eng number,
kor number,
userid varchar2(50) not null,
constraint jumsu_fk foreign key(userid) references member2(userid)
);

insert into jumsu values('1','90','80','test1'); -- 입력성공
insert into jumsu values('1','90','80','test11'); -- 입력실패(부모키가 없습니다)

insert into jumsu values('1','90','70','test2'); -- 입력성공
insert into jumsu values('3','50','30','test2'); -- 입력성공
insert into jumsu values('4','67','45','test2'); -- 입력성공

-- {데이터삭제}
--(실습1) 부모테이블의 데이터를 삭제 시도 (자식데이터가 있는 경우)
delete from member2 where userid='test1';   -- 실패 (자식 레코드가 발견되었습니다)
--(실습2) 부모테이블의 데이터를 삭제 시도 (자식데이터가 없는 경우)
delete from member2 where userid='test3';   -- 성공(자식 레코드가 없음)

--(실습3) 부모테이블의 데이터를 삭제 시도 (자식데이터가 있는 경우)
--       (1)자식테이블의 레코드를 먼저 삭제/부모테이블의 레코드 삭제 시도







