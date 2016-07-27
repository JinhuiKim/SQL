-- table list
select * from tab;

-- table scheme
desc book;

create table book(
  no       NUMBER,
  title    VARCHAR2(100),
  author   VARCHAR2(100),
  pub_date DATE
);

--예제 데이터 넣기
insert into book values(1, '논어', '공자', to_date('1918-10-10', 'yyyy-mm-dd'));
insert into book values(2, '토지', '박경리', to_date('1918-10-10', 'yyyy-mm-dd'));
insert into book values(3, '슬램덩크', '다케이코', to_date('1918-10-10', 'yyyy-mm-dd'));

select * from book;
select * from book_temp;

-- 데이터를 넣으면서 테이블 생성하기 (테이블 백업)
create table book_temp as( select * from book );

-- 테이블 변경( 컬럼 추가)
alter table book add (pubs VARCHAR(200));
desc book;
select * from book;

-- 테이블 변경( 컬럼 수정)
alter table book modify(pubs VARCHAR(500));
desc book;

-- 테이블 변경( 컬럼 삭제)
alter table book drop (pubs);
desc book;

-- 테이블 변경( 컬럼 Unused 설정)
alter table book set unused( author);
desc book;

-- 테이블 삭제
drop table book_temp;
select * from book_temp;

-- 테이블 데이터 삭제
truncate table book;
select * from book;

-- comment 달기
comment on table book is 'this is comment';
select * from user_tab_comments;

-- rename
rename book to article;
select * from article;

-- constraint(제약조건) - not null
create table book(
  no       NUMBER NOT NULL,
  title    VARCHAR2(100) NOT NULL,
  author   VARCHAR2(100),
  pub_date DATE
);

insert into book values( 1, '논어', null, null );
-- error
-- insert into book values( 1, null, null, null );
insert into book values( 1, '', null, null );

select * from book;

-- constraint(제약조건) - unique
drop table book;

create table book(
  no       NUMBER NOT NULL,
  title    VARCHAR2(100) NOT NULL,
  author   VARCHAR2(100),
  pub_date DATE,
  constraint c_book_unique unique( no )
);

insert into book values( 1, '논어', '공자', sysdate);
insert into book values( 2, '논어2', '공자2', sysdate);

select * from book; 

-- constraint(제약조건) - primary key = not null + unique
drop table book;

create table book(
  no       NUMBER,
  title    VARCHAR2(100) NOT NULL,
  author   VARCHAR2(100),
  pub_date DATE,
  primary key(no)
);

insert into book values( 1, '논어', '공자', sysdate);
insert into book values( 2, '논어2', '공자2', sysdate);

select * from book; 


-- constraint(제약조건) - check
drop table book;

create table book(
  no       NUMBER,
  title    VARCHAR2(100) NOT NULL,
  author   VARCHAR2(100),
  pub_date DATE,
  rate     NUMBER NOT NULL,
  primary key(no),
  check( rate in (1, 2, 3, 4, 5) )
);

insert into book values( 1, '논어', '공자', sysdate, 5);
insert into book values( 2, '논어2', '공자2', sysdate, 1);

select * from book; 

-- author table 생성
drop table author cascade constraint;
create table author(
  no number,
  name varchar2(80) not null,
  description varchar2(2000),
  primary key( no )
);

insert into author values(1, '공자', '어쩌구 저쩌구....');

select * from author;

-- constraint(제약조건) - Foreign Key(외래키)
drop table book cascade constraint;

create table book(
  no        NUMBER,
  title     VARCHAR2(100) NOT NULL,
  pub_date  DATE,
  rate      NUMBER NOT NULL,
  author_no NUMBER,
  constraint c_book_pk primary key(no),
  constraint c_book_check_rate check( rate in (1, 2, 3, 4, 5) ),
  constraint c_book_fk foreign key( author_no )
  references author( no )
  on delete cascade    -- on delete cascade pk 삭제시 함께 삭제
                       -- on delete set null pk 삭제시 null로 세팅
);

insert into book values( 1, '논어', sysdate, 5, 1 );
insert into book values( 2, '논어2', sysdate, 1, 1);

select * from book;


-- foreign key 삭제 시 문제점
delete from author where no = 1;
    
    
SELECT object_name 
FROM user_objects
WHERE object_type = 'TABLE';    

SELECT constraint_name, constraint_type,search_condition
FROM user_constraints
WHERE table_name = 'BOOK';
    
    