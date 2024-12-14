USE HR;
select * from employees;

-- WRITE CURSOR TO PRINT ONLY 10 EMP NAME
DELIMITER //
create procedure empsalary5(inout namelist varchar(200))
begin
declare i int default 1;
declare output varchar(1000) default '';
declare emplistcursor cursor for
select salary from employees;
open emplistcursor;
while i<=5 do
fetch emplistcursor into output;
if salary>5000 then
set namelist=concat(namelist,output,' ');
end if;
set i=i+1;
end while;
close emplistcursor;
END //

set @namelist='';
call emp10(@namelist);
select @namelist as 'Name';

-- WRITE A CURSOR TO SHOW EMP 