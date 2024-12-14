-- constraint (not null, default, check, key-unique-primary-foreign)
create database schooldb;
use schooldb;
create table student(Sid int,
Fname char(20) not null,Lname char(20) not null,
Gender enum('Male','Female') not null,DOB date not null,
mobile bigint unique check (mobile>0),email varchar(50) unique,
city varchar(20),country varchar(20) default'India');
desc student;
-- add primary key to Sid
alter table student add primary key (Sid);

-- drop eg to remove primary key of Sid
alter table student drop primary key;
desc student;

-- remove unique for email
-- alter table student drop unique key; -- error beultiple unique keys are applied
show create table student;
alter table student drop constraint email;
desc student; 

alter table student add primary key (Sid);
desc student;
show create table student;
show index from student;

create table marks(Sid int, TotalMarks int,
foreign key(Sid) references student(Sid));
desc marks;
show create table marks;
show index from marks;

-- how to remove and again add foreign key 
alter table marks drop constraint marks_ibfk_1;
alter table marks drop index Sid;
desc marks;
show create table marks;
show index from marks;
-- add foreign key 
alter table marks add foreign key (Sid) references student(Sid);
desc marks;
show create table marks;
show index from marks;

-- add Sid as auto increment
-- alter table student modify Sid int auto_increment;  error because foreign key exists in marks table

insert into student values(1,'Cedric','Diggory','Male','2002-10-02',7418529630,'cedric@hotmail.com','Andheri','India');
insert into student values(2,'Sejal','Kumar','Female','1992-09-12',8751529630,'sejal@hotmail.com','Delhi','India');
insert into student values(3,'Logan','Paul','Male','1995-04-01',6699696969,'logan@hotmail.com','Ohio','India');
insert into student values(4,'Disha','Patani','Female','1993-06-18',8742099630,'disha@hotmail.com','Jharkhand','India');
insert into student values(5,'Jhandu','Baam','Male','2000-01-01',6996699630,'jhandu@hotmail.com','Bihar','India');
select * from student;

insert into marks values(1,99);
insert into marks values(2,89);
insert into marks values(3,79);
insert into marks values(null,69);
delete from marks where Sid=1;
select * from marks;

-- clauses (distinct(),order by,limit,group by)
-- distinct used to display unqiue records

-- WAQ to show student country names only.
select distinct(country) from student;
update student set country='USA' where Sid in(1,3);
update student set country='UK' where Sid in(2,4);
select * from student;
select distinct(country) from student;

-- order by (ascending or descending order)
-- WAQ to display students record as per First name alphabetical order.
select * from student order by Fname;
select * from student order by Fname asc;
-- WAQ to display student record as per birthdate young to old.
select * from student order by DOB desc; -- year sorting descending

-- WAQ to display male students record as per last name.
select * from student where Gender like 'male' order by Lname desc;
