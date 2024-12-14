create database dishant_db;
show databases;
use dishant_tb;
create table Candidate
(
regid int,
cname char(20),
dob date,
age int,
city char(20),
skillset char(20),
experience int
);
show tables;
insert into candidate (regid,cname,dob,age,city,skillset,experience)
values (1,'ced','2001-10-02',23,'Mumbai','Civil',1);
select * from candidate;
insert into candidate (regid,cname,dob,age,city,skillset,experience)
values (2,'cedri','2002-11-11',20,'Pune','Python',2);
select * from candidate;
insert into candidate (regid,cname,dob,age,city,skillset,experience)
values (3,'cedricjr.','2003-12-29',18,'Delhi','C++',0);
select * from candidate;

alter table candidate add Address varchar(20);
desc candidate;
select * from candidate;

alter table candidate modify experience varchar(20);
select * from candidate;
desc candidate;
alter table candidate drop age;
select * from candidate;

alter table candidate add emailid varchar(50);
select * from candidate;
 
 update candidate set emailid='ced@hotmail.com' where regid=1;
update candidate set emailid='cedri@hotmail.com' where regid=2;
update candidate set emailid='ced@hotmail.com' where regid=3;
select * from candidate;

delete from candidate where regid=1;
select * from candidate;
desc candidate;