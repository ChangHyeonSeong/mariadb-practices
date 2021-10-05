-- subquery
-- 1) from 절의 서브 쿼리
select now() as n, sysdate() as b, 3 + 1 as c;

select * 
  from (select now() as n, sysdate() as b, 3 + 1 as c) s;

-- 예제
-- 현재 Fai Bale이 근무하는 부서에서 근무하는 직원의 사번, 전체 이름을 출력해보세요. 
select de.dept_no
from employees e, dept_emp de
where e.emp_no = de.emp_no
  and de.to_date = '9999-01-01'
  and concat(e.first_name, ' ' , e.last_name) = 'Fai Bale';
  
select e.emp_no, e.first_name 
from employees e, dept_emp de
where e.emp_no = de.emp_no
  and de.to_date = '9999-01-01'
  and de.dept_no = (select de.dept_no
                      from employees e, dept_emp de
                     where e.emp_no = de.emp_no
					   and de.to_date = '9999-01-01'
                       and concat(e.first_name, ' ' , e.last_name) = 'Fai Bale');
                       
-- 2-1) 단일행 연산자: =, <, >, >=, <=, <>, !=
-- 실습문제 1:
-- 현재 전체 사원의 평균 연봉보다 적은 급여를 받는 사원의 이름, 급여를 출력하세요
select avg(salary) 
  from salaries 
 where to_date = '9999-01-01';

select e.first_name, s.salary
  from employees e, salaries s
 where e.emp_no = s.emp_no
   and s.to_date = '9999-01-01'
   and s.salary < (select avg(salary) 
                     from salaries 
                    where to_date = '9999-01-01')
order by s.salary desc;

-- 실습문제 2:
-- 현재 가장 적은 평균 급여의 직책과 평균급여를 출력하세요
-- Engineer 2000
-- min_avg_salary

-- 1) 직책별 평균 급여
select t.title, avg(s.salary) as avg_salary
  from titles t, salaries s
 where t.emp_no = s.emp_no
   and t.to_date = '9999-01-01'
   and s.to_date = '9999-01-01'
group by t.title
order by avg_salary;

-- 2) 가장 작은 평균 급여
select min(a.avg_salary)
from (select t.title, avg(s.salary) as avg_salary
        from titles t, salaries s
       where t.emp_no = s.emp_no
         and t.to_date = '9999-01-01'
         and s.to_date = '9999-01-01'
	group by t.title) a;

-- title 출력하기 위해
  select t.title, avg(s.salary)
    from titles t, salaries s
   where t.emp_no = s.emp_no
     and t.to_date = '9999-01-01'
     and s.to_date = '9999-01-01'
group by t.title
  having avg(s.salary) = (select min(a.avg_salary)
                            from (select t.title, avg(s.salary) as avg_salary
								    from titles t, salaries s
                                   where t.emp_no = s.emp_no
                                     and t.to_date = '9999-01-01'
                                     and s.to_date = '9999-01-01'
	                            group by t.title) a);
            
-- 3) 가장 작은 평균 급여 : sol2  limit 사용 mysql한정 
  select t.title, avg(s.salary)
    from titles t, salaries s
   where t.emp_no = s.emp_no
     and t.to_date = '9999-01-01'
     and s.to_date = '9999-01-01'
group by t.title
order by avg(s.salary) asc
    limit 0, 1; 
    
-- 2-2) 복수행 연산자: in, not in, any, all

-- any 사용법
-- 1. =any : in
-- 2. >any, >=any : 최소값
-- 3. <any, <=any : 최대값
-- 4. <>any : not in 동일 

-- all 사용법
-- 1. =all (x)
-- 2. >all, >=all : 최대값
-- 3. <all, <=all : 최소값


-- 실습문제3: 현재 급여가 50000 이상인 직원의 이름을 출력하세요.
-- 대혁 50001
-- 둘리 50002

-- sol1 : join
select e.first_name, s.salary
 from employees e, salaries s
 where e.emp_no = s.emp_no
 and s.to_date = '9999-01-01'
 and s.salary > 50000
 order by s.salary asc;


-- sol2 : subquery(in)
select e.first_name, s.salary
from employees e, salaries s
where e.emp_no = s.emp_no
  and (e.emp_no, s.salary) in (select emp_no , salary
                                 from salaries
                                where to_date = '9999-01-01'
                                  and salary > 50000);
                    
-- sol2 : subquery(=any)
select e.first_name, s.salary
from employees e, salaries s
where e.emp_no = s.emp_no
  and (e.emp_no, s.salary) =any (select emp_no , salary
                                   from salaries
                                  where to_date = '9999-01-01'
                                    and salary > 50000);



-- 실습문제4: 각 부서별로 최고 월급을 받는 직원의 이름과 월급을 출력하세요
-- 대혁 40000
-- 둘리 50000

  select e.dept_no, max(s.salary)
    from dept_emp e, salaries s
   where e.emp_no = s.emp_no
     and e.to_date = '9999-01-01'
 	 and s.to_date = '9999-01-01'
group by e.dept_no;

-- sol1 : where subquery =any(in)
select d.dept_name, e.first_name, s.salary
  from dept_emp de, salaries s, employees e, departments d
 where de.emp_no = s.emp_no
   and s.emp_no = e.emp_no
   and de.dept_no = d.dept_no
   and de.to_date = '9999-01-01'
   and s.to_date = '9999-01-01'
   and (de.dept_no, s.salary) in (select e.dept_no, max(s.salary)
                                    from dept_emp e, salaries s
								   where e.emp_no = s.emp_no
                                     and e.to_date = '9999-01-01'
 	                                 and s.to_date = '9999-01-01'
                                  group by e.dept_no);

-- sol1 : from subquery 
select  e.first_name, s.salary
  from dept_emp de, 
       salaries s, 
       employees e,
       (select e.dept_no, max(s.salary) as max_salary
        from dept_emp e, salaries s
	   where e.emp_no = s.emp_no
         and e.to_date = '9999-01-01'
 	     and s.to_date = '9999-01-01'
     group by e.dept_no) d
 where de.emp_no = s.emp_no
   and s.emp_no = e.emp_no
   and de.dept_no = d.dept_no
   and de.to_date = '9999-01-01'
   and s.to_date = '9999-01-01';






