--문제1
select a.FIRST_NAME, b.DEPARTMENT_NAME, c.FIRST_NAME
  from EMPLOYEES a, DEPARTMENTS b, EMPLOYEES c
 where a.DEPARTMENT_ID = b.DEPARTMENT_ID
   and a.EMPLOYEE_ID = c.MANAGER_ID;
   
select a.FIRST_NAME, b.DEPARTMENT_NAME, c.FIRST_NAME
  from EMPLOYEES a 
  join DEPARTMENTS b on a.DEPARTMENT_ID = b.DEPARTMENT_ID
  join EMPLOYEES c on a.EMPLOYEE_ID = c.MANAGER_ID;
  
--문제2
select b.REGION_NAME,
       a.COUNTRY_NAME
  from COUNTRIES a,
       REGIONS b
 where a.REGION_ID = b.REGION_ID
order by b.REGION_NAME desc, a.COUNTRY_NAME desc; 

--문제3
select a.DEPARTMENT_NAME,
       b.FIRST_NAME, 
       c.CITY, 
       d.COUNTRY_NAME, 
       e.REGION_NAME
  from DEPARTMENTS a,
       EMPLOYEES b,
       LOCATIONS c,
       COUNTRIES d,
       REGIONS e
 where a.MANAGER_ID = b.EMPLOYEE_ID
   and a.LOCATION_ID = c.LOCATION_ID
   and c.COUNTRY_ID = d.COUNTRY_ID
   and d.REGION_ID = e.REGION_ID;

--문제4
select c.FIRST_NAME || ' ' || c.LAST_NAME
  from JOB_HISTORY a,
       JOBS b,
       EMPLOYEES c
 where a.JOB_ID = b.JOB_ID
   and a.EMPLOYEE_ID = c.EMPLOYEE_ID 
   and b.JOB_TITLE = 'Public Accountant';

-- 문제5
select a.EMPLOYEE_ID, a.FIRST_NAME, a.LAST_NAME, b.DEPARTMENT_NAME
  from EMPLOYEES a,
       DEPARTMENTS b
 where a.DEPARTMENT_ID = b.DEPARTMENT_ID
ORDER BY a.LAST_NAME ASC;
       
