-- 함수 : 날짜 함수

-- CURDATE(), CURRENT_DATE;
select CURDATE(), CURRENT_DATE;

-- CURDATE(), CURRENT_TIME;
select CUTRIME(), CURRENT_TIME;

-- now() vs sysdate()
select now(), sysdate();
select now(), sleep(2), now(); -- now() 쿼리가 시작된 시간
select now(), sleep(2), sysdate();-- sysdate() 함수가 실행된 시간

-- date_format(date, format)
select date_format(now(), '%Y년-%m월-%d일 %h시 %i분 %s초');
select date_format(now(), '%y년-%m월-%d일 %h시 %i분 %s초');
select date_format(now(), '%y년-%M월-%d일 %h시 %i분 %s초');
select date_format(now(), '%Y년-%c월-%d일 %h시 %i분 %s초');

-- period_diff
-- YYMM, YYYYMM 표기되는 p1과 p2의 차이 개월을 반환 한다.

-- 예) 근무 개월 수 수를 출력 
select first_name,
	   period_diff(date_format(curdate(),'%Y%m'), date_format(hire_date,'%Y%m')) as month
 from employees
 order by month;
 
 -- date_add(= adddate), data_sub(= subdate)
 -- 날짜를 date에 type(day, month, year) 형식의 표현식(expr) 더하거나 뺸다
 -- 예제) 각 사원들의 근무 년수가 5년이 되는 날은 언제 인가요?
 select first_name,
        hire_date,
        date_add(hire_date, interval 5 year)
 from employees;
 
 -- cast
 select '12345' + 10, cast('12345' as int) + 10;
 select date_format(cast('2021-10-01' as date), '%Y-%m-%d');
 select cast(cast(1-2 as unsigned) as signed);
 
 -- mysql type
 -- varchar ->크기제한있음, char, text, CLOB(Character Large OBject)
 -- signed(unsigned), int(integar), medium int, big int, int(11)
 -- float, double
 -- time, date, datetime
 -- LOB: CLOB, BLOB
 
 
 
 
 
 
 
 