--문제1
select count(*) || '명'
  from employees
 where salary < ( select avg(salary) from employees );

--문제2
  select employee_id, last_name, salary
    from employees
   where (department_id, salary) in (   select department_id, max(salary) 
                                          from employees
                                      group by department_id )
order by salary desc;                                    
                  
--문제3
  select a.job_title, b.sum_salary
    from jobs a,
         (   select job_id, sum(salary) as sum_salary
               from employees
           group by job_id ) b
   where a.job_id = b.job_id
order by b.sum_salary desc; 

--문제4
select employee_id, last_name, salary
  from employees a,
       ( select department_id, avg(salary) avg_salary from employees group by department_id ) b
 where a.department_id = b.department_id
   and a.salary < b.avg_salary;