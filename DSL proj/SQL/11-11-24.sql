show databases;
use ecommerce;
show tables;
select * from product;
select * from customer;
select * from orders;

select * from product where qty between 1 and 10;
select * from product where qty>=1 and qty<=10;

select * from product where manfdate between '2024-01-01' and '2024-08-31';
select * from product where manfdate>='2024-01-01' and manfdate<='2024-08-31';

select * from product where qty in(1,10,5);
select * from product where qty=1 or qty=5;
select * from product where price not in (3000,20000,2000);
select * from product where price in(2000,5000) and manfdate between '2024-01-01' and '2024-11-30';
select * from product where price in(2000,5000) or manfdate between '2024-01-01' and '2024-11-30';

select * from customer where cname like 'N%';
select * from customer where cname like 'M%H';

select * from customer where cname like 'N__L';
select * from customer where cname like '_oo%';

select * from customer where email like '%gmail.com' or email like '%flash.co';
select * from product where description like '%best%';
select * from customer where cname like '___';

select * from customer where cname is null;
select * from customer where email is not null;
insert into customer values(5,'',null,null,null,null,null);
select * from customer where cname is null or cname='';
insert into customer values(6,null,null,null,null,null,null);
insert into customer values(7,'',null,null,0000000000,null,null);
select * from customer where mobile is null or mobile=0;