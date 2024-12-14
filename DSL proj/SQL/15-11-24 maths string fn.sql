use schooldb;
-- aggregate function 9count(),ming(),max(),sum(),avg())
-- find total count of student
select count(Sid) from student;
select count(email) from student;
use ecommerce;
-- find total count of customer
select count(cid) from customer;
select count(email) from customer;
select count(*) from customer;
select * from product;

use schooldb;
-- WAQ to show highest totalmarks
select max(TotalMarks) from marks;
select min(TotalMarks) from marks;

-- WAQ to show highest totalmarks ofs student
-- select Sid,max(TotalMarks) from  marks; -- error beaucse tehre is M:1 relationship
select * from marks where totalmarks =(select max(TotalMarks) from marks);

-- WAQ to show lowest totalmarks
select min(totalmarks) from marks;
select * from marks where totalmarks  =(select max(totalmarks) from marks); -- for student

-- WAQ to show total of all student marks
select sum(totalmarks) from marks;
select* from marks;

-- WAQ to show average marks from all student marks
select avg(totalmarks) from marks;

-- WAQ to show how many cities are there where students are belong
select count(distinct(city)) from student;
select * from student;
-- WAQ to show how many cpuntry are there where students are belong
select count(distinct(country)) from student;

-- WAQ to display count of students as per countries or city
select count(city) from student group by city;
select count(city) from student group by country;
select city,count(*) from student group by city;
select country,count(Sid) from student group by country;

-- Group by and having clause
-- group by (grouping a column which has duplicate record and as summarized result with and
-- withoutapplying comdition by having clause
-- whenver we want to use group by then compulsory used groun/aggregate functn in select clause
-- haivng clause is condition which written when we use group by

select * from emp;
-- WAQ to show employees as per gender (eg. count of male, ffemale, and other)
select gender,count(eid) from emp group by gender;
select gender,count(eid) as 'Empoloyee Gender' from emp group by gender;

-- WAQ to show employee sum of salarieds as per cities and show employee cint as per
select city,sum(salary) as 'Employees Salary',count(eid) as 'employee count' from emp group by city;

select count(*),sum(salary) from emp where city='delhi';

-- WAQ to show employees sum of salaries as per cities for mumbai and bangalore and show count of emp but show only for those whose tota is above 125000.
select city,sum(salary),count(eid) from emp
where city in('mumbai','banglore') group by city having sum(salary)>125000;
-- OR
select city,sum(salary),count(eid) from emp group by city
having city in('mumbai','banglore') and sum(salary)>125000;

CREATE DATABASE STORE;
USE STORE;

CREATE TABLE ITEMS_ORDERED (
    customerid INT,
    order_date DATE,
    item VARCHAR(50),
    quantity INT,
    price DECIMAL(10, 2)
);

INSERT INTO ITEMS_ORDERED (customerid, order_date, item, quantity, price) VALUES
(10330, '1999-06-30', 'Pogo stick', 1, 28.00),
(10101, '1999-06-30', 'Jhandu Baam', 1, 58.00),
(10298, '1999-07-01', 'Skateboard', 1, 33.00),
(10101, '1999-07-01', 'Life Vest', 4, 125.00),
(10299, '1999-07-06', 'Parachute', 1, 1250.00),
(10339, '1999-07-27', 'Umbrella', 1, 4.50),
(10449, '1999-08-13', 'Unicycle', 1, 180.79),
(10439, '1999-08-14', 'Ski Poles', 2, 25.50),
(10101, '1999-08-18', 'Rain Coat', 1, 18.30);
SELECT * FROM ITEMS_ORDERED;
CREATE TABLE CUSTOMERS (
    customerid INT PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50)
);

