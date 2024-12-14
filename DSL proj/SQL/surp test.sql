use schooldb;
show tables;
select * from emp;
create table emp1 as select * from emp;
select * from emp1;

update emp1 set city='Pune' where eid=3;

delete from emp1 where city='Mumbai';

select * from emp1 where ename='%a';

select eid,ename,(year(curdate())-(year(dob))) as Age from emp1;

alter table emp1 modify eid varchar(10);

select eid,ename,salary,(salary+(salary*0.3)) as 'salary after hike' from emp1;