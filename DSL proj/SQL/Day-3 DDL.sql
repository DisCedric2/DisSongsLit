show databases;
create database db1;
show databases;
create database db2;
create schema db3;
create DATABASE My_db;
show databases;

# DDL (create,drop)
# create database db_name;
# drop database db_name;

drop database db1;
drop schema db2;
drop database db3;
drop database db3;
-- drop database db5; error-doesn't exist 

select database();   -- showing selected db
show databases;
use my_db;        -- selecting db to work
select database();
use sakila;    -- switch to another db
select database();

create database br417;
use br417;
 select database();
 create table login
 (
 username varchar(20),
 password varchar(50)
);

show tables;
describe login;  -- shows table structure (datatype & constraint)
desc login;   -- shows table structure
show tables;  -- lists the tables present inside database

select * from login;
insert into login values('aaa',123);
insert into login values('bbb','qwertyjaflkhfjkflkfhkfhfhka');
insert into login values('ccc','abc');
insert into login values('ddd',222);
insert into login values('eee',555);

select  * from login;
cdrop table login;
