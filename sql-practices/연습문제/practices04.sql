-- 문제1.
-- 현재 평균 연봉보다 많은 월급을 받는 직원은 몇 명이나 있습니까?
select count(e.emp_no)
from  employees e join salaries s on e.emp_no = s.emp_no
where s.to_date = '9999-01-01'
  and s.salary > (select avg(salary)
                    from salaries
                   where to_date = '9999-01-01');
-- 문제2. 
-- 현재, 각 부서별로 최고의 급여를 받는 사원의 사번, 이름, 부서 연봉을 조회하세요. 단 조회결과는 연봉의 내림차순으로 정렬되어 나타나야 합니다. 

select e.emp_no as '사번', e.first_name as '이름', ds.부서번호, ds.최고연봉 
from employees e join (select de.emp_no as '사번', de.dept_no as '부서번호',max(s.salary) as '최고연봉'
						from salaries s join dept_emp de on s.emp_no = de.emp_no
						where s.to_date = '9999-01-01'
                          and de.to_date = '9999-01-01'
						group by de.dept_no) ds on e.emp_no = ds.사번
order by ds.최고연봉 desc;

--  문제3.
-- 현재, 자신의 부서 평균 급여보다 연봉(salary)이 많은 사원의 사번, 이름과 연봉을 조회하세요 
select e.emp_no as '사번', e.first_name as '이름', s.salary as '연봉'
from employees e join salaries s on e.emp_no = s.emp_no
				 join dept_emp de on s.emp_no = de.emp_no
				 join (select avg(s.salary) as '평균연봉' 
						 from salaries s join dept_emp de on s.emp_no = de.emp_no
						where s.to_date = '9999-01-01'
						  and de.to_date = '9999-01-01'
					 group by de.dept_no) ds on de.dept_no = ds.dept_no  
where s.to_date = '9999-01-01'
  and de.to_date = '9999-01-01'
  and s.salary > ds.평균연봉;
  
-- 문제4.
-- 현재, 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력해 보세요.
select e.emp_no as '사번', e.first_name as '이름', dme.매니져이름,d.dept_name as '부서이름'
from employees e join dept_emp de on e.emp_no = de.emp_no
				 join departments d on de.dept_no = d.dept_no
                 join (select dm.dept_no as '부서번호', e.first_name as '매니져이름'
						from dept_manager dm join employees e on dm.emp_no = e.emp_no) dme 
				 on d.dept_no = dme.부서번호
where de.to_date = '9999-01-01';
                 
select dm.dept_no as '부서번호', e.first_name as '이름'
from dept_manager dm join employees e using(emp_no);


-- 문제5.
-- 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 연봉을 조회하고 연봉 순으로 출력하세요.
select e.emp_no as '사번', e.first_name as '이름', t.title as '직책', s.salary as '연봉'
from employees e join salaries s on e.emp_no = s.emp_no
				 join dept_emp de on s.emp_no = de.emp_no
                 join titles t on de.emp_no = t.emp_no
 where s.to_date = '9999-01-01'
   and de.to_date = '9999-01-01' 
   and t.to_date = '9999-01-01' 
group by de.dept_no
having avg(s.salary) = (select max(sd.평균연봉)
						  from (select avg(s.salary) as '평균연봉'
	                              from salaries s join dept_emp de on s.emp_no = de.emp_no
                                 where s.to_date = '9999-01-01'
                                   and de.to_date = '9999-01-01'
                                 group by de.dept_no) sd);

-- 문제6.
-- 평균 연봉이 가장 높은 부서는?
select de.dept_no
  from salaries s join dept_emp de on s.emp_no = de.emp_no
 where s.to_date = '9999-01-01'
   and de.to_date = '9999-01-01' 
group by de.dept_no
having avg(s.salary) =  (select max(sd.평균연봉)
						  from (select avg(s.salary) as '평균연봉'
	                              from salaries s join dept_emp de on s.emp_no = de.emp_no
                                 where s.to_date = '9999-01-01'
                                   and de.to_date = '9999-01-01'
                                 group by de.dept_no) sd);


-- 문제7.
-- 평균 연봉이 가장 높은 직책?
select t.title
  from salaries s join titles t on s.emp_no = t.emp_no
 where s.to_date = '9999-01-01'
   and t.to_date = '9999-01-01' 
group by t.title
having avg(s.salary) = (select max(st.평균연봉)
						  from (select avg(s.salary) as '평균연봉'
	                              from salaries s join titles t on s.emp_no = t.emp_no
                                 where s.to_date = '9999-01-01'
                                   and t.to_date = '9999-01-01'
                                 group by t.title) st);



-- 문제8.
-- 현재 자신의 매니저보다 높은 연봉을 받고 있는 직원은?
-- 부서이름, 사원이름, 연봉, 매니저 이름, 메니저 연봉 순으로 출력합니다.
select d.dept_name as '부서이름', e.first_name as '사원이름', s.salary as '사원연봉', dm.매니져이름, dm.매니져연봉
from employees e, 
     salaries s, 
	 dept_emp de, 
     departments d,
     (select dm.dept_no as '부서번호',e.first_name as '매니져이름' ,s.salary as '매니져연봉'
        from employees e ,dept_manager dm, salaries s 
       where e.emp_no = dm.emp_no
         and dm.emp_no = s.emp_no
         and s.to_date = '9999-01-01'
         and dm.to_date = '9999-01-01') dm
where e.emp_no = s.emp_no
  and s.emp_no = de.emp_no
  and de.dept_no = d.dept_no
  and d.dept_no = dm.부서번호
  and s.to_date = '9999-01-01'
  and de.to_date = '9999-01-01'
  and s.salary > dm.매니져연봉;
  
-- select dm.dept_no as '부서번호',e.first_name as '매니져이름' ,s.salary as '매니져연봉'
-- from employees e ,dept_manager dm, salaries s 
-- where e.emp_no = dm.emp_no
--   and dm.emp_no = s.emp_no
--   and s.to_date = '9999-01-01'
--   and dm.to_date = '9999-01-01';