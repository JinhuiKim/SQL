--문제1
  SELECT ( first_name || ' ' || last_name ) AS "이름",
         email AS "이메일",
         phone_number AS "전화번호"
    FROM employees
ORDER BY hire_date DESC;

--문제2
  SELECT job_title, max_salary
    FROM jobs
ORDER BY max_salary DESC;


--문제3
SELECT COUNT(*)
  FROM employees
 WHERE manager_id is NULL;
 
--문제4
  SELECT job_title, max_salary
    FROM jobs
ORDER BY job_title ASC, max_salary DESC;

--문제5
select count(*) from departments;

--문제6
  SELECT department_name
    FROM departments
ORDER BY length(department_name) DESC;  

--문제7
SELECT count(*)
  FROM departments
 WHERE manager_id is null;
 
--문제8
  SELECT upper(country_name) AS cn
    FROM countries
ORDER BY cn DESC;

--문제9
  SELECT region_name
    FROM regions
ORDER BY length(region_name) DESC;


--문제10
SELECT distinct(LOWER(city))
  FROM locations;
  

