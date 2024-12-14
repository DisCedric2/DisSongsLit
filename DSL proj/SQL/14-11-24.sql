-- revision
-- constraint - UK,PK,FK,Check,Not Null, Deafult,Index
-- clause -order by -distinct()

-- limit
 use schooldb;
 show tables;
 select * from marks;
 
 -- limit (used to show specified row count
 
 -- WAQ to show 1st student data. 
 select * from student limit 1 ;
 
 -- WAQ to show last student data.
 select * from student order by Sid desc limit 1;
 
 -- WAQ to show 2nd student data.
 select * from student limit 2; -- doesnt work shows 2ata time
 select * from student limit 1,1; -- 1 offset 1 
 
 -- WAQ to show 3rd and 4th student record.
 select * from student limit 2,2;
 
 -- WAQ to show 2nd last student record.
 select * from student order by Sid desc limit 1,1;
 select * from student where gender='male' order by Sid desc limit 1; -- buy using where clause
 
 -- WAQ to show 2nd highest scoorer of student details.
 select * from marks;
 select * from marks order by totalmarks desc limit 1,1;
 
 -- WAQ to show 3rd and 5th student record.
 (select * from student limit 2,1) union (select * from student limit 4,1);
 
 -- select case statement it is block where we can show result as condition matches
 -- WAQ to show grade as per totalmarks if totalmark>=8 and totalmark>=80 then 'O' grade
 -- if total marks>=60 and tablemarks<80then "a" grade
 -- if total marks>=40 and tablemarks<80then "b" grade
 -- if total marks>60 and tablemarks<80then failed
 -- if totalmarks<0 and totalmarks>100 then 'invalid marks'
 
 
 select * from marks; 
insert into marks value (5,50);
insert into marks value (6,30);
select *,
 case 
 when totalmarks>=80 and totalmarks<=100 then 'O Grade'
 when totalmarks>=60 and totalmarks<80 then 'A Grade'
 when totalmarks>=40 and totalmarks<60 then 'B Grade'
 when totalmarks>=0 and totalmarks<40 then 'Failed'
 else 'Invalid Marks'
 end as 'Grade'
 from marks;
 
 -- views is a virtual table (also follow DML and created using select)
 
 -- show above result by creating view and use every time whenver required
 create view displaygrade as
select *,
 case 
 when totalmarks>=80 and totalmarks<=100 then 'O Grade'
 when totalmarks>=60 and totalmarks<80 then 'A Grade'
 when totalmarks>=40 and totalmarks<60 then 'B Grade'
 when totalmarks>=0 and totalmarks<40 then 'Failed'
 else 'Invalid Marks'
 end as 'Grade'
 from marks;
 
 select * from displaygrade;
 
 -- Built In Function
 -- function is block used to avoid repetitiopn o fcode and called N number of tie
 -- 3 types of built in function 1) Math 2) Date 3) String
 -- 1) math fn -Scalar -Aggregate/Group
 
 -- Scalar Function
 select sqrt(5755);
 select power(6,9);
 select pow(6,9);
 select round(31331.313);
 select round(31331.932);
 select floor(21323.921); -- truncate the decimal digit
 
create table emp
(
eid int primary key auto_increment,
ename char(20) not null,
gender enum('male','female','other') not null,
mobile bigint not null,
email varchar(20) unique,
city set('mumbai','delhi','pune','gujrat','banglore') not null,
dob date,
salary decimal(8,2) check (salary>0),
country char(20) default 'INDIA'
);

select * from emp;

INSERT INTO emp (ename, gender, mobile, email, city, dob, salary) 
VALUES ('Discedric', 'male', 9876543210, 'john.doe@example.com', 'mumbai', '1990-05-15', 55000.00);

-- Insert 2nd employee
INSERT INTO emp (ename, gender, mobile, email, city, dob, salary) 
VALUES ('Jhandu Baam', 'female', 9876543211, 'jhandu@example.com', 'delhi', '1985-08-22', 60000.50);

-- Insert 3rd employee
INSERT INTO emp (ename, gender, mobile, email, city, dob, salary) 
VALUES ('Orry', 'other', 9876543212, 'alex.j@example.com', 'pune', '1992-11-03', 48000.75);

-- Insert 4th employee
INSERT INTO emp (ename, gender, mobile, email, city, dob, salary) 
VALUES ('chris', 'male', 9876543213, 'chrisl@example.com', 'gujrat', '1988-02-17', 52000.00);

-- Insert 5th employee
INSERT INTO emp (ename, gender, mobile, email, city, dob, salary) 
VALUES ('Emily Davis', 'female', 9876543214, 'emilis@example.com', 'banglore', '1995-06-30', 75000.25);

-- Insert 6th employee
INSERT INTO emp (ename, gender, mobile, email, city, dob, salary) 
VALUES ('Sophie Wilson', 'female', 9876543215, 'sophie@example.com', 'mumbai', '1991-04-12', 67000.00);

-- Insert 7th employee
INSERT INTO emp (ename, gender, mobile, email, city, dob, salary) 
VALUES ('David Lee', 'male', 9876543216, 'david@example.com', 'delhi', '1989-09-29', 54000.25);

-- Insert 8th employee
INSERT INTO emp (ename, gender, mobile, email, city, dob, salary) 
VALUES ('Laura Martinez', 'female', 9876543217, 'laura@example.com', 'banglore', '1993-01-15', 72000.50);

-- Insert 9th employee
INSERT INTO emp (ename, gender, mobile, email, city, dob, salary) 
VALUES ('Chris Evans', 'male', 9876543218, 'chris@example.com', 'pune', '1986-12-05', 58000.75);

-- Insert 10th employee
INSERT INTO emp (ename, gender, mobile, email, city, dob, salary) 
VALUES ('Natalie Green', 'female', 9876543219, 'natalie@example.com', 'gujrat', '1994-07-20', 64000.00);

select * from emp;

-- WAQ to display round off salary of each employees.
select eid,ename,round(salary) as 'Salary' from emp;

-- WAQ to display name and salary with round off and above 50000.
select ename,round(salary) as 'Salary' from emp where Salary>50000;


select sign(345); -- when +ve then 1
select sign(-330); -- when -ve then -1
select sign(0); -- when o shows then 0 neutral
select abs(454);
select abs(-454); -- converts false to true for eg negative to positive
select ceil(49.3434);
select ceil(49.92939); -- shows next highest intger number
select mod(5,2); -- shows the remainder after division eg 5%2 as 1
select mod(2,5); -- shows the lowest value in the frame eg 2/5 as 2 since cannot be divided

-- aggregate/Group Function -count(),min(),max(),sum(),avg()

-- WAQ find total number of emplyees.
select count(*) from emp;
select count(eid) from emp;

select * from marks; -- total ans 5
select count(*) from marks; -- gives ans 5
select count(Sid) from Marks; -- gives ans 4 because count() doesnt consider null 


 
 