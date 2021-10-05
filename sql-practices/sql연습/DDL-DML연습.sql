drop table member;
create table member(
no int(11) not null auto_increment,
email varchar(200) not null,
password varchar(64) not null,
name varchar(100) not null,
deparment varchar(100),
primary key(no)
);
desc member;
alter table member add juminbunho char(12) not null after email; 
desc member;
alter table member drop juminbunho;
desc member;
alter table member add join_date datetime not null;
desc member;
alter table member change deparment department varchar(100) not null;
desc member;
alter table member add self_intro text;

-- transaction 
-- 자동 커밋 
select @@autocommit;
set autocommit=1;

-- insert
desc member;
insert
   into member
  value(null, 'eogkdfh@gmail.com', password('1234'), '성창현', '개발팀', now(), null);

-- update
update member
  set password  = password('7894');

commit;
-- 암호화 함수
select password('fdsadf');