-- count
select count(*) from employees;

select count(MANAGER_ID) from employees;

--AVG
select AVG(salary)
  from employees;
  
  select department_id, to_char(AVG(salary), '99999')
    from employees
group by department_id;  

  select department_id,
         to_char(AVG(salary), '99,999') AS avg_salary,
         to_char(SUM(salary), '999,999,999'),
         to_char(MAX(salary), '99,999'),
         to_char(MIN(salary), '99,999')
    from employees
group by department_id
order by avg_salary;  
 
 
  select department_id,
         AVG(salary)
    from employees
group by department_id
  having AVG(salary) > 5000; 

-- 사장님을 뺀 사원들의 부서별 평균 연봉이 5,000 이상인 부서와 평균연봉을 평균 연봉이 높은 순으로 출력
  select department_id,
         AVG(salary)
    from employees
   where department_id is not null 
group by department_id
  having AVG(salary) > 5000
order by AVG(salary) DESC;  

