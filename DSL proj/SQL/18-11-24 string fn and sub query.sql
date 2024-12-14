-- math function (10 aggregate fn-min(),max(),count(),sum(),avg() 2) scalar fn- round(),power(),abs(),floor(),sign())
-- date fn (now(),month(),yar(),dayname(),week(),day(),monthname())

use schooldb;
show tables;


select adddate(now(),5); -- adding 5 days
select date_add(now(),interval 5 day);
select date_add(now(),interval 5 month);
select date_add(now(),interval 5 year);
select date_add('2020-03-21',interval 5 day);

select date_sub(now(),interval 5 day);
select date_sub(now(),interval 5 month);
select date_sub(now(),interval 5 year);
select date_sub('2020-03-21',interval 5 day);

select datediff(now(),'2020-03-21');

-- date formatting
select date_format('2020-03-21','%D-%M-%Y');

select ename,dob from emp;
select ename,date_format(DOB,'%D %M %Y') from emp;
select date_format('2020-03-21','%D-%M-%Y');
select date_format('2020-03-21','%d-%m-%y');
select date_format('2020-03-21','%D-%m-%y');
select date_format('2020-03-21','%d-%M-%y');
select date_format('2020-03-21','%d-%m-%Y');
select date_format('2020-03-21','%D-%M-%Y %T');
select date_format('2020-03-21','%D-%M-%Y');  -- shows error as %T was not written
select date_format('2020-03-21 11:32:00','%D-%M-%Y %T') as 'date with time';

select time('2020-02-21 11:36:30');
select hour('2020-03-21 11:36:30');
select minute('2020-03-21 21;32;34');
select second('2020-03-21 23;22;23');

select time(now());
select hour(now());
select minute(now());
select second(now());

-- String Function
select char_length("SQL");
select character_length("SQL");
select character_length("HELLO PPL OF THE INTERNET");
select length("HELLO GUYS");
select length("844564");
select length("844564.225");

select email,length(email) from emp where length(email)>18;

select email,length(salary) from emp where length(salary)>7;
select * from emp;
select email,salary,length(round(salary)) from emp where length(round(salary))>4;

-- concatenation joining two  or more string/column
select concat("Hi","Welcome");
select eid,ename from emp;
select concat(eid,"-",ename) from emp;
select concat(eid," ",ename,"-", email) from emp;

select upper('Hellu');
select ucase('hellu');
select concat(eid," ",upper(ename),"-",ucase(city)) as 'ID name' from emp;

select lower('Hellu');
select lcase('hellu');
select concat(eid," ",lower(ename),"-",lcase(city)) as 'ID name' from emp;

select reverse("NAMAN");
select reverse(12345);
select replace("Hello World",'o','U');
select * from emp;

-- WAQ to show emp name with cities in abbreviated form (ie., Mumbai as MU,Delhi as Dl,etc.)
select ename,city,
case 
when city='mumbai' then replace(lower(city),'mumbai','MU')
when city='delhi' then replace(lower(city),'delhi','DL')
when city='gujrat' then replace(lower(city),'gujrat','GJ')
when city='banglore' then replace(lower(city),'banglore','BL')
else city
end 'City Code' 
from emp;

select left('good afternoon',4); -- show upto 4 char from left side
select right('good afternoon',9); -- shows upto 7 char from right side

select substring("Welcome",4); -- shows chars starting from the 5 letter of the word
select substr("Welcome",4); -- eg.come
select substr("WELCOMES",2,5);  -- strats from 2nd letter and ends on next 5 letters incl 2nd letter of thr word

select substr("welcome sql",5,9);

select lpad("itv",10,"BR"); -- left side adding BR till orignal string counts til 10








