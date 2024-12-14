use schooldb;
show tables;
desc student;
desc marks;         

-- Syntax
-- select tb1.col1,tb2.col2,..
-- from table1 tb1 inner join table2 tb2 on/using condition;

-- intersection by using (Inner,Natural,Equi-Joins);
select * from student;
select * from marks;

-- find students whose maks are given
select student.Sid,student.Fname,marks.TotalMarks from student,marks
where student.Sid=marks.Sid; -- this is an eg. of equi join
-- OR
select student.Sid,student.Fname,marks.TotalMarks
 from student inner join marks where student.Sid=marks.Sid; -- inner join with where clause this is popular one
-- OR
select student.Sid,student.Fname,marks.TotalMarks
 from student inner join marks on student.Sid=marks.Sid;  -- inner join with on clause
 
 select student.Sid,student.Fname,marks.TotalMarks 
 from student inner join marks using(Sid); -- inner join with using clause
-- OR
select student.Sid,student.Fname,marks.TotalMarks 
from student join marks where student.Sid=marks.Sid; -- inner join with on clause but works when written join only. this is popular one
-- OR
select student.Sid,student.Fname,marks.Totalmarks
from student natural join marks; -- natural join without condition

update marks set TotalMarks=null where Sid=5;
select * from marks;

-- final answer for find students whose maks are given
select s.Sid,s.Fname,m.TotalMarks
from student s join marks m on s.Sid=m.Sid and m.TotalMarks is not null;

-- Outer Join
-- Left OJ & Right OJ
select s.sid,s.Fname,m.TotalMarks
from student s left join marks m on s.sid=m.Sid; -- Left OJ

select s.sid,s.Fname,m.TotalMarks
from student s right join marks m on s.sid=m.Sid; -- Right OJ

select s.sid,s.Fname,m.TotalMarks
from student s right outer join marks m on s.sid=m.Sid; -- Right outer OJ

-- full outer join (combine left+right)
select s.sid,s.Fname,m.TotalMarks
from student s left outer join marks m on s.sid=m.Sid
union
select s.sid,s.Fname,m.TotalMarks
from student s right join marks m on s.sid=m.Sid;
select * from  marks;

select *
from student s left outer join marks m on s.sid=m.Sid
union
select *
from student s right join marks m on s.sid=m.Sid;

-- Cross Join is a cartisian product
select * from student cross join marks;

select * from student;
update student set city='Andheri' where Sid=4;

-- self join
-- WAQ to show studnets who stays in same city
select * from student;
select s1.Sid,s1.Fname,s2.city from student s1, student s2
where s1.Sid!=s2.Sid and s1.city=s2.city; -- random format because s1 is placed 1
-- OR
select s1.Sid,s1.Fname,s2.city from student s1, student s2
where s1.Sid!=s2.Sid and s1.city=s2.city order by s1.sid;  -- as per ascend sid order

select s1.Sid,s1.Fname,s2.country from student s1, student s2
where s1.Sid!=s2.Sid and s1.country=s2.country order by sid;

