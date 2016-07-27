-- connect by prior ( 계층구조 데이터 표현할 때, 트리, 디렉토리 구조, 조직도)
    select level, employee_id, manager_id,last_name
      from employees
start with manager_id is null
connect by prior employee_id = manager_id
order by level;

--rollup, cube

   select department_id, job_id, sum(salary)
     from employees
 group by rollup(department_id, job_id);
 
   select department_id, job_id, sum(salary)
     from employees
 group by cube(department_id, job_id);
 
 --top-k rownum ( 게시판에서 페이징처리)
 select rownum, employee_id, first_name
   from employees
  where rownum < 6; 

-- order by 이전에 where 절까지 실행되서 선택된 row가 있는 임시 테이블에서 rownum이 세팅됨 
  select rownum, employee_id, first_name
    from employees
order by first_name;  
   
-- 해결방법(subquery)
select rownum, employee_id, first_name
  from (  select employee_id, first_name
            from employees
        order by first_name )
 where rownum < 10;    
 
select rownum, employee_id, first_name
  from (  select employee_id, first_name
            from employees
        order by first_name )
 where 10 < rownum AND rownum < 20;       

-- 최종 해결 방법
select *
  from ( select rownum as rn, employee_id, first_name
           from (  select employee_id, first_name
                     from employees
                 order by first_name ))
 where (4-1)*10+1 <= rn AND rn <= 4*10;       
                 
-- rowid(pseudo column rownum, sysdate, rowid)
select rowid, first_name from employees;
