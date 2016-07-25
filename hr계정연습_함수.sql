desc employees;

select LOWER('Database System') from dual;

select UPPER('Database System') from dual;

select INITCAP('database system') from dual;

select concat( 'data', 'base' ) from dual;

select 'data' || 'base'  from dual;

select SUBSTR( 'database', 2, 5) from dual;

select length( 'databse' ) from dual;

select instr( 'Database', 'ba' ) from dual;

select first_name, LPAD(salary, 10, '*') from employees;

select first_name, RPAD(salary, 10, '*') from employees;

select trim( '#' from '#####database#######') from dual;

select trim( ' ' from '  data      base     ') from dual;

select ABS( -20000 ) from dual;

select floor( 2.65 ) from dual;

select ceil( 2.15 ) from dual;

select power( 2, 10 ) from dual;

select trunc( 3.145677, 2) from dual;


select first_name, hire_date from employees;

SELECT value FROM nls_session_parameters WHERE parameter = 'NLS_DATE_FORMAT';

select first_name, to_char(hire_date, 'yyyy-mm-dd pm hh24:mi:ss') from employees;

select first_name, to_char(hire_date, 'yyyy-mm-dd')
  from employees
where '2007' <= to_char(hire_date, 'yyyy-mm-dd'); 

select to_char( SYSDATE, 'yyyy-mm-dd pm hh24:mi:ss' ) from dual;
select to_date( '2007,12,10', 'yyyy,mm,dd') from dual;

select first_name, salary from employees;  
select first_name, to_char(salary, '999999' ) from employees;  
select first_name, to_char(salary, '999,999' ) from employees;  
select first_name, to_char(salary, '0,999,999' ) from employees;  
select first_name, to_char(salary, '$99,999' ) from employees;  
select first_name, to_char(salary, 'L99,999' ) from employees;  

select to_char(-100000, '999999MI' ) from dual;  
select to_char(-100000, '999999PR' ) from dual;  
select to_char(123, 'RN' ) from dual;  
select to_char(123, 'rn' ) from dual;  
select to_char(-100000, 'S999999' ) from dual;  
select to_char(100000, 'S999999' ) from dual;  
select to_char(1024, 'XXXX' ) from dual;

select first_name, salary + salary*NVL(commission_pct, 0) from employees;
select first_name, salary + salary*NVL2(commission_pct, commission_pct, 0) from employees;

select * from jobs;


select first_name, 
       job_id,
       salary,
       case job_id
            when 'AD_VP' then salary*1.1
            when 'FI_MGR' then salary*1.5
            else salary
       end AS "이번달 월급"
  from employees;

select first_name, 
       job_id,
       salary,
       case job_id
            when 'AD_VP' then salary*1.1
            when 'FI_MGR' then salary*1.5
            else salary
       end,
       decode( job_id, 'AD_VP',  salary*1.1,
                       'FI_MGR', salary*1.5,
                                 salary)
  from employees;
  

