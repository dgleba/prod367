
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Title:  .
-----------------------2017-12-21[Dec-Thu]15-45PM

use test;
DROP PROCEDURE IF EXISTS addcolumns1;
delimiter ;;
create procedure addcolumns1 ()
begin
    declare continue handler for 1060 begin end; -- this ignores errors if they occur in the following lines. say if the column already exists.
    alter table dc_disciplines add sigpad_supervisor text;
    
end;;
call addcolumns1();;



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
