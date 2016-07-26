--문제1
select (a.first_name||' '||a.last_name) as "이름",
       a.salary as "월급",
       b.department_name as "부서",
       to_char(a.hire_date, 'yyyy"년" mm"월" dd"일"') as "입사일" 
  from employees a,
       departments b
 where a.department_id = b.department_id
   and a.hire_date = (select max(hire_date) from employees); 

--문제2
select a.employee_id, a.last_name, a.salary
  from employees a,
       (  select department_id, avg(salary) as avg_salary 
            from employees 
        group by department_id) b
 where a.department_id = b.department_id
   and a.salary > b.avg_salary; 

--문제3
select a.employee_id, a.first_name, a.last_name, b.job_title, a.salary
  from employees a,
       jobs b
 where a.job_id = b.job_id
   and a.department_id = (  select department_id 
                              from employees
                          group by department_id
                            having avg(salary) = (  select max(avg(salary))
                                                      from employees
                                                  group by department_id) );

--문제4
--1)
select department_name
  from departments
 where department_id = (  select department_id
                            from employees
                        group by department_id
                          having avg(salary) = (  select max(avg(salary))
                                                    from employees
                                                group by department_id));
--2) 또는,
select a.department_name
  from departments a,
       (  select department_id, avg(salary) as avg_salary
            from employees
        group by department_id) b
 where a.department_id = b.department_id
   and b.avg_salary = (  select max(avg(salary))
                           from employees
                       group by department_id);

--문제5
select city
  from locations
 where location_id = (  select location_id
                          from (select b.location_id, a.salary
                                  from employees a,
                                       departments b
                                 where a.department_id = b.department_id)
                      group by location_id
                        having avg(salary) = (  select max(avg(salary))
                                                  from (  select b.location_id, a.salary
                                                            from employees a,
                                                                 departments b
                                                           where a.department_id = b.department_id)
                                              group by location_id));

 
--문제6
select job_title
  from jobs
 where job_id = (  select job_id
                     from employees
                 group by job_id
                   having avg(salary) = (  select max(avg(salary))
                                             from employees
                                         group by job_id));
