use hr;
show tables;

select * from employees;
select * from departments; -- COUNT 27
select * from regions;
select * from jobs; -- COUNT 19
select * from job_history; -- COUNT 10
select * from locations;
select * from countries;  -- count 25

-- find countries count as per region
select region_id,count(country_id) from countries group by region_id;

-- FIND CITY COUNT AS PER COUNTRIES
SELECT COUNTRY_ID, COUNT(LOCATION_ID) FROM LOCATIONS GROUP BY COUNTRY_ID;

SELECT * FROM JOB_HISTORY;
DESC JOB_HISTORY;

-- WRITE A QUERY TO DISPLAY THE NAME ( FIRST AND LEFT) FOR HTOSE EMPLOYEES WHO GETS MORE SALARY 
-- THAN THE EMPLOYEE WHOSE ID IS 163.
select * from employees;
select employee_id,first_name,last_name,salary from employees
where employee_id=163;  -- 9500/-
select employee_id,first_name,last_name,salary from employees
where salary>9500; -- ans for the query without using sub-query
-- OR 
select employee_id,first_name,last_name,salary from employees
where salary>(select salary from employees where employee_id=163); -- using sub-query 

-- WRITE A QUERY TO DISPLAY ALL THE INFOR OF EMPLOYEES WHOSE SALARY IS WITHIN THE
-- RANGE OF SMALLEST SALARY AND 2500.
select min(salary) from employees;
select * from employees where salary between 2100 and 2500; -- 2 diff queries are used i.e., w/o using sub-query

select * from employees where salary between (select min(salary) from employees) and 2500;

-- WAQ A QUERY TO DISPLAY THE NAME (FIRST AND LAST),SALARY,DEPARTMENT_ID,JOB_ID FOR THOSE EMOLOYEES
-- WHO WORKS IN THE SAME DESIGNATION AS T HE EMPLOYEEE WORKS WHOSE ID IS 169.
select employee_id,concat(first_name,' ',last_name) as 'Name',salary,department_id,job_id from employees
where job_id in(select job_id from employees where employee_id=111);

-- WAQ TO DISPLAY THE NAME (FIRST AND LAST), SALARY , DEPARTMENT_ID, JOB_ID FOR THOSE EMPLOYEES
-- WHO EARN SCUH AMOUNT OF SAALRY WHICH IS THE SMALLEST SALARY OF ANY OF THE DEPARTMENTS.
select employee_id,first_name,last_name,salary,department_id,job_id from employees
where salary=(select min(salary) from employees);

-- WAQ TO GET THE DETAOILS OF EMPLOYEES WHO ARE MANAGERS.
select count(distinct(manager_id)) from employees; -- 18 different manager id
select * from employees where employee_id in(select manager_id from employees);

-- WAQ TO GET THE DETAILS OF EMPLOYEED WHO MANAGE A DEPARTMENT.
select * from employees where employee_id in(select manager_id from employees);

-- WAQ TO DISPLAY THE DEPARTMENT_ID AND THE TOTAL SALRY FOR THOSE DEPARTMENTS WHICH CONTAINS ATLEAST ONE EMPLOYEE.
select department_id,count(employee_id),sum(salary) from employees
group by department_id having department_id is not null and count(employee_id)>=1;

-- WAQ TO DISPLAY THE NAME (FIRSTAND LAST ) AMD DEPARTMENT FOR ALL EMPPLOYEES FOR EXISTENCE OF THOSE EMPLOYEES WHOSE SALARY IS MORE THAN 3700.
select employee_id,first_name,last_name,department_id,salary from employees
where salary>3700;
-- or
select employee_id,concat(first_name,' ',last_name),department_id,salary from employees
where exists(select salary from employees) and salary>3700;

-- WAQ TO DISPLAY ALL THE INFO OF THOSE EMPLOYEES WHO DIS NOT HAVE ANY JOB IN THE PAST.
-- OR WAQ TO DISPLAY ALL THE INFO THOSE EMPLOYEES WHO ARE FRESHERS.
select count(distinct(employee_id)) from job_history;
select * from employees where employee_id not in(select employee_id from job_history);

-- WAQ TO DISPLAY EMPLOYEE NAME(FIRST,LAST),EMPLOYEE_ID AND JOB TITLE FOR ALL EMPLOYEES WHOSE LOCATION IS TORONTO.
select e.employee_id, concat(e.first_name,' ',e.last_name) as 'Name', j.job_title, l.city
from employees e, jobs j, departments d, locations l
where e.job_id=j.job_id and e.department_id=d.department_id
and d.location_id=l.location_id and l.city='Toronto';

select * from locations where city='Toronto';
select * from departments where location_id=1800;
select * from employees where department_id=20;



