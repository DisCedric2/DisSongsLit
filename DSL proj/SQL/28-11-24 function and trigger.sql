use hr;
-- write a procedrue to show emp whpse  salary is greater  than 5000 but show only 5 records by using any loop

select count(*) from employees where salary>5000;

delimiter //
create procedure salary()
begin
declare i int default 1;
declare output varchar(20) default '';
select first_name from employees where salary>5000;
while i>5 do
set output=concat(output,first_name,' ');
set i=i+1;
end while;
select output;
end //
call salary; -- wrong ans not showing only 58 employees showing to show specific 5 then use cursor

-- functon - is a block of code whisch is used to aoid repetitiion and called n number of times. 

DELIMITER // 
create function calculatediscount(totalamount float, discountper float) -- it is a user defined function.
returns float
deterministic
begin
declare discount float;
set discount=totalamount*(discountper/100);
return discount;
END //


select calculatediscount(5000,10) as DiscountAmount;
select calculatediscount(100,10) as DiscountAmount;

select salary from employees;
select employee_id,salary,calculatediscount(salary,10) as '10% of salary' from employees;
SELECT EMPLOYEE_ID,SALARY,SALARY*0.1 AS '10% OF SALARY' FROM EMPLOYEES;

-- WIRTE A FUNCTION TO SHOW EMPLOYEES AS PER GIVEN SALARY RANGE.
DELIMITER //
CREATE FUNCTION salaryrange(lower float, higher float)
returns float
deterministic
begin
declare ans float;
set ans=higher-lower;
return ans;
END//
select salaryrange(3000,5000); -- showing higher - lower which in wrong

DELIMITER //
create function GetEmployeebySalary(lower float, higher float)
returns varchar(1000)
deterministic
begin
	declare EmployeeList varchar(1000) default '';
    select group_concat(first_name separator ', ')
    into EmployeeList from employees
    where salary between lower and higher;
    return EmployeeList;
END //
drop function GetEmployeebySalary;

select GetEmployeeBySalary(2000,5000);

-- write a fuction to show uypper hgrade anbd lower grade remark for slaary comparing with 10000 for each emp.

DELIMITER //
CREATE FUNCTION SalaryGrade(salary float)
returns varchar(50)
deterministic
begin
declare remark varchar(20);
if salary>10000 then
set remark='upper grade';
else
set remark='lower grade';
end if;
return remark;
END //

select employee_id,salary,SalaryGrade(salary) as 'Salary Grade' from employees;

create database triggerdb1;
use triggerdb1;
create table table1(id int, name char(20));
create table table2(id int, name char(20));

-- WRITE A TRIGGER FOR INSERT NAME SAME VALUES INTO TABEL2  WHEN INSERTED ON TABLE1.
SELECT * FROM TABLE1;
SELECT * FROM TABLE2;

DELIMITER //
CREATE TRIGGER TrigInsertTable1
after insert
on table1
for each row
begin 
insert into table2(id,name) values(new.id,new.name);
end //

insert into  table1 values(101,'cedric');
insert into table1 values(102,'disha');
insert into  table1 values(103,'syzer');
insert into  table1 values(104,'jhandu');

select * from table1;
select * from table2;

-- deleting trigger
create table table3
(
id int,
name char(20),
tableaction varchar(20),
logdatetime datetime);

delimiter //
create trigger TrigDeleteTable1
before delete
on table1
for each row
begin
insert into table3 values(old.id,old.name,'delete',now());
end //

select * from table3;
delete from table1 where id=101;
select * from table1;
select * from table2;

-- UPDATE TRIGGER ON TABLE1

CREATE TABLE TABLE4
(
username varchar(40),
description varchar(100),
logdatetime datetime);

select user();

delimiter $$
create trigger TrigUpdateTable1
after update
on table1
for each row
begin
insert into table4 values(user(),concat('update table1 record for', old.id, 'Previous Name:', old.name,'New Name:', new.name),now());
end $$

select * from table4;
update table1 set name='pookie' where id=102;
select * from table1;
select * from table4;
select * from table2;