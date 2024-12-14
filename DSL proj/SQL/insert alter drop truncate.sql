use ecommerce;
show tables;
select * from customer;
select * from orders;
select * from product;

insert into customer (cid,cname,gender,dob,mobile,email,address)
values (1,'cedric','male','2001-10-02',7894561320,'ced@hotmail.com','Malad');
select * from customer;

insert into customer values(2,'cedjr','female','2010-10-02',7418529630,'jr@hotmail.com','goregaon');
select * from customer;

-- insert into customer values(3,'seal','male'); -- error column count doesnt match
insert into customer(cid,cname,gender) values(3,'neel','male');
select * from customer;

desc customer;

insert into customer values(4,'discedric',null,null,null,null,'Andheri');
select * from customer;

desc product;
insert into product values
(001,'Apple24','electronics,mobile','good quality',0111,145900,'2024-09-15',1000),
(101,'GucciBag','cloths','preimum quality',null,99000,'2024-10-02',100),
(331,'AdidasYeezy','fashion',null,null,null,'2023-12-31',10);
select * from product;

select * from orders;
insert into orders values(1001,1,1,100);
insert into orders values(1002,101,2,10);
insert into orders values(1003,331,3,9);

select * from orders;

-- alter (add,drop,modify, change, rename)
create table customer1 as select * from customer;
select * from customer1;
desc customer1;
desc customer;

-- adding new cloumn (bydefault adds as last)
-- alter table 'table_name' add 'new_col_name' datatype first/after;
alter table customer1 add age int;
select * from customer1;
desc customer1;

alter table customer1 add (city char(20), country char(30));
desc customer1;
select * from customer1;

alter table customer1 add Aadhar bigint first;
desc customer1;
select * from customer1;

alter table customer1 add Pannum varchar(20) after cname;
desc customer1;
select * from customer1;

-- removing column from table
alter table customer1 drop city;
desc customer1;
alter table customer1 drop country;
alter table customer1 drop age;
alter table customer1 drop Pannum;

desc customer1;
select * from customer1;

-- renaming column name

select * from orders;
alter table customer1 change dob dateofbirth date;

desc customer1;
select * from customer1;

-- modifying column data type
alter table customer1 modify cid varchar(20);
desc customer1;

-- renaming table name
alter table customer1 rename to customer69;
desc customer69;
select * from customer69;

alter table customer69 rename to customer1;






