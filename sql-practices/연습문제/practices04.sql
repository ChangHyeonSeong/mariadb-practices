-- 문제1.
-- 현재 평균 연봉보다 많은 월급을 받는 직원은 몇 명이나 있습니까?
                   
select count(emp_no)
from  salaries
where to_date = '9999-01-01'
  and salary > (select avg(salary)
                    from salaries
                   where to_date = '9999-01-01');
                   
select count(e.emp_no)
from  employees e join salaries s on e.emp_no = s.emp_no
where s.to_date = '9999-01-01'
  and s.salary > (select avg(salary)
                    from salaries
                   where to_date = '9999-01-01');                  
                   
-- 문제2. 틀림
-- 현재, 각 부서별로 최고의 급여를 받는 사원의 사번, 이름, 부서 연봉을 조회하세요. 단 조회결과는 연봉의 내림차순으로 정렬되어 나타나야 합니다. 

-- from 절
select e.emp_no as '사번', e.first_name as '이름', d.dept_name as '부서이름', ds.최고연봉 
from employees e join dept_emp de on e.emp_no = de.emp_no 
                 join salaries s on de.emp_no = s.emp_no
                 join departments d on de.dept_no = d.dept_no
				 join (select de.dept_no as '부서번호',max(s.salary) as '최고연봉'
						from salaries s join dept_emp de on s.emp_no = de.emp_no
					   where s.to_date = '9999-01-01'
						 and de.to_date = '9999-01-01'
					group by de.dept_no) ds on de.dept_no = ds.부서번호
where de.to_date = '9999-01-01'
  and s.to_date = '9999-01-01'
  and s.salary = ds.최고연봉
order by ds.최고연봉 desc;

-- where 절
select e.emp_no as '사번', e.first_name as '이름', d.dept_name as '부서이름',  s.salary as '연봉' 
from employees e join salaries s on e.emp_no = s.emp_no
                 join dept_emp de on s.emp_no = de.emp_no
                 join departments d on de.dept_no = d.dept_no
where (de.dept_no, s.salary) in (select de.dept_no, max(s.salary)
					               from salaries s join dept_emp de on s.emp_no = de.emp_no
					              where s.to_date = '9999-01-01'
					                and de.to_date = '9999-01-01'
					           group by de.dept_no)
order by s.salary desc;



--  문제3.
-- 현재, 자신의 부서 평균 급여보다 연봉(salary)이 많은 사원의 사번, 이름과 연봉을 조회하세요 
select e.emp_no as '사번', e.first_name as '이름', s.salary as '연봉'
from employees e join salaries s on e.emp_no = s.emp_no
				 join dept_emp de on s.emp_no = de.emp_no
				 join (select de.dept_no, avg(s.salary) as '평균연봉' 
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
                 
-- select dm.dept_no as '부서번호', e.first_name as '이름'
-- from dept_manager dm join employees e using(emp_no);




-- 문제5.  틀림
-- 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 연봉을 조회하고 연봉 순으로 출력하세요.
select e.emp_no as '사번', e.first_name as '이름', t.title as '직책', s.salary as '연봉',de.dept_no as '부서번호'
from employees e join salaries s on e.emp_no = s.emp_no
				 join dept_emp de on s.emp_no = de.emp_no
                 join titles t on de.emp_no = t.emp_no
 where s.to_date = '9999-01-01'
   and de.to_date = '9999-01-01' 
   and t.to_date = '9999-01-01' 
   and de.dept_no = ( select de.dept_no                            
                       from dept_emp de join salaries s on de.emp_no = s.emp_no
                      where de.to_date = '9999-01-01'
                        and s.to_date = '9999-01-01'
                   group by de.dept_no
                 having avg(s.salary) =  (select max(sd.평균연봉)
					                       from (select de.dept_no as '부서번호', avg(s.salary) as '평균연봉'
                                                   from salaries s join dept_emp de on s.emp_no = de.emp_no
							                      where s.to_date = '9999-01-01'
								                    and de.to_date = '9999-01-01'
							                     group by de.dept_no) sd)   ) 
order by s.salary desc;
                            

-- LIMIT 0 , 1 사용                              
SELECT 
    a.emp_no,
    CONCAT(a.first_name, ' ', a.last_name) AS name,
    b.title,
    c.salary,
    d.dept_no
FROM
    employees a,
    titles b,
    salaries c,
    dept_emp d
WHERE
    a.emp_no = b.emp_no
        AND a.emp_no = c.emp_no
        AND a.emp_no = d.emp_no
        AND b.to_date = '9999-01-01'
        AND c.to_date = '9999-01-01'
        AND d.to_date = '9999-01-01'
        AND d.dept_no = (SELECT 
            dept_no
        FROM
            (SELECT 
                dept_no, AVG(salary) AS avg_salary
            FROM
                salaries a, dept_emp b
            WHERE
                a.emp_no = b.emp_no
                    AND a.to_date = '9999-01-01'
                    AND b.to_date = '9999-01-01'
            GROUP BY dept_no
            ORDER BY avg_salary DESC
            LIMIT 0 , 1) a)
ORDER BY c.salary DESC;


SELECT 
                dept_no, AVG(salary) AS avg_salary
            FROM
                salaries a, dept_emp b
            WHERE
                a.emp_no = b.emp_no
                    AND a.to_date = '9999-01-01'
                    AND b.to_date = '9999-01-01'
            GROUP BY dept_no
            ORDER BY avg_salary DESC
            LIMIT 0 , 1;

-- 문제6.
-- 평균 연봉이 가장 높은 부서는?
select de.dept_no, d.dept_name, avg(s.salary)
  from salaries s join dept_emp de on s.emp_no = de.emp_no
                  join departments d on de.dept_no = d.dept_no
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
select t.title, avg(s.salary)
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
  