INSERT INTO CUSTOMERS (customerid, firstname, lastname, city, state) VALUES
(10101, 'John', 'Gray', 'Lynden', 'Washington'),
(10298, 'Leroy', 'Brown', 'Pinetop', 'Arizona'),
(10299, 'Elroy', 'Keller', 'Snoqualmie', 'Washington'),
(10315, 'Lisa', 'Jones', 'Oshkosh', 'Wisconsin'),
(10325, 'Ginger', 'Schultz', 'Pocatello', 'Idaho'),
(10329, 'Kelly', 'Mendoza', 'Kailua', 'Hawaii'),
(10330, 'Shawn', 'Dalton', 'Cannon Beach', 'Oregon'),
(10338, 'Michael', 'Howell', 'Tillamook', 'Oregon'),
(10339, 'Anthony', 'Sanchez', 'Winslow', 'Arizona'),
(10408, 'Elroy', 'Cleaver', 'Globe', 'Arizona');
SELECT * FROM CUSTOMERS;
select * from items_ordered;
update items_ordered
set item='Jhandu Baam' where customerid=10101;

drop table items_ordered;
select * from items_ordered;

-- WAQ find count of custoner as oer state
select state,count(customerid) from customers group by state;

select * from customers;
select * from items_ordered;
select * from login;
-- find total price paid by each customers for order placed.
select customerid as 'Cid',sum(quantity*price) as 'Total Price' from items_ordered group by customerid;

-- find total price paid by each customer for every order placed and show count orders.
select customerid,sum(quantity*price), count(customerid) 'Count of Orders' from items_ordered group by customerid;

-- find total price paid by each customer for every order placed and show count orders but display
-- above result as per price high to low
select customerid,sum(quantity*price), count(customerid) 'Count of Orders' 
from items_ordered group by customerid order by (sum(quantity*price)) desc limit 1,1;

-- find total price paid by each customers for every order placed and show count orders but show
-- only customer who placed more than 1 order
select customerid,count(customerid) 'count of orders', sum(quantity*price) as 'total price'
from items_ordered group by customerid having count(customerid)>1;

-- find customer count as per order placed on same date
select order_date,count(customerid) from items_ordered group by order_date;

-- find customer count as per placed on same date and show total price only greater than 100
select order_date,count(customerid),sum(quantity*price)
from items_ordered group by order_date having sum(quantity*price)>100;

-- find customer count as per order placed on 13th Aug 1999 and show total price only greater than 100.
select order_date,count(customerid),sum(quantity*price)
from items_ordered where order_date='1999-08-13'
group by order_date having sum(quantity*price)>100;

-- Date Function
select now();
select sysdate();
select curdate();
select current_date();
select current_time();
select current_timestamp();
select curtime();
select day('2020-03-21');
select day(now());
select dayname('2020-03-21');
select dayname(now());
select dayofmonth('2020-03-21');
select dayofmonth(now());
select dayofweek('2020-03-21'); -- counts sunday as 1
select dayofweek(now()); -- since sunday
select dayofyear('2020-02-21');
select dayofyear(now());
select month('2020-03-21');
select month(now());
select monthname(now());
select year('2020-03-21');
select year(now());
select yearweek('2020-03-21');
select yearweek(now());
select week('2020-03-21');
select week(now());
select weekofyear('2020-03-21');
select weekofyear(now());

-- insert new record in items_ordered for today's date 
insert  into items_ordered values (10101,now(),'smartwatch',9,3000);
select * from items_ordered;

-- WAQ to show items orders which are placed on day as 13
select * from items_ordered where day(order_date)=13;

-- WAQ to show items whose order placed in month of August and current month
select * from items_ordered where monthname(order_date)='August' or monthname(order_date)=monthname(now());
-- OR
select * from items_ordered where month(order_date)=8 or month(order_date)=month(now());

use schooldb;
select * from student;
-- WAQ to show age of all students as per birthday.
select Sid,Fname,DOB,year(now())-year(DOB) as 'Age' from student;

-- WAQ to show age of all studnets as per birthday but showw thopse whoa are tuning up 23.
select Sid,Fname,DOB,year(now())-year(DOB) as 'Age' from student 
where year(now())-year(DOB)=22 or year(now())-year(DOB)=31;

-- WAQ to show students whose birthday's are in next week	
select Sid,Fname,DOB from student where week(DOB)=week(now())+1;

-- WAQ to show students whose birthday's are in next month	
select Sid,Fname,DOB,month(DOB) as 'month' from student where month(DOB)=(month(now())+0);