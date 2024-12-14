use ecommerce;
select * from customer;
select * from product;
select * from orders;

-- WAQ to show customers who placed order
select distinct(c.cid),c.cname
from customer c,orders o 
where c.cid=o.cid;

-- WAQ to show customer who placed order for products and show porducts and order details
select distinct(c.cid),cname,p.pid,p.pname,o.oid,p.price, o.qty
from customer c, orders o, product p where c.cid=o.cid and o.pid=p.pid;

-- WAQ to show customer who has not placed order
select c.cid,c.cname,o.oid
from customer c left join orders o on
c.cid!=o.oid; -- left outer join error deosnt work here

-- WAQ to show customer who has not placed order this query can be solved by sub-query
select cid,cname from customer
where cid not in (select cid from orders);

-- WAQto shopw customer who placed order only for whose order qty is more than 5
select c.cid,c.cname,o.qty
from customer c,orders o 
where c.cid=o.cid and o.qty>5;

-- Sub-Query
-- WAQ to show customers who placed order.
SELECT * FROM CUSTOMER
WHERE CID IN(SELECT CID FROM ORDERS); -- OR 
SELECT * FROM CUSTOMER WHERE EXISTS(SELECT CID FROM ORDERS WHERE ORDERS.CID=CUSTOMER.CID); -- OR
SELECT * FROM CUSTOMER WHERE CID=ANY(SELECT CID FROM ORDERS);

-- WAQ TOSHOW CUSTOMER WHO HAVE NPT PLAED ORDER
SELECT * FROM CUSTOMER WHERE CID NOT IN(SELECT CID FROM ORDERS); -- or
SELECT * FROM CUSTOMER WHERE NOT EXISTS(SELECT CID FROM ORDERS WHERE ORDERS.CID=CUSTOMER.CID);


-- WAQ to show customer who placed order and asked for same qty for different or same product
select * from orders;
select c.cid,c.cname,o.oid,o.qty from customer c, orders o where o.qty=any(select qty from orders where c.cid=o.cid);  -- doesnt give correct ans.

-- Use self join
select o1.oid,o1.qty,o1.cid,c.cname from orders o1, orders o2, customer c
where o1.oid!=o2.oid and o1.qty and o1.qty=o2.qty and o1.cid=c.cid;

show databases;
use hr;
show tables;

