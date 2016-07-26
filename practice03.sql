--문제1
select max(SALARY) AS "최고임금",
       min(SALARY) AS "최저임금",
       ( max(SALARY) - min(SALARY) ) AS "최고임금 - 최저임금"
  from EMPLOYEES;

--문제2
select to_char( max(HIRE_DATE), 'YYYY"년" MM"월" DD"일"' )
  from EMPLOYEES;
  
--문제3
  select DEPARTMENT_ID,
         to_char( AVG(SALARY), '999,999' ) AS "평균임금",
         to_char( MAX(SALARY), '999,999' ) AS "최고임금",
         to_char( MIN(SALARY), '999,999' ) AS "최저임금"
    from EMPLOYEES
group by DEPARTMENT_ID
order by "평균임금" desc, "최고임금" desc, "최저임금" desc;
  
--문제4
  select JOB_ID,
         to_char( AVG(SALARY), '999,999' ) AS "평균임금",
         to_char( MAX(SALARY), '999,999' ) AS "최고임금",
         to_char( MIN(SALARY), '999,999' ) AS "최저임금"
    from EMPLOYEES
group by JOB_ID
order by "평균임금" desc, "최고임금" desc, "최저임금" desc;

--문제5
select to_char( min(HIRE_DATE), 'YYYY"년" MM"월" DD"일"' )
  from EMPLOYEES;
  
--문제6
  select DEPARTMENT_ID,
         to_char( AVG(SALARY), '999,999' ) AS "평균임금",
         to_char( MIN(SALARY), '999,999' ) AS "최저임금",
         to_char( ( AVG(SALARY) - MIN(SALARY) ), '999,999' ) AS "평균임금 - 최저임금"
    from EMPLOYEES
group by DEPARTMENT_ID
  having ( AVG(SALARY) - MIN(SALARY) ) < 2000 
order by "평균임금 - 최저임금" desc;

--문제7
--1)
  select JOB_ID,
         to_char( ( MAX(SALARY) - MIN(SALARY) ), '999,999' ) AS "최고임금 - 최저임금"
    from EMPLOYEES
group by JOB_ID
order by "최고임금 - 최저임금"desc;

--2)
select JOB_TITLE
  from JOBS
 where JOB_ID = 'SA_REP'; 

--SUBQUERY 사용
select a.JOB_ID, b.JOB_TITLE, a.DIFF_SALARY
  from (   select JOB_ID,
                  ( MAX(SALARY) - MIN(SALARY) ) AS DIFF_SALARY
             from EMPLOYEES
         group by JOB_ID ) a,
       JOBS b 
 where a.JOB_ID = b.JOB_ID
   and a.DIFF_SALARY = ( select MAX( DIFF_SALARY )
                           from (   select ( MAX(SALARY) - MIN(SALARY) ) AS DIFF_SALARY
                                      from EMPLOYEES
                                  group by JOB_ID ) );