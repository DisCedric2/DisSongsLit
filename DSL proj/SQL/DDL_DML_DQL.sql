use ecommerce;
show tables;
create table customer2 as select * from customer1;
select * from customer2;
show tables;
create table customer3 as select * from customer1;
select * from customer3;

drop table customer3; -- completely deletes a schema for eg. table customer3
-- select * from customer3; -- error table doesnt exists

-- rename (changes table name)
select * from customer2;
rename table customer2 to cust2;
select * from cust2;

-- truncate (removes all values/records/rows/tuples)
select * from cust2;
truncate cust2;
select * from cust2;
truncate table cust2;
select * from cust2;

-- DML(insert,update,delete)
-- update(to modify the values of tables)
-- syntax
-- update table tbname set colname=value;
-- update table tbname set colname-value where condition;
-- update table tbname set colname1=value, colname2=value where condition;
-- update table tbname set colname=value where condition1 and condition2;
-- update table tbname set colname=value where colname in (val1,val2);

select * from customer1;
-- WAQ to update email id of customer1 and set email as 'ced@hotmail.com'

update customer1 set email='cedjr@hotmail.com' where cid=1;
select * from customer1;

-- WAQ to update dateofbirth, mobile,email and address of customer id 3.
update customer1 set dateofbirth='1998-05-05',mobile=8475125896,email='neeldown@gmail.com',address='bandra' where cid=3;
select * from customer1 where cid=3;
select * from customer1;

-- WAQ to add country for all customer and updates the record as 'India' for all.
alter table customer1 add country char(25);
select * from customer1;
update customer1 set country='India';
select * from customer1;

-- WAQ to update country for customer1 who stays in Malad and Goregaon set USA.

update customer1 set country='USA' where address='Malad' or address='goregaon';
select * from customer1;

-- WAQ to update country for customer1 who stays in Malad and Goregaon set US.
update customer1 set country='US' where address in ('malad','andheri');
select * from customer1;

-- delete (removing rows rom table)
-- syntax
-- delete from tablename;
-- delete from tablename wgere condition;
-- delete from tablename where condition1 and/or condition2;
-- delete from tablename where colname in(val1,val2);

-- WAQ to remove customer id 3record.
select * from customer1;
delete from customer1 where cid=3;
select * from customer1;

-- WAQ to remove customer who stays at malad and who is male.
delete from customer1 where address='malad' and gender='male';
select * from customer1;

-- WAQ to remove customer whose id are 2 and 4.
delete from customer1 where cid in(2,4);
select * from customer1;

create table cust3 as select * from customer;
select * from cust3;
delete from cust3;
select * from cust3;