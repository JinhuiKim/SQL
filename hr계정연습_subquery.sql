select salary from employees where first_name = 'Jack';

select first_name, salary
  from EMPLOYEES
 where salary > 8400;
 
select first_name, salary
  from EMPLOYEES
 where salary > (select salary from employees where first_name = 'Jack');
 
 -- 문제점
select first_name, salary
  from EMPLOYEES
 where salary > (select salary from employees where first_name = 'Karen');

-- 연습1
select min(salary) from employees;
select first_name, salary
  from employees
 where salary = (select min(salary) from employees); 

select first_name, salary
  from employees
 where salary < (select avg(salary) from employees);
 
-- subquery 
select first_name, department_id
  from EMPLOYEES
 where department_id = 
  ( select department_id from departments where department_name = 'Purchasing' );

--join
select a.first_name, a.department_id
  from EMPLOYEES a, DEPARTMENTS b
 where a.DEPARTMENT_ID = b.DEPARTMENT_ID
   and b.DEPARTMENT_NAME = 'Purchasing';

-- subquery의 결과가 multi row
select first_name, salary
  from employees
 where salary in (select min(salary) from employees group by department_id);

select first_name, salary
  from employees
 where salary = any (select min(salary) from employees group by department_id);
 
-- select min(salary) from employees group by department_id; 

-- multi row & multi colum
select first_name, salary
  from employees
 where (department_id, salary) in (select department_id, min(salary) from employees group by department_id);

select first_name, salary
  from employees
 where (salary, department_id ) in (select min(salary), department_id from employees group by department_id);
