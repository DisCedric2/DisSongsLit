use schooldb;
show tables;

-- Sub-query with create, insert, update and delete
create table emp2 as select eid,ename,email from emp; -- withput key constraint
create table emp3 as select * from emp; -- withput key constraint
select * from emp2;
desc emp2;
select * from emp3;
desc emp3;

-- TCL (commit,rollback,savepoint).
start transaction;
delete from emp2;
select * from emp2;
rollback;
select * from emp2; -- ny using rollback delete operation has been undo.
commit;
delete from emp3;
select * from emp3;
select * from emp;

-- WAQ  to insert male employee records in emp3 from emp.
insert into emp3 select * from emp where gender='male';
select * from emp3;
rollback;
delete from emp3;
rollback;
select * from emp3;

-- WAQ to delete employee records who are from 'mumbai' from emp3  but compoare from emp.
delete from emp3 where city in(select city from emp where city='Mumbai');
select * from emp3;

start transaction;
savepoint beforeupdate;

-- WAQ to update country as 'USA' for employee who are from 'delhi' from emp3 but compare the emp.
UPDATE EMP3 SET COUNTRY='USA'
WHERE CITY IN(SELECT CITY FROM EMP WHERE CITY='DELHI');
SELECT * FROM EMP3;
ROLLBACK TO BEFOREUPDATE;
SELECT * FROM EMP3;

-- VIEWS IS A VIRTUAL TABLE
SELECT * FROM EMP;
CREATE VIEW DISPLAYAGE AS SELECT EID,ENAME,DOB,YEAR(NOW())-YEAR(DOB) AS 'AGE' FROM EMP;
SELECT * FROM DISPLAYAGE;
INSERT INTO EMP VALUES(11,'BEN10','MALE','9876543519','BEN10@gmail.com','Mumbai','1995-04-30',984651,'India');
DESC EMP;
SELECT * FROM DISPLAYAGE;
INSERT INTO DISPLAYAGE VALUES(12,'BEHEN10','1996-05-31',YEAR(NOW())-YEAR(DOB)); -- ERROR
DELETE FROM DISPLAYAGE WHERE EID=11; -- DELETES FOROM OG TABLE AS WELL
SELECT * FROM DISPLAYAGE;
SELECT * FROM EMP;

UPDATE DISPLAYAGE SET ENAME='SOOJA' WHERE EID=10; -- ALSO UPDATES IN OG TABLE EG. EMP
SELECT * FROM DISPLAYAGE;
SELECT * FROM EMP;

-- PL/SQL
-- STORED PROCEDURE







