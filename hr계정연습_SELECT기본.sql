select employee_id, salary, commission_pct from EMPLOYEES;
select first_name, last_name from EMPLOYEES;

select ( first_name || ' ' || last_name ) AS "name" from EMPLOYEES;

select 2 + 3 from dual;
select (salary + salary*0.5) AS "salary" from employees;

select employee_id, commission_pct, nvl(salary + salary*commission_pct, 0) from employees;

select employee_id, 1000, sysdate from employees;

select '성은 ' || last_name || '이요, 이름은 ' || first_name from employees;

select first_name, salary from employees where employee_id = 200;

select (first_name||' '||last_name ) AS "full name" 
  from employees 
 where salary > 20000;
 
select JOB_ID from jobs where job_title = 'President'; 

select first_name, job_id from employees where job_id <> 'AD PRES';

select * from locations where city = 'Roma';

select * from departments where location_id=1000;

select * from departments;

select * from departments where location_id in( 1700, 1800);

select * from departments where location_id = 1700 OR location_id = 1800;

select * from departments where location_id not in( 1700, 1800);

select * from departments where location_id <> 1700 AND location_id <> 1800;

select * from employees where salary between 1000 AND 10000;

select * from employees where 1000 <= salary AND salary <= 10000;

select first_name from employees where first_name like 'A%';

select first_name from employees where first_name like '%es';

select first_name from employees where first_name like '%il%';

select first_name from employees where first_name like 'A___';

select employee_id, commission_pct from employees where commission_pct is not null;


select first_name, last_name, salary from employees order by salary desc;

  select first_name, last_name, salary
    from employees 
order by salary desc, first_name asc;


