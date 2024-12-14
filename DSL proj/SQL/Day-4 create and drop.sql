-- Ecimmerce database
-- Tabless(customer, product, orders, payment, cart)
-- Datatypes (number-int, bigint, float, decimal(5,2), string-char(size), varchar(size), DateTime-data,datetime,time)
-- enum(), set()

create database Ecommerce;
show databases;
use Ecommerce;
select database();
-- customer(cid, c name, gender, dob, mobile, email, address)
create table customer
(
cid int primary key,
cname char(50),
gender enum('male','female','other'),
dob date,
mobile bigint,
email varchar(50),
address varchar(100)
);
select * from customer;

desc customer;

-- product(pid, pname, category, description, modelnumber, price, manfdate, qty)

create table product
(
pid int primary key,
pname char(50),
category set('electronics','mobile','cloths','fashion','grocery'),
description varchar(100),
modelnumber varchar(20),
price float,
manfdate date,
qty int
);

select * from product;

desc product;

create table orders
(
oid int primary key,
pid int,
cid int,
qty int,
foreign key (pid) references product (pid),
foreign key (cid) references customer (cid)
);
select * from orders;

desc orders;


