-- Revision
-- Arithmatic (+,-,*,/,%) eg. 10%  discount of product price
-- Conditional (<,>,<=,>=,=,!=) eg find product whose price >7000, qty<50).
-- Logical (and, or, not)eg. find vustomer whose age >=18 and age <=60, product price>7000 or qty<50.
-- Range (between) eg. find order form orderdate 1st jan 2024 to 31st oct 2024.
-- List (in or not in) eg. find customer who are fro mumbai delhi oune or price is 4000,2000,10000.
-- Like (%,_) eg. starts with, ends with, gmail, 3 character name
-- is null or is not null eg. find null values means orice not given or name not given.

-- Constraint (allowing appropriate values inside tables) / rules or restrictions.
-- Types (not null, check, default,index,key-unique-primary-foreign)

use ecommerce;
show tables;
select * from customer;
create table newcustomer1 as select * from customer;
select * from newcustomer;

desc customer;
desc newcustomer;
select * from newcustomer1;
drop table newcustomer;

-- not null
-- WAQ Add not null to cname column in newcustomer table
select * from newcustomer1 where cname is null;
alter table newcustomer1 modify cname char(50) not null; -- will show error because column has null value
select * from newcustomer1 where cname is null;
select * from newcustomer1;

update newcustomer1 set cname='jhandu'where cid=6;
select * from newcustomer1 where cname is null;
alter table newcustomer1 modify cname char(50) not null;
desc newcustomer1;
-- insert into newcustomer1 values(5,null,null,null,null,null); -- error cname cannot be null

-- add not null for mobile column
-- alter table newcustomer1 modify bigint not null; -- erro because mobile column has null values
 
 -- removing not null
 alter table newcustomer1 modify cname char(50);
 desc newcustomer1;
 
 insert into newcustomer1 values(5,null,null,null,null,null,null);
 
 -- check constraint
 select * from newcustomer1;
 desc newcustomer1;
 show create table newcustomer1;
 -- add condition for mobile column which should restrict 0 or less than 0 value in newcustomer1 table
 select * from newcustomer1;
 -- alter table newcustomer1 modify mobile bigint check(mobile>0);  error beacuse column has 0 value
update newcustomer1 set mobile=8745896477 where cid=7;
select * from newcustomer1; 
alter table newcustomer1 modify mobile bigint check(mobile>0);
show create table newcustomer1;
desc newcustomer1;

-- update newcustomer1 set mobile=0 where cid=1; error beacuse mobile has been set to >0
insert into newcustomer1 value(9,'baam','female',null,-74444747,null,null);
-- remove check constraint
-- alter table newcustomer1 modify mobile bigint; error beacuse not removed
alter table newcustomer1 drop constraint newcustomer1_chk_1;
select * from newcustomer1;

-- default 
-- add India as default value for address
desc newcustomer1;
insert into newcustomer1(cid,cname,gender) values(11,'disha','female');
select * from newcustomer1;

alter table newcustomer1 modify address varchar(100) default 'India';
select * from newcustomer1;
show create table newcustomer1;
desc newcustomer1;
insert into newcustomer1(cid,cname,gender) values(12,'disha','female');
select * from newcustomer1;

-- to remove default value as India
alter table newcustomer1 modify address varchar(50) default null;
desc newcustomer1;

-- unique key(allows to have unique non-repeated values in column and null as well)
select * from newcustomer1;
desc newcustomer1;

-- adding unique key constraint to email column in newcustomer
alter table newcustomer1 modify email varchar(50) unique key;
desc newcustomer1;
select * from newcustomer1;
-- update newcustomer1 set email='jr@hotmail.com' where cid=3; error because duplicating
-- alter table newcustomer1 modify email varchar(50) not null; errir beacuse column ha null values

-- adding unique key constarint to cid column in customer
alter table newcustomer1 modify cid int unique key;