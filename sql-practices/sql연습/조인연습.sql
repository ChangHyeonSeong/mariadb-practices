-- inner join
-- 예제: employees 테이블과 title 테이블을 join하여 직원의 이름과 직책을 모두 출력
select a.first_name, b.title
from employees a, titles b
where a.emp_no = b.emp_no        -- join 조건(n-1)
and b.to_date = '9999-01-01';     -- row 선택 조건


-- 예제2: employees 테이블과 titles 테이블을 join 하여 직원의 이름과 직책을 출력하되 여성 엔지니어만 출력하세요.
select a.first_name, b.title, a.gender
from employees a, titles b
where a.emp_no = b.emp_no        -- join 조건(n-1)
and b.to_date = '9999-01-01'     -- row 선택 조건1
and a.gender = 'f'               -- row 선택 조건2
and b.title = 'engineer';        -- row 선택 조건3


-- 
-- ANDI/ISO SQL1999 JOIN 표준 문법
--

-- 1)natural join
-- 두 테이블에 공통 칼럼이 있으면 별다른 조건 없이 암묵젇으로 조인이 됨
-- 쓸일 없음 
select a.first_name, b.title
from employees a
natural join titles b
           -- a.emp_no = b.emp_no  생략
where b.to_date = '9999-01-01';     -- row 선택 조건


-- 2)join ~ using
select a.first_name, b.title
from employees a join titles b using(emp_no)
where b.to_date = '9999-01-01';     -- row 선택 조건

-- 3)join ~ on
select a.first_name, b.title
from employees a join titles b on a.emp_no = b.emp_no
where b.to_date = '9999-01-01';     -- row 선택 조건


-- outer join
-- insert into dept values(null, '총무');
-- insert into dept values(null, '영업');
-- insert into dept values(null, '개발');
-- insert into dept values(null, '기획');
select * from dept;
-- insert into emp values(null, '둘리',1);
-- insert into emp values(null, '마이콜',2);
-- insert into emp values(null, '또치',3);
-- insert into emp values(null, '길동',null);
select * from emp;

select a.name as '이름', b.name as '부서'
from emp a join dept b on a.dept_no = b.no;

select a.name as '이름', ifnull( b.name, '없음') as '부서'
from emp a left join dept b on a.dept_no = b.no;

select a.name as '이름', b.name as '부서'
from emp a right join dept b on a.dept_no = b.no;



