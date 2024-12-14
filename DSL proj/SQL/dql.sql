use ecommerce;
select * from product;

select 6+10;
select 4+5,4-5,4*5,4/5,4%5;
select 90000*12;

-- select colname1,colname2,.. from tabename;
select pid,pname from product;
-- select * from tablename1,tablename2;
select * from customer,product;
-- select colname1 as 'newcolname1' tablename;
select pname from product;
select pname as 'product name' from product; -- rename column temporary
select pname from product;
select * from product;

-- WAQ to show product details by applying 10% discount on price.
select *,price,(price-(price*10)/100) as '10% discount price' from product;

-- WAQ to show product details by applying 10% discount on price.
select *,price-(price*10/100) as '10% discount price'
from product
where category='cloths';

-- WAQ to show product details by applying 10% discount on price with 2% GST Tax.
select *,(price-(price*10)/100)+(price*0.02) as '10% discount price' from product;
select *,(price-(price*10)/100)as '10% Discount',(price-(price*10)/100)+((price-(price*10)/100)*0.02) as '10% Discount with GST' from product;

-- WAQ to show products name and price whose quantity is less than 101;
select pname,price,qty from product where qty<101;
-- OR
select pname,price,qty from product where not(qty<101); -- include 20 (wrnong ans)

-- WAQ to show products details whose price is above 20000 and less 100000.
select * from product where price>20000 and price<100000;

select * from product;

-- WAQ to show products details whose manufacturer  date is 15/09/2024;

select * from product where manfdate='2024-09-15';
select * from customer;

-- find details of female customers
select * from customer where gender='female';

-- dind details of female customers and who stays at goregaon
select * from customer where gender='female'and address='goregaon';

-- find details of female customers and who stays at goregaon
select * from customer where gender='female' and address='malad' or address='goregaon' or address='andheri';
-- or and in cant be given ig same result
select * from customer where gender='female' and address in('malad','goregaon','andheri');
select * from customer;
